@echo off
setlocal enableDelayedExpansion

cd build\release-batch-mingw\base
@del *.asm* /s
@del *.qvm* /s
cd ..\..\..\