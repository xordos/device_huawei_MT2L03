#!/system/bin/sh
#usage: chargelog.sh  <interval(sec)> <maxline>

PS_PATH="/sys/class/power_supply/"

#if some node infomation is redundant,the node should be commented
#in this array. 

NODE_NAME=( \
#---------------------------------------
#battery power supply
#---------------------------------------
"battery/capacity" \
#"battery/charge_full_design" \
"battery/charge_type" \
"battery/charging_enabled" \
#"battery/current_max" \
"battery/current_now" \
"battery/health" \
"battery/present" \
"battery/status" \
#"battery/system_temp_level" \
#"battery/technology" \
"battery/online" \
"battery/temp" \
"battery/type" \
"battery/voltage_max_design" \
"battery/voltage_min_design" \
"battery/voltage_now" \
"battery/hot_current_limit" \
"battery/factory_diag" \
"battery/online" \
"battery/bat_sts" \
"battery/buck_sts" \
"battery/chg_sts" \
"battery/usb_sts" \
"battery/chg_ctrl" \
"battery/resume_en" \
"battery/boost_en" \
"battery/usb_suspend_en" \
#---------------------------------------
#bms power supply
#---------------------------------------
"bms/capacity" \
#"bms/charge_full_design" \
#"bms/current_max" \
#"bms/current_now" \
#"bms/present" \
#"bms/type" \
#---------------------------------------
#usb power supply
#---------------------------------------
"usb/current_max" \
"usb/online" \
"usb/present" \
"usb/scope" \
"usb/type" \
)

sdcard=1
charge_mode=1

#check if system partition has been mounted,
#if no, shell script can not execute. 
#this code block test this case.

id
if [ $? -ne 0 ];then
    exit
fi

#/* if it's in recovery mode, but not poweroff charge, then return */
cat /proc/cmdline | grep "androidboot.huawei_bootmode=recovery"
if [ $? -eq 0 ];then
    cat /proc/cmdline | grep "androidboot.mode=hwcharger"
    if [ $? -ne 0 ];then
       stop chargelog
    fi
fi

#check if powerdown charge mode.
getprop ro.bootmode | grep hwcharger
if [ $? -eq 0 ];then
    echo "---> power down charge mode"
    charge_mode=0
    
    mount | grep /grow
    if [ $? -ne 0 ];then
        echo "---> internal sdcard is not mounted"
        sdcard=0
    fi
    
    mount | grep /data
    if [ $? -ne 0 ];then
        echo "---> mount data dir"
        mount -t ext4 /dev/block/platform/msm_sdcc.1/by-name/userdata /data
    fi
fi

#check log path
cat /data/property/persist.sys.chargelog | grep data
if [ $? -eq 0 ];then
    log_path="/data/chargelog.txt"
else
    cat /data/property/persist.sys.chargelog | grep sdcard
    if [ $? -eq 0 ];then
        log_path="/sdcard/bugreports/chargelog/chargelog.txt"
        if [ $sdcard -eq 0 ];then
            mount -t vfat /dev/block/platform/msm_sdcc.1/by-name/grow /sdcard
        fi
    else
        echo "---> disable charge log"
        stop chargelog
        read
    fi
fi

echo "---> log path is $log_path"

file_size=0

#for normal boot, wait until the /sdcard is mounted
if [ $charge_mode == 1 ];then
    while true;do
        mount | grep "/storage/sdcard0"
	if [ $? == 0 ];then
            break
        fi
        sleep 1
    done
fi

test -d "/sdcard/bugreports/chargelog/"
if [ $? != 0 ];then
    mkdir -p "/sdcard/bugreports/chargelog/"
fi

#get MT2L03 chargelog
cat /proc/app_info | grep HL1MT2L03
if [ $? -eq 0 ];then
    echo -n "Time Voltage Current SOC RM FCC II SI Temp FLAG Status Qmax Reg[0] Reg[1] Reg[2] Reg[3] Reg[4] Reg[5] Reg[6] Reg[7] Reg[8] Reg[9] Reg[10] Mode" >> $log_path
    echo >> $log_path
    while true
    do
        echo -n `date +%e:%H:%M:%S` >> $log_path
        echo -n ' ' >> $log_path

        echo -n `cat /sys/bus/i2c/drivers/bq27510-battery/gaugelog` >> $log_path
        echo -n ' ' >> $log_path
        echo -n `cat /sys/bus/i2c/devices/2-006b/chargelog` >> $log_path
        echo -n ' ' >> $log_path

        if [ charge_mode -eq 1 ];then
            echo -n "normal" >> $log_path
        else
            echo -n "powerdown" >> $log_path
        fi

        echo >> $log_path

        #get log file size
        TEMP=`ls -s $log_path`
        arr=(${TEMP})
        file_size=${arr[0]}

        if [ $file_size -ge $2 ];then
            mv $log_path $log_path".old"
            file_size=0
        fi
        sync
        sleep $1
    done
fi

#print item name in this loop
cat $log_path | grep time
if [ $? -ne 0 ];then
    echo -n "time " >> $log_path
    for path in ${NODE_NAME[@]}
    do
        echo -n "$path" >> $log_path
        echo -n ' ' >> $log_path
    done
    echo >> $log_path
fi

while :
do
    echo -n `date +%e:%H:%M:%S` >> $log_path
    echo -n ' ' >> $log_path

    for path in ${NODE_NAME[@]}
    do
        echo -n `cat "$PS_PATH$path"` >> $log_path
        echo -n ' ' >> $log_path
    done
    
    if [ charge_mode -eq 1 ];then
        echo -n "normal" >> $log_path
    else
        echo -n "powerdown" >> $log_path
    fi
    
    echo >> $log_path

    #get log file size
    TEMP=`ls -s $log_path`
    arr=(${TEMP})
    file_size=${arr[0]}

    if [ $file_size -ge $2 ];then
        mv $log_path $log_path".old"
        file_size=0
    fi
    sync
    sleep $1
done
