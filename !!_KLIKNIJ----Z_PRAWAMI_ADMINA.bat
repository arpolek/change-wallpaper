@echo off
Powershell.exe -NoProfile -Executionpolicy Bypass -Command "& {Start-Process Powershell -Argument '-NoProfile -ExecutionPolicy Bypass -File ""D:\set1.ps1""' -Verb RunAs}"
exit