# Copyright 2015 Adam Green (http://mbed.org/users/AdamGreen/)
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
#
# Directories to be built
DIRS := HelloWorld\
        Ticker\
        rtos_basic\
        StdIO

DIRSCLEAN    := $(addsuffix .clean,$(DIRS))
DIRSCLEANALL := $(addsuffix .cleanall,$(DIRS))


# Determine supported devices by looking at *-device.mk makefiles.
ALL_DEVICES := $(patsubst ../build/%-device.mk,%,$(wildcard ../build/*-device.mk))


# Macro to construct device specific rules.
define device_rule #,DEVICE_NAME
    .PHONY : $1 $(addsuffix .$1,$(DIRS))
    $1 : $(addsuffix .$1,$(DIRS))
    $(addsuffix .$1,$(DIRS)) : %.$1:
		$(Q) $(MAKE) -C $$* $1

endef


# Set VERBOSE make variable to 1 to output all tool commands.
VERBOSE?=0
ifeq "$(VERBOSE)" "0"
Q=@
else
Q=
endif


# Make sure that cmd.exe is used as shell on Windows.
ifeq "$(OS)" "Windows_NT"
SHELL=cmd.exe
endif


# Rules
all: $(DIRS)

clean: $(DIRSCLEAN)

clean-all: $(DIRSCLEANALL)

$(DIRS):
	@echo Building $@
	$(Q) $(MAKE) --no-print-directory -C $@ all

$(DIRSCLEAN): %.clean:
	$(Q) $(MAKE) --no-print-directory -C $* clean

$(DIRSCLEANALL): %.cleanall:
	$(Q) $(MAKE) --no-print-directory -C $* clean-all

.PHONY: all clean clean-all $(DIRS) $(DIRSCLEAN)

# Rules to build each of the supported devices.
$(eval $(foreach i,$(ALL_DEVICES),$(call device_rule,$i)))
