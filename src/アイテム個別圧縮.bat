@echo off

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
rem :: �@�\���@�@�@�F�@�A�C�e���ʈ��k
rem :: �T�v�T�v�@�@�F�@�w�肵���A�C�e�����ʂň��k����B
rem :: ����
rem :: �@�����P�@�@�F�@�A�C�e���p�X(������)�@�����[�J���p�X�̂�
rem :: �o��
rem :: �@�߂�l�@�@�F�@0(����I��)�A1(�ُ�I��)
rem :: �@�t�@�C���@�F�@�A�C�e���̈��k�t�@�C��(����)
rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
rem :: �ϐ��ݒ�i���[�U�ݒ荀�ځj
rem :: ���o�b�`���g�p����O�Ƀ��[�U���ݒ肷�邱�Ɓ�
rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

rem �ϐ����F���k�𓀃\�t�g
set ZIP_EXE="C:\Program Files\7-Zip\7z.exe"

echo ���ݒ�l�i���[�U�ݒ荀�ځj��
echo   ZIP_EXE = %ZIP_EXE%
echo;

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
rem :: �ϐ��ݒ�i�o�b�`�ݒ荀�ځj
rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

rem �ϐ����F�I���X�e�[�^�X
set RT_OK=0
set RT_NG=1

rem �ϐ����F�����̐�
set NUM_OF_ARGS=0

echo ���ݒ�l�i�o�b�`�ݒ荀�ځj��
echo   NUM_OF_ARGS = %NUM_OF_ARGS%
echo;

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
rem :: �����J�n
rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

echo �������J�n��

echo �@�����`�F�b�N

if not exist %ZIP_EXE% (
	echo �@�G���[�@�F���k�𓀃\�t�g��������܂���B
	echo �@�@�@�@�@�@�E%ZIP_EXE%
	goto END_NG
)
for %%I in (%*) do (
	set /a NUM_OF_ARGS=NUM_OF_ARGS+1
)
if %NUM_OF_ARGS% equ 0 (
	echo �@�G���[�A�F�A�C�e���p�X���w�肳��Ă��܂���B
	goto END_NG
)
for %%I in (%*) do (
	set ITEM_PATH=%%~I
	setlocal EnableDelayedExpansion
	
	if "!ITEM_PATH:~0,2!" == "\\" (
		echo �@�G���[�B�F�A�C�e���p�X�Ƀl�b�g���[�N�p�X���w�肳��Ă��܂��B
		echo �@�@�@�@�@�@�E!ITEM_PATH!
		goto END_NG
	)
	if  not exist "!ITEM_PATH!" (
		echo �@�G���[�C�F�A�C�e���p�X�����݂��܂���B
		echo �@�@�@�@�@�@�E!ITEM_PATH!
		goto END_NG
	)
	
	endlocal
)

echo �A�A�C�e���̌ʈ��k

for %%I in (%*) do (
	set ITEM_PATH=%%~I
	setlocal EnableDelayedExpansion
	
	echo �������k�Ώہ����F!ITEM_PATH!
	%ZIP_EXE% a -tzip "!ITEM_PATH!.zip" "!ITEM_PATH!"
	
	if %ERRORLEVEL% neq %RT_OK% (
		goto END_NG
	)
	
	endlocal
)

echo �B����I��
pause
exit /b %RT_OK%

:END_NG
echo �B�ُ�I��
pause
exit /b %RT_NG%
