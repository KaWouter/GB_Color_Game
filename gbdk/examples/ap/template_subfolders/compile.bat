REM Automatically generated from Makefile
mkdir obj
..\..\..\bin\lcc  -msm83:ap -c -o obj\main.o src\main.c
..\..\..\bin\lcc  -msm83:ap -c -o obj\dungeon_map.o res\dungeon_map.c
..\..\..\bin\lcc  -msm83:ap -c -o obj\dungeon_tiles.o res\dungeon_tiles.c
..\..\..\bin\lcc  -msm83:ap -o obj\Example.pocket obj\main.o obj\dungeon_map.o obj\dungeon_tiles.o 
