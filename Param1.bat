@echo off
title Skrypt1
color 0A
setlocal enableextensions
setlocal enabledelayedexpansion


if "%1"=="" (
    echo Parametr nie istnieje
    exit
) 

set /a count_col=1

set /a count_rows=1

:getColumns
for /f "tokens=%count_col% delims=," %%a in (%1) do (
   
    for /f "tokens=%count_col% delims=," %%b in (%1) do (    
        set m[!count_rows!!count_col!]=%%b
        echo %%b !count_rows! %count_col%
        set /a count_rows+=1
    )
    set /a count_rows=1
    set /a count_col+=1
  if !count_col! lss 20 goto getColumns
  

)

echo %m[64]%
