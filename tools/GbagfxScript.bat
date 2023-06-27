@echo off
@chcp 65001>nul
title gbagfx script by Acimut

:Menu
color 5F
cls
@echo  +----------------------------------------------------+
@echo  ^|  Batch Script escrito por Acimut para WaH - ©2021  ^|
@echo  ^|                       gbagfx                       ^|
@echo  ^|       Convierte múltiples archivos a la vez        ^|
@echo  +----------------------------------------------------+
@echo  ^|         Seleccione una opción a convertir:         ^|
@echo  +----------------------------------------------------+--------------+
@echo  ^| 1 ^| .png    ^| en ^| .4bpp      ^|                                   ^|
@echo  +---+---------+----+------------+-----------------------------------+
@echo  ^| 2 ^| .png    ^| en ^| .4bpp.lz   ^| borra todos los .4bpp             ^|
@echo  +---+---------+----+------------+-----------------------------------+
@echo  ^| 3 ^| .png    ^| en ^| .pal       ^|                                   ^|
@echo  +---+---------+----+------------+-----------------------------------+
@echo  ^| 4 ^| .png    ^| en ^| .gbapal    ^| 16 colores ^| borra todos los .pal ^|
@echo  +---+---------+----+------------+------------^|----------------------+
@echo  ^| 5 ^| .png    ^| en ^| .gbapal    ^| 256 colores                       ^|
@echo  +---+---------+----+------------+-----------------------------------+
@echo  ^| 6 ^| .gbapal ^| en ^| .gbapal.lz ^| borra todos los .gbapal           ^|
@echo  +---+---------+----+------------+-----------------------------------+
@echo  ^| 7 ^| .png    ^| en ^| .8bpp      ^|                                   ^|
@echo  +---+---------+----+------------+-----------------------------------+
@echo  ^| 8 ^| .png    ^| en ^| .8bpp.lz   ^| borra todos los .8bpp             ^|
@echo  +---+---------+----+------------+-----------------------------------+
@echo  ^| 9 ^| .bin    ^| en ^| .bin.lz    ^|                                   ^|
@echo  +---+---------+----+------------+-----------------------------------+
@echo  ^| 0 ^| Salir                                                         ^|
@echo  +---+---------------------------------------------------------------+
@echo: 

set /P M=Presione un número, luego presione enter:
if %M%==1 goto PngTo4bpp
if %M%==2 goto PngTo4bppLz
if %M%==3 goto PngToPal
if %M%==4 goto PngToGbapal16
if %M%==5 goto PngToGbapal256
if %M%==6 goto GbapalToLz
if %M%==7 goto PngTo8bpp
if %M%==8 goto PngTo8bppLz
if %M%==9 goto BinToLz
if %M%==0 goto EOF

:PngTo4bpp
color 3F
@echo:
for %%a in (*.png) do (
    @echo Convirtiendo %%a en %%~na.4bpp
    gbagfx %%a %%~na.4bpp
)
@echo:
pause
goto MENU

:PngTo4bppLz
color 2F
@echo:
for %%a in (*.png) do (
    @echo Convirtiendo %%a en %%~na.4bpp
    gbagfx %%a %%~na.4bpp
)
@echo:
for %%b in (*.4bpp) do (
    @echo Convirtiendo %%b en %%b.lz
    gbagfx %%b %%b.lz
    @echo Borrando %%b
    del /f /q %%b
)
@echo:
pause
goto MENU

:PngToPal
color 1F
@echo:
for %%a in (*.png) do (
    @echo Convirtiendo %%a en %%~na.pal
    gbagfx %%a %%~na.pal
)
@echo:
pause
goto MENU

:PngToGbapal16
color 1F
@echo:
for %%a in (*.png) do (
    @echo Convirtiendo %%a en %%~na.pal
    gbagfx %%a %%~na.pal
)
@echo:
for %%b in (*.pal) do (
    @echo Convirtiendo %%b en %%~nb.gbapal de 16 colores
    gbagfx %%b %%~nb.gbapal -num_colors 16
    @echo Borrando %%b
    del /f /q %%b
)
@echo:
pause
goto MENU

:PngToGbapal256
color 1F
@echo:
for %%a in (*.png) do (
    @echo Convirtiendo %%a en %%~na.gbapal de 256 colores
    gbagfx %%a %%~na.gbapal
)
@echo:
pause
goto MENU

:GbapalToLz
color 2F
@echo:
for %%a in (*.gbapal) do (
    @echo Convirtiendo %%a en %%a.lz
    @echo Borrando %%a
    gbagfx %%a %%a.lz
    del /f /q %%a
)
@echo:
pause
goto MENU

:PngTo8bpp
color 6F
@echo:
for %%a in (*.png) do (
    @echo Convirtiendo %%a en %%~na.8bpp
    gbagfx %%a %%~na.8bpp
)
@echo:
pause
goto MENU

:PngTo8bppLz
color 2F
@echo:
for %%a in (*.png) do (
    @echo Convirtiendo %%a en %%~na.8bpp
    gbagfx %%a %%~na.8bpp
)
@echo:
for %%b in (*.8bpp) do (
    @echo Convirtiendo %%b en %%b.lz
    gbagfx %%b %%b.lz
    @echo Borrando %%b
    del /f /q %%b
)
@echo:
pause
goto MENU

:BinToLz
color 2F
@echo:
for %%a in (*.bin) do (
    @echo Convirtiendo %%a en %%a.lz
    gbagfx %%a %%a.lz
)
@echo:
pause
goto MENU
