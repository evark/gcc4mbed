gcc4mbed fork for my STM32 boards

Changes from official Repository
--------------------------------

- mbed SDK Version 123
- GCC Version 5-2016-q2-update
- Optimization flags: Debug=-Og Release=-Os

Notes
-----
- device.h defines are generated from targets.json in mbed SDK (Versions>119). All defines must be declared in build/BOARD-device.mk makefiles as the device.h file is empty. This breaks all platforms of gcc4mbed, until fix of makefile.

- makefiles fixed only for the following boards:
    - NUCLEO_F401RE
    - NUCLEO_L476RG

