#
# Copyright (C) 2020 Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/realme/spaced

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)

# Parts
$(call inherit-product-if-exists, packages/apps/RealmeParts/parts.mk)

# VNDK
PRODUCT_EXTRA_VNDK_VERSIONS := 30

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 30

# Dynamic Partition
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_EXTRA_VNDK_VERSIONS)/etc/audio_policy_configuration.xml

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth/include

# Bluetooth Audio (System-side HAL, sysbta)
PRODUCT_PACKAGES += \
    audio.sysbta.default \
    android.hardware.bluetooth.audio-service-system

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/bluetooth/audio/config/sysbta_audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysbta_audio_policy_configuration.xml \
    $(DEVICE_PATH)/bluetooth/audio/config/sysbta_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUTY_SYSTEM)/etc/sysbta_audio_policy_configuration_7_0.xml

# Dex
PRODUCT_DEXPREOPT_SPEED_APPS += \
    Settings \
    SystemUI

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service.spaced

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.fingerprint.xml

# HIDL
PRODUCT_PACKAGES += \
    libhidltransport \
    libhwbinder \
    libhardware

# ImsInit hack
PRODUCT_PACKAGES += \
    ImsInit

# Init
PRODUCT_PACKAGES += \
    init.mt6781.rc \
    perf_profile.sh

# Keylayouts
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/keylayout/touchpanel.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/touchpanel.kl

# Screen density
PRODUCT_AAPT_CONFIG := xxxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.spaced

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay

# MTK IMS Overlays
PRODUCT_PACKAGES += \
    mtk-ims \
    mtk-ims-telephony

# MTK InCallService
PRODUCT_PACKAGES += \
    MtkInCallService

# Permissions
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/permissions/privapp-permissions-mediatek.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-mediatek.xml

# Power
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/power/powercontable.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/powercontable.xml \
    $(DEVICE_PATH)/configs/power/powerscntbl.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/powerscntbl.xml \
    $(DEVICE_PATH)/configs/power/power_app_cfg.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/power_app_cfg

# Ramdisk
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/vendor_overlay/etc/fstab.mt6781:$(TARGET_COPY_OUT_RAMDISK)/system/etc/fstab.mt6781

# RcsService
PRODUCT_PACKAGES += \
    com.android.ims.rcsmanager \
    RcsService \
    PresencePolling

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# System prop
-include $(DEVICE_PATH)/configs/properties/system_prop.mk
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# Symbols
PRODUCT_PACKAGES += \
    libshim_vtservice

PRODUCT_PACKAGES += \
    ImsServiceBase

# Vendor overlay
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/vendor_overlay/,$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/30/)

# Wi-Fi
PRODUCT_PACKAGES += \
    TetheringConfigOverlay \
    WifiOverlay \
    DozeOverlaySystem \
    DozeOverlaySystemUI \
    NotchBarKiller

# Call proprietary blob setup
$(call inherit-product, vendor/realme/spaced/spaced-vendor.mk)
$(call inherit-product, vendor/realme/ims-spaced/mtk-ims.mk)
