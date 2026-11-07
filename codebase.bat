@echo off
where py >nul 2>nul
if %errorlevel%==0 (py "%~dp0codebase" %*) else (python "%~dp0codebase" %*)
