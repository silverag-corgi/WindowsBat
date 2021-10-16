@echo off

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
rem :: �@�\���@�@�@�F�@�A�C�e���ꗗ�o��
rem :: �T�v�T�v�@�@�F�@�A�C�e���̐�΃p�X�̈ꗗ���ċA�I�ɏo�͂���B
rem :: ����
rem :: �@�����P�@�@�F�@�A�C�e���p�X(������)�@�����[�J���p�X�̂�
rem :: �o��
rem :: �@�߂�l�@�@�F�@0(����I��)�A1(�ُ�I��)
rem :: �@�t�@�C���@�F�@�A�C�e���ꗗ�t�@�C��(list_[yyyymmdd]-[hhmmss].txt)
rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
rem :: �ϐ��ݒ�i���[�U�ݒ荀�ځj
rem :: ���o�b�`���g�p����O�Ƀ��[�U���ݒ肷�邱�Ɓ�
rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

rem �ϐ����F�A�C�e���ꗗ�t�H���_
rem �T�v�@�F�A�C�e���ꗗ�t�@�C�����o�͂���t�H���_�̃p�X��ݒ肷��B
set ITEM_LIST_DIR=..\output\list

echo ���ݒ�l�i���[�U�ݒ荀�ځj��
echo   ITEM_LIST_DIR = %ITEM_LIST_DIR%
echo;

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
rem :: �ϐ��ݒ�i�o�b�`�ݒ荀�ځj
rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

rem �ϐ����F�I���X�e�[�^�X
set RT_OK=0
set RT_NG=1

rem �ϐ����F�����̐�
set NUM_OF_ARGS=0

rem �ϐ����F�N����
rem �T�v�@�F�N������yyyymmdd�`���Ŏ擾����B
set YMD=%DATE:/=%

rem �ϐ����F�����b
rem �T�v�@�F�����b��HHmmss�`���Ŏ擾����B
set HMS=%TIME: =0%
set HMS=%HMS:~0,2%%HMS:~3,2%%HMS:~6,2%

rem �ϐ����F�A�C�e���ꗗ�t�@�C��
rem �T�v�@�F�A�C�e���ꗗ�t�@�C���̃p�X��ݒ肷��B
set ITEM_LIST_FILE=%ITEM_LIST_DIR%\list_%YMD%-%HMS%.txt

echo ���ݒ�l�i�o�b�`�ݒ荀�ځj��
echo   NUM_OF_ARGS = %NUM_OF_ARGS%
echo   YMD = %YMD%
echo   HMS = %HMS%
echo   ITEM_LIST_FILE = %ITEM_LIST_FILE%
echo;

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
rem :: �����J�n
rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

echo �������J�n��

echo �@�����`�F�b�N

if not exist %ITEM_LIST_DIR% (
	echo �@�G���[�@�F�A�C�e���ꗗ�t�@�C�����o�͂���t�H���_�����݂��܂���B
	echo �@�@�@�@�@�@�E%ITEM_LIST_DIR%
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

echo �A�A�C�e���ꗗ�t�@�C���̏o��

for %%I in (%*) do (
	set ITEM_PATH=%%~I
	setlocal EnableDelayedExpansion
	
	echo �@�o�͑ΏہF!ITEM_PATH!
	WHERE /R "!ITEM_PATH!" *.* >> "%ITEM_LIST_FILE%" /F /T
	
	if !ERRORLEVEL! neq %RT_OK% (
		goto END_NG
	)
	
	endlocal
)

echo �@�A�C�e���ꗗ�t�@�C�����o�͂��܂����B�G�f�B�^�ŊJ���܂��B
echo �@�E%ITEM_LIST_FILE%
start %ITEM_LIST_FILE%

echo �B����I��
pause
exit /b %RT_OK%

:END_NG
echo �B�ُ�I��
pause
exit /b %RT_NG%
