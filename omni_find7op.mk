# Copyright (C) 2010 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for grouper hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Sample: This is where we'd set a backup provider if we had one
# $(call inherit-product, device/sample/products/backup_overlay.mk)

# Get the long list of APNs
PRODUCT_COPY_FILES := device/oppo/find7op/configs/apns-full-conf.xml:system/etc/apns-conf.xml

# SIM Toolkit
PRODUCT_PACKAGES += \
    Stk

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# must be before including omni part
TARGET_BOOTANIMATION_SIZE := 1080x720

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/oppo/find7op/device.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := omni_find7op
PRODUCT_DEVICE := find7op
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := A0001
PRODUCT_MANUFACTURER := OnePlus

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_PRODUCT=FIND7OP \
    TARGET_DEVICE=A0001 \
    BUILD_FINGERPRINT="4.3/JLS36C/1390465867:user/release-keys" \
    PRIVATE_BUILD_DESC="msm8974-user 4.3 JLS36C eng.root.20140510.152835 release-keys"

# Inline kernel
TARGET_KERNEL_SOURCE := kernel/oneplus/msm8974
TARGET_KERNEL_CONFIG := bacon_defconfig

# Inherit from proprietary blobs
$(call inherit-product-if-exists, vendor/oppo/find7op/find7op-vendor.mk)
