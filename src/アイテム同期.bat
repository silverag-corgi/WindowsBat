@echo off

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
rem :: �@�\���@�@�@�F�@�A�C�e������
rem :: �T�v�T�v�@�@�F�@�A�C�e���𓯊�(�~���[�����O�E�o�b�N�A�b�v)����B
rem :: ����
rem :: �@�����P�@�@�F�@�o�b�N�A�b�v���t�H���_�@(��FH:\Documents)
rem :: �@�����Q�@�@�F�@�o�b�N�A�b�v��t�H���_�@(��FF:)
rem :: �o��
rem :: �@�߂�l�@�@�F�@0(����I��)�A1(�ُ�I��)
rem :: �@�t�@�C���@�F�@���O�t�@�C��(log_[yyyymmdd]-[hhmmss].txt)
rem :: ���l�@�@�@�@�F�@�����Ƀl�b�g���[�N�p�X���w�肷��ۂ́A
rem :: �@�@�@�@�@�@�@�@���O�Ɏ��i������͂��ĔF�؍ς݂ɂ��邱�ƁB
rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
rem :: �ϐ��ݒ�i���[�U�ݒ荀�ځj
rem :: ���o�b�`���g�p����O�Ƀ��[�U���ݒ肷�邱�Ɓ�
rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

rem �ϐ����F���O�t�H���_
rem �T�v�@�F���O�t�@�C�����o�͂���t�H���_�̃p�X��ݒ肷��B
set LOG_DIR=..\log

echo ���ݒ�l�i���[�U�ݒ荀�ځj��
echo   LOG_DIR = %LOG_DIR%
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

rem �ϐ����F���O�t�@�C��
rem �T�v�@�F���O�t�@�C���̃p�X��ݒ肷��B
set LOG_FILE=%LOG_DIR%\log_%YMD%-%HMS%.txt

echo ���ݒ�l�i�o�b�`�ݒ荀�ځj��
echo   NUM_OF_ARGS = %NUM_OF_ARGS%
echo   YMD = %YMD%
echo   HMS = %HMS%
echo   LOG_FILE = %LOG_FILE%
echo;

rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
rem :: �����J�n
rem ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

echo �������J�n��

echo �@�����`�F�b�N

if not exist %LOG_DIR% (
	echo �@�G���[�@�F���O�t�@�C�����o�͂���t�H���_�����݂��܂���B
	echo �@�@�@�@�@�@�E%LOG_DIR%
	goto END_NG
)
for %%I in (%*) do (
	set /a NUM_OF_ARGS=NUM_OF_ARGS+1
)
if %NUM_OF_ARGS% neq 2 (
	echo �@�G���[�A�F�����̐��ɉߕs��������܂��B
	goto END_NG
)
if  not exist "%~1" (
	echo �@�G���[�C�F�o�b�N�A�b�v���t�H���_�����݂��܂���B
	echo �@�@�@�@�@�@�E%1
	goto END_NG
)

echo �A�~���[�����O�E�o�b�N�A�b�v�̎��s

set BKUP_SRC=%~1
set BKUP_DST=%~2

rem �g�p��
rem 	robocopy �o�b�N�A�b�v���t�H���_ �o�b�N�A�b�v��t�H���_ [�I�v�V����]
rem �I�v�V����(�R�s�[)
rem 	/b					: ���A�N�Z�X�������f�[�^�̋����o�b�N�A�b�v�@��BackupOperators�����t�^
rem 	/copy:dat			: ���R�s�[���(d=�f�[�^�Aa=�����At=�^�C���X�^���v)�@���K��l
rem 	/dcopy:da			: ���R�s�[���(d=�f�[�^�Aa=����)�@���K��l
rem 	/mir				: ���~���[�����O�@���Ȃ����t�H���_�̃^�C���X�^���v���R�s�[�����B
rem �I�v�V����(�t�@�C���I��)
rem 	/xd					: ���t�H���_�̏��O
rem 	/xj					: ���W�����N�V�����E�V���{���b�N�����N�̏��O
rem �I�v�V����(�Ď��s)
rem 	/r:0				: ���ăR�s�[���s��(��)
rem 	/w:0				: ���Ď��s�ҋ@����(�b)
rem �I�v�V����(���O)
rem 	/log+:[log_file]	: �����O�o��(�t�@�C��)
rem 	/tee				: �����O�o��(�R�}���h���C��)
rem 	/ts					: ���t�@�C���̃^�C���X�^���v�\��
rem 	/fp					: ���t�@�C���̐�΃p�X�\��
rem 	/ns					: ���t�@�C���̃T�C�Y��\��
rem 	/np					: ���i�s�󋵔�\��
robocopy "%BKUP_SRC%" "%BKUP_DST%" ^
			/mir ^
			/xd "System Volume Information" "$RECYCLE.BIN" /xj ^
			/r:0 /w:0 ^
			/log+:"%LOG_FILE%" /tee /ts /fp /ns /np

echo �@���O�t�@�C�����G�f�B�^�ŊJ���܂��B
echo �@�E%LOG_FILE%
start %LOG_FILE%

echo �B����I��
exit /b %RT_OK%

:END_NG
echo �B�ُ�I��
exit /b %RT_NG%
