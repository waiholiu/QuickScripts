@echo off

:: Check if the first argument (number of minutes) is provided
if "%~1"=="" (
    echo Error: You must enter the number of minutes.
    goto end
)

:: Set the number of minutes from the first argument
set minutes=%~1

:: Convert minutes to seconds
set /a seconds=%minutes%*60

:: Set the reminder message from the second argument, if provided
if "%~2"=="" (
    set message=Time's up! %minutes% minutes have passed.
) else (
    set message=%~2
)

:: Wait for the specified number of seconds
timeout /t %seconds% /nobreak

:: Display the alert message
msg * "%message%"

:: Optionally, you can also use a sound alert
:: powershell -c (New-Object Media.SoundPlayer "C:\Windows\Media\notify.wav").PlaySync();

:end
:: Wait for user input to exit
set /p input="Press Enter to exit..."