# Copyright (C) 2007 The Android Open Source Project
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

# config.mk
#
# Product-specific compile-time definitions.
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := true

BOARD_USE_ECLAIR_LIBCAMERA := true

JS_ENGINE := v8

# inherit from the proprietary version
-include vendor/htc/dream_sapphire/BoardConfigVendor.mk

TARGET_BOARD_PLATFORM := msm7k
TARGET_BOARD_PLATFORM_GPU := qcom
TARGET_CPU_ABI := armeabi-v6j
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv6j

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := CUSTOM
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := libWifiApi
BOARD_WLAN_TI_STA_DK_ROOT   := system/wlan/ti/sta_dk_4_0_4_32
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_ARG      := ""
WIFI_DRIVER_MODULE_NAME     := "wlan"
WIFI_FIRMWARE_LOADER        := "wlan_loader"

TARGET_NO_KERNEL := false
TARGET_NO_RECOVERY := false
TARGET_PREBUILT_RECOVERY_KERNEL := device/htc/dream_sapphire/prebuilt/kernel/kernel

BOARD_KERNEL_BASE := 0x19200000

#CUSTOM_MTD :=true

ifeq (true,$(CUSTOM_MTD))
BOARD_KERNEL_CMDLINE := no_console_suspend=1 console=null mtdparts=msm_nand:256K@0x0000024C0000(misc),5120K@0x0000026C0000(recovery),2560K@0x000002BC0000(boot),143360k@0x000002E40000(system),3072k@0xBA40000(cache),330496k@0xBD40000(userdata)

PRODUCT_COPY_FILES += \
     device/htc/dream_sapphire/prebuilt/init.d/06BindCache:system/etc/init.d/06BindCache
else
BOARD_KERNEL_CMDLINE := no_console_suspend=1 console=null
endif

#libsurfaceflinger to avoid Draw Texture Extenstion
BOARD_AVOID_DRAW_TEXTURE_EXTENSION := true

BOARD_HAVE_BLUETOOTH := true

BOARD_VENDOR_USE_AKMD := akm8976

BOARD_VENDOR_QCOM_AMSS_VERSION := 6355

# The size of a block that can be marked bad.
BOARD_FLASH_BLOCK_SIZE := 131072

# OpenGL drivers config file path
BOARD_EGL_CFG := device/htc/dream_sapphire/egl.cfg

BOARD_USES_QCOM_LIBS := true

BOARD_NO_RGBX_8888 := true

TARGET_HARDWARE_3D := false

BOARD_USES_GPSSHIM:=true

BOARD_GPS_LIBRARIES := libgps

TARGET_ELECTRONBEAM_FRAMES := 8

BOARD_ELECTRONBEAM_HACK :=true

WITH_DEXPREOPT := true

# Use HTC USB Function Switch to enable tethering via USB
#BOARD_USE_HTC_USB_FUNCTION_SWITCH := true

#BOARD_USE_USB_MASS_STORAGE_SWITCH := true

BOARD_USE_KINETO_COMPATIBILITY := true

# Stagefright fully enabled
BUILD_WITH_FULL_STAGEFRIGHT := true

TARGET_LIBAGL_USE_GRALLOC_COPYBITS := true

TARGET_RELEASETOOLS_EXTENSIONS := device/htc/common

TARGET_BOOTLOADER_BOARD_NAME := sapphire
TARGET_OTA_ASSERT_DEVICE := sapphire
PRODUCT_BUILD_PROP_OVERRIDES += TARGET_BOOTLOADER_BOARD_NAME=sapphire

# # cat /proc/mtd
# dev:    size   erasesize  name
# mtd0: 00040000 00020000 "misc"
# mtd1: 00500000 00020000 "recovery"
# mtd2: 00280000 00020000 "boot"
# mtd3: 05a00000 00020000 "system"
# mtd4: 05000000 00020000 "cache"
# mtd5: 127c0000 00020000 "userdata"

# 6355 sapphire
# # cat /proc/mtd
# dev:    size   erasesize  name
# mtd0: 00040000 00020000 "misc"
# mtd1: 00500000 00020000 "recovery"
# mtd2: 00280000 00020000 "boot"
# mtd3: 0aa00000 00020000 "system"
# mtd4: 08200000 00020000 "cache"
# mtd5: 0a5c0000 00020000 "userdata"
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00280000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00500000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x0aa00000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x0a5c0000

#TARGET_RECOVERY_UI_LIB := librecovery_ui_sapphire librecovery_ui_htc
TARGET_PREBUILT_KERNEL := device/htc/dream_sapphire/prebuilt/kernel/kernel
LOCAL_KERNEL := device/htc/dream_sapphire/prebuilt/kernel/kernel
