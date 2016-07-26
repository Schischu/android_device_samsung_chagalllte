#
# Copyright (C) 2015 Schischu
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

$(call inherit-product, device/samsung/chagall-klimt-common/device.mk)

PRODUCT_PACKAGES += \
    init.baseband.rc

PRODUCT_COPY_FILES += \
    device/samsung/chagalllte/audio/audio_policy.conf:system/etc/audio_policy.conf

PRODUCT_COPY_FILES += \
    device/samsung/chagalllte/audio/mixer_paths.xml:system/etc/mixer_paths.xml

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

DEVICE_PACKAGE_OVERLAYS += \
    device/samsung/chagalllte/overlay

# Radio (needed for audio controls even on wifi-only)
PRODUCT_PACKAGES += \
    libril \
    librilutils \
    rild

PRODUCT_PROPERTY_OVERRIDES += \
    ro.carrier=unknown

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libsec-ril.so
    rild.libargs=-d /dev/ttyS0
    ro.telephony.default_network=9
    ro.ril.telephony.mqanelements=6

# setup dalvik vm configs
$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)
$(call inherit-product, vendor/samsung/chagalllte/chagalllte-vendor.mk)
