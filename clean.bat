@echo off
setlocal enableDelayedExpansion

cd build\release-batch-mingw
del *.asm* /s
del *.qvm* /s
::rmdir vm 
cd ..\..\..\