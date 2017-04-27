#
# Copyright (C) 2012 The CyanogenMod Project
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

# This variable is set first, so it can be overridden
# by BoardConfigVendor.mk

-include device/samsung/smdk4412-common/BoardCommonConfig.mk

# Wifi
WIFI_DRIVER_MODULE_PATH :=

# Bionic
MALLOC_SVELTE := true
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true
LINKER_NON_PIE_EXECUTABLES_HEADER_DIR := device/samsung/n7100/include

# RIL
BOARD_PROVIDES_LIBRIL := true
BOARD_MODEM_TYPE := xmm6262
BOARD_RIL_CLASS := ../../../device/samsung/n7100/ril
TARGET_SPECIFIC_HEADER_PATH += device/samsung/n7100/include
BOARD_GLOBAL_CFLAGS += -DDISABLE_ASHMEM_TRACKING

# Graphics
TARGET_REQUIRES_SYNCHRONOUS_SETSURFACE := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/n7100/bluetooth

# Kernel
TARGET_KERNEL_SOURCE := kernel/samsung/smdk4412
TARGET_KERNEL_CONFIG := lineageos_n7100_defconfig

# Power HAL
TARGET_POWERHAL_VARIANT := samsung

# assert
TARGET_OTA_ASSERT_DEVICE := t03g,n7100,GT-N7100

# inherit from the proprietary version
-include vendor/samsung/n7100/BoardConfigVendor.mk

# External apps on SD
#TARGET_EXTERNAL_APPS = sdcard1

# Camera Hacks
BOARD_GLOBAL_CFLAGS += -DMETADATA_CAMERA_SOURCE
TARGET_HAS_LEGACY_CAMERA_HAL1 := true

# Cache
BOARD_CACHEIMAGE_PARTITION_SIZE := 1048576
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := f2fs

# Recovery
# RECOVERY_VARIANT := twrp

# TARGET_RECOVERY_FSTAB := device/samsung/n7100/rootdir/twrp.fstab
# TARGET_RECOVERY_DENSITY := mdpi
TARGET_USERIMAGES_USE_F2FS := true
# RECOVERY_FSTAB_VERSION := 2

PRODUCT_COPY_FILES += \
    device/samsung/n7100/rootdir/twrp.fstab:recovery/root/etc/twrp.fstab
	
# TWRP
TW_THEME := portrait_mdpi
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_NO_REBOOT_BOOTLOADER := true
HAVE_SELINUX := true
TW_HAS_DOWNLOAD_MODE := true
TW_MAX_BRIGHTNESS := 255
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel/brightness"
TW_INCLUDE_CRYPTO := true
TW_EXCLUDE_SUPERSU := true
LZMA_RAMDISK_TARGETS := boot,recovery 
TARGET_RECOVERY_PIXEL_FORMAT := "BGRX_8888"
TW_NO_USB_STORAGE := true
TWRP_EVENT_LOGGING := false
RECOVERY_GRAPHICS_USE_LINELENGTH := true

# Compatibility with pre-kitkat Sensor HALs
# SENSORS_NEED_SETRATE_ON_ENABLE := true

# Selinux
BOARD_SEPOLICY_DIRS += \
    device/samsung/n7100/selinux

