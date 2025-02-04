@echo off
REM Ejecutar el script de PowerShell para cambiar el fondo de pantalla de forma silenciosa
powershell -WindowStyle Hidden -ExecutionPolicy Bypass -File "%~dp0cambiar_fondo.ps1"
exit