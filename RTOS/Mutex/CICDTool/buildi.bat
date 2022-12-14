rem @echo off
set "usage=usage: buildi [{RTOS\Mutex\Debug|Release} {all|clean}]"

setlocal

if not [%1]==[] goto :check_for_args
set "build_type=Debug"
set "target=all"
goto :set_build_dir

:check_for_args
if not [%2]==[] goto :set_type_target

echo "%usage%"
exit /b 1

:set_type_target
set 
set "build_type=%1"
set "target=%2"

:set_build_dir
set "ws_root=C:\ProgramData\Jenkins\.jenkins\workspace\Git_source_test\RTOS\Mutex"
set "build_dir=C:\ProgramData\Jenkins\.jenkins\workspace\Git_source_test\RTOS\Mutex\%build_type%"

"%ws_root%\CICDTool\build.bat" "%build_dir%" %build_type% %target%
