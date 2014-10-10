#
# Copyright (C) 2014 Modding.MyMind http://forum.xda-developers.com/member.php?u=5537766
# Copyright (C) 2014 ModdingMyMind https://github.com/ModdingMyMind
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := device/huawei/MT2L03

# Prebuilt kernel
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/kernel:kernel

# Recovery
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/recovery.fstab:recovery/root/etc/recovery.fstab \
    $(LOCAL_PATH)/recovery/myinit.usb.rc:recovery/root/myinit.usb.rc \
    $(LOCAL_PATH)/recovery/init.qcom.usb.sh:recovery/root/etc/init.qcom.usb.sh \
    $(LOCAL_PATH)/recovery/charger:recovery/root/charger \
    $(LOCAL_PATH)/recovery/sbin/adbd:recovery/root/sbin/adbd \
    $(LOCAL_PATH)/recovery/sbin/charge:recovery/root/sbin/charge \
    $(LOCAL_PATH)/recovery/sbin/chargelog.sh:recovery/root/sbin/chargelog.sh \
    $(LOCAL_PATH)/recovery/sbin/e2fsck_s:recovery/root/sbin/e2fsck_s \
    $(LOCAL_PATH)/recovery/sbin/huawei_version:recovery/root/sbin/huawei_version \
    $(LOCAL_PATH)/recovery/sbin/hw_scsi_switch:recovery/root/sbin/hw_scsi_switch \
    $(LOCAL_PATH)/recovery/sbin/libqmi_oem_main:recovery/root/sbin/libqmi_oem_main \
    $(LOCAL_PATH)/recovery/sbin/recovery:recovery/root/sbin/recovery \
    $(LOCAL_PATH)/recovery/sbin/rmt_oeminfo:recovery/root/sbin/rmt_oeminfo \
    $(LOCAL_PATH)/recovery/sbin/rmt_storage:recovery/root/sbin/rmt_storage \
    $(LOCAL_PATH)/recovery/sbin/test_diag:recovery/root/sbin/test_diag \
    $(LOCAL_PATH)/recovery/sbin/usb_update:recovery/root/sbin/usb_update \

# Battery Charging images
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/res/images/720x1280/batt_level_scale.png:recovery/root/res/images/720x1280/batt_level_scale.png \
    $(LOCAL_PATH)/recovery/res/images/720x1280/batt_level_top.png:recovery/root/res/images/720x1280/batt_level_top.png \
    $(LOCAL_PATH)/recovery/res/images/720x1280/bg.png:recovery/root/res/images/720x1280/bg.png \
    $(LOCAL_PATH)/recovery/res/images/720x1280/empty_charge.png:recovery/root/res/images/720x1280/empty_charge.png \
    $(LOCAL_PATH)/recovery/res/images/720x1280/err_charge.png:recovery/root/res/images/720x1280/err_charge.png \
    $(LOCAL_PATH)/recovery/res/images/720x1280/full_charge.png:recovery/root/res/images/720x1280/full_charge.png \
    $(LOCAL_PATH)/recovery/res/images/720x1280/number_0.png:recovery/root/res/images/720x1280/number_0.png \
    $(LOCAL_PATH)/recovery/res/images/720x1280/number_1.png:recovery/root/res/images/720x1280/number_1.png \
    $(LOCAL_PATH)/recovery/res/images/720x1280/number_2.png:recovery/root/res/images/720x1280/number_2.png \
    $(LOCAL_PATH)/recovery/res/images/720x1280/number_3.png:recovery/root/res/images/720x1280/number_3.png \
    $(LOCAL_PATH)/recovery/res/images/720x1280/number_4.png:recovery/root/res/images/720x1280/number_4.png \
    $(LOCAL_PATH)/recovery/res/images/720x1280/number_5.png:recovery/root/res/images/720x1280/number_5.png \
    $(LOCAL_PATH)/recovery/res/images/720x1280/number_6.png:recovery/root/res/images/720x1280/number_6.png \
    $(LOCAL_PATH)/recovery/res/images/720x1280/number_7.png:recovery/root/res/images/720x1280/number_7.png \
    $(LOCAL_PATH)/recovery/res/images/720x1280/number_8.png:recovery/root/res/images/720x1280/number_8.png \
    $(LOCAL_PATH)/recovery/res/images/720x1280/number_9.png:recovery/root/res/images/720x1280/number_9.png \
    $(LOCAL_PATH)/recovery/res/images/720x1280/percent_5.png:recovery/root/res/images/720x1280/percent_5.png \
    $(LOCAL_PATH)/recovery/res/images/720x1280/percent_10.png:recovery/root/res/images/720x1280/percent_10.png \
    $(LOCAL_PATH)/recovery/res/images/720x1280/percent_sign.png:recovery/root/res/images/720x1280/percent_signcd.png \
    $(LOCAL_PATH)/recovery/res/images/charger/battery_0.png:recovery/root/res/images/charger/battery_0.png \
    $(LOCAL_PATH)/recovery/res/images/charger/battery_1.png:recovery/root/res/images/charger/battery_1.png \
    $(LOCAL_PATH)/recovery/res/images/charger/battery_2.png:recovery/root/res/images/charger/battery_2.png \
    $(LOCAL_PATH)/recovery/res/images/charger/battery_3.png:recovery/root/res/images/charger/battery_3.png \
    $(LOCAL_PATH)/recovery/res/images/charger/battery_4.png:recovery/root/res/images/charger/battery_4.png \
    $(LOCAL_PATH)/recovery/res/images/charger/battery_5.png:recovery/root/res/images/charger/battery_5.png \
    $(LOCAL_PATH)/recovery/res/images/charger/battery_charge.png:recovery/root/res/images/charger/battery_charge.png \
    $(LOCAL_PATH)/recovery/res/images/charger/battery_fail.png:recovery/root/res/images/charger/battery_fail.png \
    $(LOCAL_PATH)/recovery/res/images/normal/level0.png:recovery/root/res/images/normal/level0.png \
    $(LOCAL_PATH)/recovery/res/images/normal/level1.png:recovery/root/res/images/normal/level1.png \
    $(LOCAL_PATH)/recovery/res/images/normal/level2.png:recovery/root/res/images/normal/level2.png \
    $(LOCAL_PATH)/recovery/res/images/normal/level3.png:recovery/root/res/images/normal/level3.png \
    $(LOCAL_PATH)/recovery/res/images/normal/level4.png:recovery/root/res/images/normal/level4.png \
    $(LOCAL_PATH)/recovery/res/images/normal/level5.png:recovery/root/res/images/normal/level5.png \
    
