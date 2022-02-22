@echo off 
title Calculator
color 0A

:main
echo Witaj %USERNAME%
echo --------------------------------
echo Wybierz opcje
echo [1] Dodawanie
echo [2] Odejmowanie
echo [3] Mnozenie
echo [4] Dzielenie
echo [5] Potegowanie
echo [0] Wyjdz
set /a answer=1
set /p input= "Wybierz co chcesz zrobic :"  
if "%input%"=="1" goto add
if "%input%"=="2" goto sub
if "%input%"=="3" goto mul
if "%input%"=="4" goto dev
if "%input%"=="5" goto exp
if "%input%"=="0" exit
echo Bledna opcja, sprobuj ponownie !
goto main

:add
echo %input%
set /p number1= "Podaj pierwsza liczbe :"
set /p number2= "Podaj druga liczbe :" 
set /a answer= "%number1%"+"%number2%"
echo Wynik : %answer%
goto main

:sub
echo %input%
set /p number1= "Podaj pierwsza liczbe :"
set /p number2= "Podaj druga liczbe :" 
set /a answer= "%number1%"-"%number2%"
echo Wynik : %answer%
goto main

:mul
echo %input%
set /p number1= "Podaj pierwsza liczbe :"
set /p number2= "Podaj druga liczbe :" 
set /a answer= "%number1%"*"%number2%"
echo Wynik : %answer%
goto main

:dev
echo %input%
set /p number1= "Podaj pierwsza liczbe :"
set /p number2= "Podaj druga liczbe :" 
if "%number2%"=="0" goto error0
set /a answer= "%number1%"/"%number2%"
echo Wynik : %answer%
goto main

:exp
set /p number1= "Podaj podstawe potegi :"
set /p number2= "Podaj wykladnik potegi :"
set /a answer=1
set /a i=0
:exp1
set /a answer=answer*number1
set /a i=i+1
if %i% lss %number2% goto exp1
echo Wynik : %answer%
goto main

:error0
echo Dzielenie przez 0 zabronione !
echo -----------------------------------
goto main



