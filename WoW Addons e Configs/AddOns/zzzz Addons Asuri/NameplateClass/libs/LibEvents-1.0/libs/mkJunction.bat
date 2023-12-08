@echo off
if [%1]==[] (echo Usage: drag and drop directory on this script & pause & exit /b)

set linkLocation=%~dp0

set target=%1
set targetDirectoryName=%~nx1


if exist %target% (mklink /j "%linkLocation%%targetDirectoryName%" "%target%") else (echo "Directory does not exists")
pause