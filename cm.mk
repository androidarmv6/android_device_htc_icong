# Licensed under the Apache License, Version 2.0.
# Copyright (C) 2009 The Android Open Source Project
# Copyright (C) 2011 The CyanogenMod Project
# Copyright (C) 2014 Benjamin Gwynn <http://xenxier.tk>
# Re-written by Benjamin Gwynn

# Call our device's AOSP device config.
$(call inherit-product, device/htc/icong/full_icong.mk)

# Inherit common CM stuff
$(call inherit-product, vendor/cm/config/gsm.mk)
$(call inherit-product, vendor/cm/config/mini.mk)

# Bootanimation
TARGET_SCREEN_HEIGHT := 480
TARGET_SCREEN_WIDTH := 320

# Overrides for CM
PRODUCT_NAME := cm_icong
PRODUCT_DEVICE := icong

## Assign the build fingerprint to the build.prop file.
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT=cyanogenmod/htc_icong/icong:4.3.1/$(BUILD_ID)/v0.1:user/test-keys
