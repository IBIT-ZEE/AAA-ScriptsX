@Echo Off
@Cls
echo  ���������������������������������������������������������������������������Ŀ
echo  � IBIT � Inform�tica, Bur�tica e Inova��o Tecnol�gica, LDA.    ����������ͻ �
echo  � R. Jos� Ribeiro Vieira de Castro, 12                         �    /\    � �
echo  � 4820-273 Fafe                                                �  /_\/_\  � �
echo  �                                                              � �������� � �
echo  � Internet : www.ibit.pt                Tel/Ctr : 253 599 999  � ArteWare � �
echo  � e-mail   : mail@ibit.pt               Fax/Tel : 253 599 555  ����������ͼ �
echo  �����������������������������������������������������������������������������
if "%1"=="/n" GOTO END
  echo.
  echo.
:END
  if not "%1"=="/n" Call %1 %2 %3 %4 %5 %6 %7 %8 %9

