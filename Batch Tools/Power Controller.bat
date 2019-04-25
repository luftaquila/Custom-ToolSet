@echo off
set arg=%1
IF %arg%==hbr %windir%\System32\rundll32.exe powrprof.dll SetSuspendState Hibernate
IF %arg%==rst %windir%\System32%Shutdown.exe -r -t 0
IF %arg%==sdn %windir%\System32\Shutdown.exe -s -t 0