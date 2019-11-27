@echo off

if "%1"=="new" goto new
if "%1"=="" goto comp
if "%1"=="-h" goto help
if "%1"=="-help" goto help
if "%1"=="opengl" goto opengl

echo comando nao encontrado
goto fim

:comp

echo -
gcc -g -o prog *.c
prog

goto fim

:opengl

gcc -o prog *.c lib\libSOIL.a -lopengl32 -lglu32 -lgdi32
prog

goto fim

:new

if "%2"=="" goto error

mkdir %2
cd %2
copy %BCC%\exampleMain.c %2.c

if "%3"=="" goto fim
if "%3"=="-t" goto tad1

goto fim

:tad1

if "%4"=="TAD" goto tad2
if "%4"=="tad" goto tad2
if "%4"=="Tad" goto tad2

goto fim

:tad2

copy %BCC%\exampleTAD.c %2_TAD.c
copy %BCC%\exampleTAD.h %2_TAD.h

goto fim

:help

echo bcc 					compila todo os arquivos .c do diretorio atual
echo bcc new name_project			cria um projeto simples com o nome definido
echo bcc new name_project -t TAD		cria um projeto com TAD com o nome definido

goto fim

:error

echo Comando Invalido!

goto fim

:fim

echo[
echo -

pause
