# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/Users/raybello/esp/esp-idf/components/bootloader/subproject"
  "/Users/raybello/esp/esp32s3-linux/firmware/build/bootloader"
  "/Users/raybello/esp/esp32s3-linux/firmware/build/bootloader-prefix"
  "/Users/raybello/esp/esp32s3-linux/firmware/build/bootloader-prefix/tmp"
  "/Users/raybello/esp/esp32s3-linux/firmware/build/bootloader-prefix/src/bootloader-stamp"
  "/Users/raybello/esp/esp32s3-linux/firmware/build/bootloader-prefix/src"
  "/Users/raybello/esp/esp32s3-linux/firmware/build/bootloader-prefix/src/bootloader-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/Users/raybello/esp/esp32s3-linux/firmware/build/bootloader-prefix/src/bootloader-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/Users/raybello/esp/esp32s3-linux/firmware/build/bootloader-prefix/src/bootloader-stamp${cfgdir}") # cfgdir has leading slash
endif()
