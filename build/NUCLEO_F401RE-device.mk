# Copyright 2015 Larry Littlefield (https://developer.mbed.org/users/svkatielee/)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and LIKE_CORTEX_M4 LIKE_MBED
# limitations under the License.

# Vendor/device for which the library should be built.
MBED_DEVICE        := NUCLEO_F401RE
MBED_CLEAN         := $(MBED_DEVICE)-MBED-clean

# Compiler flags which are specifc to this device.

TARGETS_FOR_DEVICE := 	TARGET_LIKE_MBED \
			TARGET_NUCLEO_F401RE \
			TARGET_M4 \
			TARGET_LIKE_CORTEX_M4 \
			TARGET_RTOS_M4_M7 \
			TARGET_CORTEX_M \
			TARGET_STM \
			TARGET_STM32F4 \
			TARGET_STM32F401RE \
			TARGET_FF_ARDUINO\
			TARGET_FF_MORPHO
GCC_DEFINES := $(patsubst %,-D%,$(TARGETS_FOR_DEVICE))

# From device properties
DEVICE_HAS  := 	ANALOGIN \
		ERROR_RED \
		I2C \
		I2CSLAVE \
		INTERRUPTIN \
		PORTIN \
		PORTINOUT \
		PORTOUT \
		PWMOUT \
		RTC \
		SERIAL \
		SERIAL_ASYNCH \
		SERIAL_FC \
		SLEEP \
		SPI \
		SPISLAVE \
		STDIO_MESSAGES

GCC_DEFINES += $(patsubst %,-DDEVICE_%=1,$(DEVICE_HAS))

# CORTEX SYMBOLS 
GCC_DEFINES += -D__CORTEX_M4 -DARM_MATH_CM4 -D__FPU_PRESENT=1 -D__CMSIS_RTOS -D__MBED_CMSIS_RTOS_CM

GCC_DEFINES += -DTARGET_RELEASE 

C_FLAGS   := -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=softfp 
ASM_FLAGS := -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=softfp
LD_FLAGS  := -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=softfp


# Extra platform specific object files to link into file binary.
DEVICE_OBJECTS :=


# Version of MRI library to use for this device.
DEVICE_MRI_LIB :=


# Linker script to be used.  Indicates what code should be placed where in memory.
NUCLEO_F401RE_LSCRIPT ?= $(GCC4MBED_DIR)/external/mbed/libraries/mbed/targets/cmsis/TARGET_STM/TARGET_STM32F4/TARGET_NUCLEO_F401RE/TOOLCHAIN_GCC_ARM/STM32F401XE.ld
LSCRIPT = $(NUCLEO_F401RE_LSCRIPT)


include $(GCC4MBED_DIR)/build/device-common.mk
