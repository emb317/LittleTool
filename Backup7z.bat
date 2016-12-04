exit

echo off

rem �w�肵���t�H���_��7zip�ň��k����o�b�`�ł��B
rem �擪�� exit �͌�쓮�h�~�p�Ȃ̂ŏ����Ă��������B
rem �w�肵���t�H���_�� C:\Test �̏ꍇ�A�o�͐�p�X\Test_YYYYMMDD.7z �̖��O�ň��k���܂��B

rem TARGET_PATH ���k����t�H���_�̃p�X ("�͕s�v)
rem OUT_PATH    ���k�����t�@�C���̏o�͐�̃p�X ("�͕s�v)
rem OPTION      7zip�̈��k�I�v�V�����B7zip�̃w���v���Q�� ("���K�v)
rem ZIP_EXE     7zip�̎��s�t�@�C���̃p�X ("�͕s�v)

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
