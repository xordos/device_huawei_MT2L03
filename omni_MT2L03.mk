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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, vendor/omni/config/common.mk)
$(call inherit-product, device/huawei/MT2L03/device.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# Not in use by me for TWRP which is why I check with "if"
# Really only needed if attempting to build CM or other custom Roms
# In this case we are merely building a custom recovery
$(call inherit-product-if-exists, vendor/huawei/MT2L03/MT2L03-vendor.mk)


PRODUCT_DEVICE := MT2L03
PRODUCT_NAME := omni_MT2L03
PRODUCT_BRAND := Huawei
PRODUCT_MODEL := MT2L03
PRODUCT_MANUFACTURER := HUAWEI

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID="HuaweiMT2L03" BUILD_FINGERPRINT="qcom/msm7627a/msm7627a:2.3.5/GRJ90/eng.hongtao.20111013.064550:eng/test-keys" PRIVATE_BUILD_DESC="msm7627a-eng 2.3.5 GRJ90 eng.hongtao.20111013.064550 test-keys"
