cmake_minimum_required(VERSION 3.15)

# Based on https://www.linuxembedded.fr/2023/01/realisez-un-adaptateur-usb-ethernet-avec-un-microcontroleur-et-des-logiciels-open-source

project(knxboard ASM C)

set(CMAKE_ASM_COMPILER arm-none-eabi-gcc)
set(CMAKE_C_COMPILER arm-none-eabi-gcc)

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR ARM)
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

option(KNXBOARDV1 "Build for KNXBOARDV1" OFF)
option(KNXBOARDV4 "Build for KNXBOARDV4" ON)
option(NUCLEOL432 "Build for NUCLEOL432" OFF)

if(KNXBOARDV1)
    set(KNXBOARDV4  OFF)
    set(NUCLEOL432  OFF)
    set(TPUART      ON)
    set(STKNX       OFF)
    set(NCN5130     OFF)
    set(BOARD       "KNXBOARDV1")
    set(HAL_NAME    "STM32L4xx")
    set(MCU_NAME    "STM32L432")
    set(MCU_VER     "KCUx")
    add_definitions("-DKNXGPIOLED_PORT=GPIOB -DKNXGPIOLED_RCC=RCC_GPIOB -DKNXGPIOLED_PIN=GPIO3")
elseif(NUCLEOL432)
    set(KNXBOARDV4  OFF)
    set(KNXBOARDV1  OFF)
    set(TPUART      OFF)
    set(STKNX       ON)
    set(NCN5130     OFF)
    set(BOARD       "NUCLEOL432")
    set(HAL_NAME    "STM32L4xx")
    set(MCU_NAME    "STM32L432")
    set(MCU_VER     "KCUx")
else()
    set(TPUART      OFF)
    set(STKNX       OFF)
    set(NCN5130     ON)
    set(BOARD       "KNXBOARDV4")
    set(HAL_NAME    "STM32G4xx")
    set(MCU_NAME    "STM32G491")
    set(MCU_VER     "KEUx")
endif()
message(STATUS "Build for ${BOARD}")

file(GLOB SOURCE_CORE       "Core/${BOARD}/Core/Src/s*.c")
file(GLOB DRIVER_CORE       "Core/${BOARD}/Drivers/*/Src/*_hal*.c")
file(GLOB DRIVER_CORE_RM    "Core/${BOARD}/Drivers/*/Src/*_hal*_template.c")
file(GLOB MAIN_CORE         "*.c")
file(GLOB ASM_SOURCES       "Core/${BOARD}/startup_s*.s")


if(DRIVER_CORE_RM)
message(STATUS "DRIVER_CORE = ${DRIVER_CORE}")
message(STATUS "DRIVER_CORE_RM = ${DRIVER_CORE_RM}")
list(REMOVE_ITEM DRIVER_CORE ${DRIVER_CORE_RM})
message(STATUS "DRIVER_CORE = ${DRIVER_CORE}")
endif()

set(SRC_FILES
   ${SOURCE_CORE}
   ${DRIVER_CORE}
   ${MAIN_CORE}
   ${ASM_SOURCES}
)

set(EXECUTABLE ${PROJECT_NAME}.elf)

add_executable(${EXECUTABLE} ${SRC_FILES})

target_compile_definitions(${EXECUTABLE} PRIVATE
   -DUSE_HAL_DRIVER
   -D${HAL_NAME}
   -D${MCU_NAME}xx
)

target_include_directories(${EXECUTABLE} PRIVATE
    Core/${BOARD}/Core/Inc
    Core/${BOARD}/Core/Src
    Core/${BOARD}/Drivers/${HAL_NAME}_HAL_Driver/Inc
    Core/${BOARD}/Drivers/CMSIS/Device/ST/${HAL_NAME}/Include
    Core/${BOARD}/Drivers/CMSIS/Include
    ${CMAKE_CURRENT_SOURCE_DIR}
)

target_compile_options(${EXECUTABLE} PRIVATE
   -mcpu=cortex-m3
   -mthumb
   -mfloat-abi=soft

   -fdata-sections
   -ffunction-sections

   -Wall

   -O3
   -g
)

target_link_options(${EXECUTABLE} PRIVATE
   -T${CMAKE_SOURCE_DIR}/Core/${BOARD}/${MCU_NAME}${MCU_VER}_FLASH.ld

   -mcpu=cortex-m3
   -mthumb
   -mfloat-abi=soft

   -specs=nosys.specs
   -specs=nano.specs

   -Wl,-Map=${PROJECT_NAME}.map,--cref
   -Wl,--gc-sections
)

add_custom_command(TARGET ${EXECUTABLE}
   POST_BUILD
   COMMAND arm-none-eabi-size ${EXECUTABLE}
)

add_custom_target(flash
   DEPENDS ${EXECUTABLE}
   COMMAND openocd -f ${CMAKE_SOURCE_DIR}/Core/${BOARD}.cfg -c init -c "reset halt" -c "flash write_image erase ${EXECUTABLE}" -c "reset run" -c exit
   VERBATIM
)

add_custom_target(gdb
   DEPENDS ${EXECUTABLE}
   COMMAND ${CMAKE_SOURCE_DIR}/gdb.sh ${EXECUTABLE} Core/${BOARD}.cfg
   VERBATIM
)
