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

:: Download the file using PowerShell and save it as .gitignore
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/github/gitignore/main/VisualStudio.gitignore' -OutFile '%newdir%\.gitignore'"

:: Notify the user about the downloaded file
echo Downloaded .gitignore to %newdir%

:: Create readme.md file
(
echo # What is this repo for?
echo.
echo Remove this tag #descNeeded8342983742 after entering a description
) > "%newdir%\readme.md"

:: Notify the user about the readme.md file
echo Created readme.md in %newdir%

:: Initialize a new Git repository
cd "%newdir%"
git init

:: Notify the user about the Git repository initialization
echo Initialized empty Git repository in %newdir%

:: Stage the .gitignore and readme.md files
git add .gitignore readme.md

:: Commit the files
git commit -m "Initial commit with .gitignore and readme.md"

:: Notify the user about the first commit
echo First commit done

:: Open Visual Studio Code in the new directory
code "%newdir%"

:: Wait for user input to exit
set /p input="Press Enter to exit..."