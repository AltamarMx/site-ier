@echo off
REM -----------------------------------------------
REM clean_except_idf.bat
REM Borra todos los archivos (salvo *.idf y este .BAT)
REM y todas las carpetas en la carpeta donde esté
REM -----------------------------------------------

REM 1) Sitúate en el directorio donde está este script
cd /d "%~dp0"

REM Nombre de este .BAT (p. ej. clean_except_idf.bat)
set "THISBAT=%~nx0"

REM 2) Borra archivos que NO sean .idf ni este .BAT
for %%F in (*.*) do (
    REM ¿Es extensión .idf? si no…
    if /I not "%%~xF"==".idf" (
        REM ¿Es el mismo .BAT? si no…
        if /I not "%%F"=="%THISBAT%" (
            echo Borrando archivo: "%%F"
            del "%%F" /Q
        )
    )
)

REM 3) Borra todas las subcarpetas y su contenido
for /d %%D in (*) do (
    echo Borrando carpeta: "%%D"
    rd /s /q "%%D"
)

echo.
echo Proceso completado.
pause
