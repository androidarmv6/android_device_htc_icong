# CM.mk
# Device information and external inherits
# Re-written by Benjamin Gwynn

# Licensed under the Apache License, Version 2.0.
# Copyright (C) 2009 The Android Open Source Project
# Copyright (C) 2011 The CyanogenMod Project
# Copyright (C) 2014 Benjamin Gwynn <http://xenxier.tk>

LOCAL_DIR := device/htc/marvel
LOCAL_PATH := $(LOCAL_DIR)

# Inherit common CM stuff
$(call inherit-product, vendor/cm/config/common_mini_phone.mk)		# Mini configuration
$(call inherit-product, vendor/cm/config/gsm.mk)			# GSM configuration

# Inherit makefile
## Call our devices makefile.
$(call inherit-product, $(LOCAL_DIR)/marvel.mk)

# Screen information
## This is used to create the Cyanogenmod boot animation.
TARGET_SCREEN_HEIGHT := 480
TARGET_SCREEN_WIDTH := 320

# Device identification
## Give the full product details of our device.
PRODUCT_DEVICE := marvel
PRODUCT_NAME := cm_marvel
PRODUCT_BRAND := htc_europe
PRODUCT_MODEL := Wildfire S A510e
PRODUCT_MANUFACTURER := HTC
PRODUCT_CHARACTERISTICS := phone
PRODUCT_RELEASE_NAME := WildfireS
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_marvel

# Build Versioning
## Set the version of this build for use in 'About' and ZIP naming.
ROM_BUILDTYPE := KANG
BUILD_ID := $(ROM_BUILDTYPE)_$(shell date -u +%Y%m%d)
PRODUCT_VERSION_DEVICE_SPECIFIC := $(PRODUCT_RELEASE_NAME)
TARGET_UNOFFICIAL_BUILD_ID := $(ROM_BUILDTYPE)

## Pass this versioning to our build.prop file.
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_ID=$(BUILD_ID) \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    PRIVATE_BUILD_DESC=$(BUILD_ID)

## Assign the build fingerprint to the build.prop file.
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT=cyanogenmod/htc_marvel/marvel:4.3.1/$(BUILD_ID)/v0.1:user/test-keys
