:: How to set this up
:: Put this file in a directory then add the directory to the PATH environment variable.   
:: then run this using Alt-R and type newvs
:: remember to set the new directory to the name you want

@echo off

:: Prompt the user for the directory name
set /p dirname="Enter the name of the new directory (leave blank for default): "

:: Get the current date and time
set datetime=%date:~10,4%%date:~4,2%%date:~7,2%_%time:~0,2%%time:~3,2%%time:~6,2%
set datetime=%datetime: =0%

:: Check if the user provided a directory name
if "%dirname%"=="" (
    set dirname=gen%datetime%
)

:: Create the new subdirectory
set newdir=C:\Users\wailiu\Source\quickrepos\%dirname%
mkdir "%newdir%"

:: Notify the user
echo Created directory: %newdir%

:: Open Visual Studio Code in the new directory
code "%newdir%"

:: Wait for user input to exit
set /p input="Press Enter to exit..."