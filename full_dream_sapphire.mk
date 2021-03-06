#
# Copyright (C) 2008 The Android Open Source Project
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
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

DEVICE_PACKAGE_OVERLAYS := device/htc/dream_sapphire/overlay

PRODUCT_LOCALES += mdpi

PRODUCT_COPY_FILES += \
    device/htc/dream_sapphire/prebuilt/12compcache:system/etc/init.d/12compcache \
    device/htc/dream_sapphire/prebuilt/rzscontrol:system/xbin/rzscontrol

PRODUCT_PACKAGES += \
	VoiceDialer \
	sensors.sapphire \
	sapphire-keypad.kcm \
	wlan.ko \
	vold.fstab \
	wlan_loader \
	tiwlan.ini \
	libOmxCore \
	gps.sapphire \
	copybit.msm7k \
	gralloc.msm7k \
	lights.msm7k

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml

# Prebuilt stuff
PRODUCT_COPY_FILES += \
    device/htc/dream_sapphire/prebuilt/init.sapphire.rc:root/init.sapphire.rc \
    device/htc/dream_sapphire/prebuilt/build.sapphire.prop:system/build.sapphire.prop \
    device/htc/dream_sapphire/prebuilt/ueventd.sapphire.rc:root/ueventd.sapphire.rc \
    device/htc/dream_sapphire/prebuilt/vold.fstab:system/etc/vold.fstab
    

# Keylayout / Headset
PRODUCT_COPY_FILES += \
    device/htc/dream_sapphire/keylayout/sapphire-keypad.kl:system/usr/keylayout/sapphire-keypad.kl \
    device/htc/dream_sapphire/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl

PRODUCT_PROPERTY_OVERRIDES := \
    keyguard.no_require_sim=true \
    ro.ril.hsxpa=2 \
    ro.ril.gprsclass=12 \
    ro.ril.hsdpa.category=8 \
    ro.ril.enable.dtm=1 \
    ro.ril.hsupa.category=5 \
    ro.media.dec.jpeg.memcap=10000000 \
    ro.com.google.clientidbase=android-tmobile-us \
    ro.com.google.clientidbase.vs=android-hms-tmobile-us \
    ro.com.google.clientidbase.ms=android-hms-tmobile-us \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.setupwizard.enable_bypass=1 \
    ro.media.dec.aud.wma.enabled=1 \
    ro.media.dec.vid.wmv.enabled=1

PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libhtc_ril.so \
    wifi.interface=tiwlan0

# Time between scans in seconds. Keep it high to minimize battery drain.
# This only affects the case in which there are remembered access points,
# but none are in range.
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.supplicant_scan_interval=15

# density in DPI of the LCD of this board. This is used to scale the UI
# appropriately. If this property is not defined, the default value is 160 dpi. 
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160

# Default network type
# 0 => WCDMA Preferred.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=0

# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=65536

# media configuration xml file
PRODUCT_COPY_FILES += \
    device/htc/dream_sapphire/media_profiles.xml:/system/etc/media_profiles.xml

# Kernel stuff
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/htc/dream_sapphire/prebuilt/kernel/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

#
#Copy in prebuilt kernel modules
#

KERNEL_NAME := 2.6.34.4-carz

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    device/htc/dream_sapphire/prebuilt/modules/Module.symvers:system/lib/modules/$(KERNEL_NAME)/kernel/Module.symvers \
    device/htc/dream_sapphire/prebuilt/modules/modules.order:system/lib/modules/$(KERNEL_NAME)/kernel/modules.order \
    device/htc/dream_sapphire/prebuilt/modules/modules.builtin:system/lib/modules/$(KERNEL_NAME)/kernel/modules.builtin \
    device/htc/dream_sapphire/prebuilt/modules/wlan.ko:system/lib/modules/$(KERNEL_NAME)/kernel/drivers/net/wireless/tiwlan1251/wlan.ko \
    device/htc/dream_sapphire/prebuilt/modules/ramzswap.ko:system/lib/modules/$(KERNEL_NAME)/kernel/drivers/staging/ramzswap/ramzswap.ko \
    device/htc/dream_sapphire/prebuilt/modules/cifs.ko:system/lib/modules/$(KERNEL_NAME)/kernel/fs/cifs/cifs.ko \
    device/htc/dream_sapphire/prebuilt/modules/fuse.ko:system/lib/modules/$(KERNEL_NAME)/kernel/fs/fuse/fuse.ko \
    device/htc/dream_sapphire/prebuilt/modules/lockd.ko:system/lib/modules/$(KERNEL_NAME)/kernel/fs/lockd/lockd.ko \
    device/htc/dream_sapphire/prebuilt/modules/nfs_acl.ko:system/lib/modules/$(KERNEL_NAME)/kernel/fs/nfs_common/nfs_acl.ko \
    device/htc/dream_sapphire/prebuilt/modules/nfs.ko:system/lib/modules/$(KERNEL_NAME)/kernel/fs/nfs/nfs.ko \
    device/htc/dream_sapphire/prebuilt/modules/mip6.ko:system/lib/modules/$(KERNEL_NAME)/kernel/net/ipv6/mip6.ko \
    device/htc/dream_sapphire/prebuilt/modules/sunrpc.ko:system/lib/modules/$(KERNEL_NAME)/kernel/net/sunrpc/sunrpc.ko \
    device/htc/dream_sapphire/prebuilt/modules/auth_rpcgss.ko:system/lib/modules/$(KERNEL_NAME)/kernel/net/sunrpc/auth_gss/auth_rpcgss.ko \
    device/htc/dream_sapphire/prebuilt/modules/rpcsec_gss_krb5.ko:system/lib/modules/$(KERNEL_NAME)/kernel/net/sunrpc/auth_gss/rpcsec_gss_krb5.ko \
    device/htc/dream_sapphire/prebuilt/modules/wlan.ko:system/lib/modules/wlan.ko

## (2) Also get non-open-source aspects if available
$(call inherit-product-if-exists, vendor/htc/dream_sapphire/dream_sapphire-vendor.mk)

# stagefright settings
PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.enable-player=true \
    media.stagefright.enable-meta=true \
    media.stagefright.enable-scan=true \
    media.stagefright.enable-http=true

# Performance tweaks
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.heapsize=24m

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/generic.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := full_sapphire
PRODUCT_DEVICE := sapphire
PRODUCT_BRAND := Android
PRODUCT_MODEL := Full Android on Sapphire
