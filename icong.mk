# icong.mk
# Device configuration file. 
# Re-written by Benjamin Gwynn

# Licensed under the Apache License, Version 2.0.
# Copyright (C) 2009 The Android Open Source Project
# Copyright (C) 2011 The CyanogenMod Project
# Copyright (C) 2014 Benjamin Gwynn <http://xenxier.tk>

LOCAL_DIR := device/htc/icong
LOCAL_PATH := $(LOCAL_DIR)

## Call vendors:
$(call inherit-product, vendor/htc/icong/icong-vendor.mk)		# Include icong vendor

# Permissions
## Copy the following permission files for our hardware.
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# Copy low-level system files
## Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/ramdisk/fstab.icong:root/fstab.icong \
    $(LOCAL_PATH)/config/ramdisk/init.icong.rc:root/init.icong.rc \
    $(LOCAL_PATH)/config/ramdisk/init.icong.usb.rc:root/init.icong.bluez.rc \
    $(LOCAL_PATH)/config/ramdisk/ueventd.icong.rc:root/ueventd.icong.rc

## Replacement binaries (fix for akmd)
#PRODUCT_COPY_FILES += \
#    $(LOCAL_DIR)/config/bin/linker:system/bin/linker

# Copy configurations 
## Touchscreen Configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_DIR)/config/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \
    $(LOCAL_DIR)/config/idc/cy8c-touchscreen.idc:system/usr/idc/cy8c-touchscreen.idc

## Dirty fix for wifi
PRODUCT_COPY_FILES += \
    device/htc/icong/prebuilt/bcm4329.ko:system/lib/modules/bcm4329.ko

## Keylayout configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_DIR)/config/key/icong-keypad.kl:system/usr/keylayout/icong-keypad.kl \
    $(LOCAL_DIR)/config/key/icong-keypad.kcm.bin:system/usr/keychars/icong-keypad.kcm.bin \
    $(LOCAL_DIR)/config/key/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    $(LOCAL_DIR)/config/key/cy8c-touchscreen.kl:system/usr/keylayout/cy8c-touchscreen.kl

# Install hardware packages
## Sensors
PRODUCT_PACKAGES += \
    sensors.msm7x27

## GPS
PRODUCT_PACKAGES += \
    gps.msm7x27 \
    librpc

# Install software application packages
## Marvel-supported packages
PRODUCT_PACKAGES += \
    Torch

## Additonal packages
PRODUCT_PACKAGES += \
    Email2 \
    Exchange2 \

## Camera
PRODUCT_PROPERTY_OVERRIDES += \
    ro.htc.camerahack=msm7k

## Media
PRODUCT_PROPERTY_OVERRIDES += \
    media.a1026.nsForVoiceRec = 0 \
    media.a1026.enableA1026 = 1

## Storage
PRODUCT_PROPERTY_OVERRIDES += \
    ro.phone_storage=0

# Device overlays
## Tell the compiler to use overlays found in the following folder:
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_DIR)/overlay

# inherit from msm7x27-common
$(call inherit-product, device/htc/msm7x27-common/msm7x27.mk)
