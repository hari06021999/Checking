rem
rem usage: build build-dir {Debug|Release} {all|clean}
rem

setlocal

if not [%3]==[] goto :get_args
echo "Insufficient arguments"
exit /b 1

:get_args

set "build_dir=%1"
set "build_type=%2"
set "target=%3"

cd "%build_dir%"

set PATH=C:\ST\STM32CubeIDE_1.10.1\STM32CubeIDE\plugins\com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32.10.3-2021.10.win32_1.0.0.202111181127\tools\bin;C:\ST\STM32CubeIDE_1.10.1\STM32CubeIDE\plugins\com.st.stm32cube.ide.mcu.externaltools.make.win32_2.0.100.202202231230\tools\bin;C:\ST\STM32CubeIDE_1.10.1\STM32CubeIDE\plugins\com.st.stm32cube.ide.jre.win64_2.2.0.202203101208\jre\bin\client;C:\ST\STM32CubeIDE_1.10.1\STM32CubeIDE\plugins\com.st.stm32cube.ide.jre.win64_2.2.0.202203101208\jre\bin;C:\Windows\System32;C:\Windows;C:\Windows\System32\wbem;C:\Windows\System32\WindowsPowerShell\v1.0;

set compiler_prefix=arm-none-eabi

set "version_file=..\RTOS\Mutex\Core\Src\main"

if [%BUILD_TAG%]==[] goto :do_make

echo #ifndef _VERSION_H_ >"%version_file%"
echo #define _VERSION_H_ >>"%version_file%"
echo #define VERSION "%BUILD_TAG%-%build_type%" >>"%version_file%"
echo #endif >>"%version_file%"

:do_make

make -j4 "%target%"
