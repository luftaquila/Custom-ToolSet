@echo off
set arg=%1
IF %arg%==pf powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
IF %arg%==bl powercfg /s 381b4222-f694-41f0-9685-ff5bb260df2e
IF %arg%==sv powercfg /s a1841308-3541-4fab-bc81-f71556f20b4a