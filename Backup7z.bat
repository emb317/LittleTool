exit

echo off

rem 指定したフォルダを7zipで圧縮するバッチです。
rem 先頭の exit は誤作動防止用なので消してください。
rem 指定したフォルダが C:\Test の場合、出力先パス\Test_YYYYMMDD.7z の名前で圧縮します。

rem TARGET_PATH 圧縮するフォルダのパス ("は不要)
rem OUT_PATH    圧縮したファイルの出力先のパス ("は不要)
rem OPTION      7zipの圧縮オプション。7zipのヘルプを参照 ("が必要)
rem ZIP_EXE     7zipの実行ファイルのパス ("は不要)

setlocal

set TARGET_PATH=C:\Test
set OUT_PATH=D:\Backup
set OPTION="-xr!*.txt -xr!temp"
set ZIP_EXE=C:\Program Files\7-Zip\7zG.exe

echo --------------------------------------------------
echo TARGET_PATH = "%TARGET_PATH%"
echo OUT_PATH    = "%OUT_PATH%"
echo OPTION      = %OPTION%
echo ZIP_EXE     = "%ZIP_EXE%"
echo --------------------------------------------------
call :RUN_ZIP "%TARGET_PATH%" "%OUT_PATH%" %OPTION%
echo --------------------------------------------------

endlocal
pause
exit


:RUN_ZIP

cd /D %1

set dt=%date%
set FName=%~f2\%~n1_%dt:~-10,4%%dt:~-5,2%%dt:~-2,2%.7z

"%ZIP_EXE%" a "%FName%" %~3
echo "%ZIP_EXE%" a "%FName%" %~3

exit /B
