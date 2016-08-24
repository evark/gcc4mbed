# Copyright 2015 KenjutsuGH (https://github.com/KenjutsuGH)
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
# See the License for the specific language governing permissions and
# limitations under the License.

# Vendor/device for which the library should be built.
MBED_DEVICE        := BLUEPILL_F103C8
MBED_CLEAN         := $(MBED_DEVICE)-MBED-clean


# Compiler flags which are specifc to this device.
TARGETS_FOR_DEVICE := TARGET_BLUEPILL_F103C8 TARGET_M3 TARGET_CORTEX_M TARGET_STM TARGET_STM32F1 TARGET_STM32F103C8
TARGETS_FOR_DEVICE += 
GCC_DEFINES := $(patsubst %,-D%,$(TARGETS_FOR_DEVICE))
GCC_DEFINES += -D__CORTEX_M3 -DARM_MATH_CM3 -D__FPU_PRESENT=0

C_FLAGS   := -mcpu=cortex-m3 -mthumb -mfpu=vfp -msoft-float -mthumb-interwork
ASM_FLAGS := -mcpu=cortex-m3 -mthumb -mfpu=vfp -msoft-float
LD_FLAGS  := -mcpu=cortex-m3 -mthumb -mfpu=vfp -msoft-float


# Extra platform specific object files to link into file binary.
DEVICE_OBJECTS :=


# Version of MRI library to use for this device.
DEVICE_MRI_LIB :=


# Linker script to be used.  Indicates what code should be placed where in memory.
BLUEPILL_F103C8_LSCRIPT ?= $(GCC4MBED_DIR)/external/mbed/libraries/mbed/targets/cmsis/TARGET_STM/TARGET_STM32F1/TARGET_BLUEPILL_F103C8/TOOLCHAIN_GCC_ARM/STM32F103XB.ld
LSCRIPT = $(BLUEPILL_F103C8_LSCRIPT)

include $(GCC4MBED_DIR)/build/device-common.mk