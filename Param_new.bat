@echo off
title Zadanie 
color 0A
setlocal enableextensions
setlocal enabledelayedexpansion


if "%1"=="" (
    echo Parametr nie istnieje
    exit
) 
echo Witaj %USERNAME%
:main
set /a count_col=1
set /a count_rows=1
set /a help_rows=0

:ReadFile
for /f "tokens=%count_col% delims=," %%a in (%1) do (
   
    for /f "tokens=%count_col% delims=," %%b in (%1) do (    
        set m[!count_rows!!count_col!]=%%b
        set /a count_rows+=1
        if !count_rows! gtr %help_rows% (
            set /a help_rows+=1
        )
       
    )
    set /a count_rows=1
    set /a count_col+=1
  if !count_col! lss 40 goto ReadFile
)
set /a help_rows-=1

echo --------------------------------
echo Wybierz co chcesz wyswietlic
echo [1] Kolumny
echo [2] Wiersze
echo [3] Zadanie
echo [4] Wyswietl zawartosc pliku
echo [0] Wyjscie
set /p input= "" 
echo --------------------------------
if "%input%"=="1" goto col
if "%input%"=="2" goto row
if "%input%"=="3" goto zad
if "%input%"=="4" goto all
if "%input%"=="0" exit
echo Bledna opcja, sprobuj ponownie !
goto main



:col
echo --------------------------------
echo Ktore kolumn/y chcesz wyswietlic
set /p input_col= "Podaj numer kolumny :"  
echo --------------------------------
goto printCol





:row
echo --------------------------------
echo Ktore wiersz/e chcesz wyswietlic
set /p input_row= "Podaj numer wiersza :"
echo --------------------------------
goto printRow




:printCol
set /a count_col-=1
if %input_col% gtr !count_col! (
    echo Nie takiej kolumny !
    goto main
)
set /a count_col+=1
set /a x=1
for /L %%x in (1,1,!help_rows!) do (
    echo !m[%%x%input_col%]!
)
set /a input_col=0
goto main



:printRow
set /a count_col-=1
if %input_row% gtr %help_rows% (
    echo Nie ma takiego wiersza !
    goto main
)
set /a x=1
for /L %%x in (1,1,%count_col%) do (
    echo !m[%input_row%%%x]!
)
set /a input_row=0
set /a count_col+=1
goto main




:zad
for /L %%h in (2,1,%help_rows%) do (
    echo !m[%%h1]! !m[%%h4]!
)
goto main





:all
for /f %%a in (%1) do (
    echo %%a
)
goto main