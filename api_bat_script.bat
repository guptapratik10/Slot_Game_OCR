@echo off
echo Compiling Java file...
javac FileUploader.java

echo.
if %errorlevel% neq 0 (
    echo Error: Compilation failed.
    exit /b %errorlevel%
)

echo Running Java program in the background...
start /B cmd /c "java FileUploader.java > output.txt 2>&1"

echo.
echo Program execution started in the background.
echo Check the output.txt file for the response.

:waitForFile
timeout /t 1 /nobreak >nul
if exist output.txt (
    echo.
    echo Program execution completed. Response written to output.txt.
    goto :eof
) else (
    goto waitForFile
)
