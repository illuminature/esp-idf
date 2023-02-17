@echo off
set type=%1
shift
set version=%1
shift
if [%type%]==[] GOTO Args
if [%version%]==[] GOTO Args

echo .
echo .
echo .

set backtrace=%1
:getBacktrace
	shift
	if [%1]==[] goto gotBacktrace
	set backtrace=%backtrace% %1
	goto getBacktrace
:gotBacktrace

"C:\Users\Nathan.Phillips\.espressif4.4.2\tools\xtensa-esp32-elf\esp-2021r2-patch3-8.4.0\xtensa-esp32-elf\bin\xtensa-esp32-elf-addr2line.exe" -rCfpie "C:\Users\Nathan.Phillips\Documents\Closer Pets\Firmware\%type%\%version%\%type%.elf" %backtrace%
GOTO End

:Args
	ECHO Usage backtrace.bat Feeder v1.0.0 0x400239fe:0x3ffeacf00x4002b695:0x3ffead10 0x40032d91:0x3ffead30
	GOTO End

:End
