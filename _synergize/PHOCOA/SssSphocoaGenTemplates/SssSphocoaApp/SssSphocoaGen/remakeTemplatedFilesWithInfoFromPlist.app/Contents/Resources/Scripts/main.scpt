FasdUAS 1.101.10   ��   ��    k             l      ��  ��   ��
remakeTemplatedFilesWithInfoFromPlist.scpt
needs remakeTemplatedFilesWithInfoFromPlist php shell script as this is a droplet/GUI frontend to it

used to copy setup the config files of a SssSphocoaProject
using the information passed in plist(s)

this script may also be run from shell:
/usr/bin/osascript -s so pathTo/remakeTemplatedFilesWithInfoFromPlist.scpt plistPath0 ... plistPathN

tho you may as well run cli directly if you don't need gui:
pathTo/remakeTemplatedFilesWithInfoFromPlist.scpt/Contents/Resources/remakeTemplatedFilesWithInfoFromPlist plistPath0 ... plistPathN

version: 20100506_152531
author: SwissalpS@LukeZimmermann.com

copyright: free to use at own risk
     � 	 	R 
 r e m a k e T e m p l a t e d F i l e s W i t h I n f o F r o m P l i s t . s c p t 
 n e e d s   r e m a k e T e m p l a t e d F i l e s W i t h I n f o F r o m P l i s t   p h p   s h e l l   s c r i p t   a s   t h i s   i s   a   d r o p l e t / G U I   f r o n t e n d   t o   i t 
 
 u s e d   t o   c o p y   s e t u p   t h e   c o n f i g   f i l e s   o f   a   S s s S p h o c o a P r o j e c t 
 u s i n g   t h e   i n f o r m a t i o n   p a s s e d   i n   p l i s t ( s ) 
 
 t h i s   s c r i p t   m a y   a l s o   b e   r u n   f r o m   s h e l l : 
 / u s r / b i n / o s a s c r i p t   - s   s o   p a t h T o / r e m a k e T e m p l a t e d F i l e s W i t h I n f o F r o m P l i s t . s c p t   p l i s t P a t h 0   . . .   p l i s t P a t h N 
 
 t h o   y o u   m a y   a s   w e l l   r u n   c l i   d i r e c t l y   i f   y o u   d o n ' t   n e e d   g u i : 
 p a t h T o / r e m a k e T e m p l a t e d F i l e s W i t h I n f o F r o m P l i s t . s c p t / C o n t e n t s / R e s o u r c e s / r e m a k e T e m p l a t e d F i l e s W i t h I n f o F r o m P l i s t   p l i s t P a t h 0   . . .   p l i s t P a t h N 
 
 v e r s i o n :   2 0 1 0 0 5 0 6 _ 1 5 2 5 3 1 
 a u t h o r :   S w i s s a l p S @ L u k e Z i m m e r m a n n . c o m 
 
 c o p y r i g h t :   f r e e   t o   u s e   a t   o w n   r i s k 
   
  
 l     ��������  ��  ��        j     �� �� 0 sbinpath sBinPath  m        �          j    �� �� 0 usedefaults useDefaults  m       �    - n o I n t e r a c t i o n        j    �� �� 0 usepathdest usePathDest  m       �          l          j   	 ��  �� 0 mainwinbounds mainWinBounds   J   	  ! !  " # " m   	 
���� 
 #  $ % $ m   
 ���� P %  & ' & m    ����X '  (�� ( m    ����X��      x, y, h, w !!!!     � ) )     x ,   y ,   h ,   w   ! ! ! !   * + * l     ��������  ��  ��   +  , - , p     . . ������ 0 mainwin mainWin��   -  / 0 / l     ��������  ��  ��   0  1 2 1 l     �� 3 4��   3   droplet entrance    4 � 5 5 "   d r o p l e t   e n t r a n c e 2  6 7 6 i     8 9 8 I     �� :��
�� .aevtodocnull  �    alis : o      ���� 0 thefiles theFiles��   9 k     ! ; ;  < = < n     > ? > I    �������� 0 init  ��  ��   ?  f      =  @ A @ l   ��������  ��  ��   A  B�� B X    ! C�� D C n    E F E I    �� G���� 0 dofile doFile G  H�� H o    ���� 0 eachfile eachFile��  ��   F  f    �� 0 eachfile eachFile D o   	 
���� 0 thefiles theFiles��   7  I J I l     ��������  ��  ��   J  K L K l     �� M N��   M %  doubleclick and shell entrance    N � O O >   d o u b l e c l i c k   a n d   s h e l l   e n t r a n c e L  P Q P i     R S R I     �� T��
�� .aevtoappnull  �   � **** T o      ���� 0 argv  ��   S k     � U U  V W V n     X Y X I    �������� 0 init  ��  ��   Y  f      W  Z [ Z l   ��������  ��  ��   [  \ ] \ r    
 ^ _ ^ J    ����   _ o      ���� 0 thefiles theFiles ]  ` a ` Z    - b c���� b =    d e d m    ��
�� 
list e n    f g f 1    ��
�� 
pcls g o    ���� 0 argv   c Z   ) h i���� h A     j k j m    ����   k l    l���� l I   �� m��
�� .corecnte****       **** m o    ���� 0 argv  ��  ��  ��   i r    % n o n n   # p q p I    #�� r���� *0 parseshellarguments parseShellArguments r  s�� s o    ���� 0 argv  ��  ��   q  f     o o      ���� 0 thefiles theFiles��  ��  ��  ��   a  t u t l  . .��������  ��  ��   u  v�� v Z   . � w x�� y w A   . 5 z { z m   . /����   { l  / 4 |���� | I  / 4�� }��
�� .corecnte****       **** } o   / 0���� 0 thefiles theFiles��  ��  ��   x X   8 S ~��  ~ n  H N � � � I   I N�� ����� 0 dofile doFile �  ��� � o   I J���� 0 eachfile eachFile��  ��   �  f   H I�� 0 eachfile eachFile  o   ; <���� 0 thefiles theFiles��   y k   V � � �  � � � l  V V�� � ���   �   (no file passed?)    � � � � $   ( n o   f i l e   p a s s e d ? ) �  � � � l  V V�� � ���   �   doubleclick    � � � �    d o u b l e c l i c k �  � � � r   V c � � � l  V a ����� � I  V a���� �
�� .sysostdfalis    ��� null��   � �� � �
�� 
lfiv � m   \ ]��
�� boovtrue � �� � �
�� 
mlsl � �� ���
�� 
shpc��  ��  ��   � o      ���� 0 thefiles theFiles �  � � � Z  d u � ����� � >  d i � � � m   d e��
�� 
list � n  e h � � � 1   f h��
�� 
pcls � o   e f���� 0 thefiles theFiles � r   l q � � � J   l o � �  ��� � o   l m���� 0 thefiles theFiles��   � o      ���� 0 thefiles theFiles��  ��   �  ��� � X   v � ��� � � n  � � � � � I   � ��� ����� 0 dofile doFile �  ��� � o   � ����� 0 eachfile eachFile��  ��   �  f   � ��� 0 eachfile eachFile � o   y z���� 0 thefiles theFiles��  ��   Q  � � � l     ��������  ��  ��   �  � � � i    � � � I      �������� 0 init  ��  ��   � k     = � �  � � � l     ��������  ��  ��   �  � � � r      � � � m     ��
�� 
null � o      ���� 0 mainwin mainWin �  � � � l   ����~��  �  �~   �  � � � Q    # � � � � r     � � � c     � � � l    ��}�| � I   �{ ��z
�{ .sysorpthalis        TEXT � m     � � � � � J r e m a k e T e m p l a t e d F i l e s W i t h I n f o F r o m P l i s t�z  �}  �|   � m    �y
�y 
TEXT � o      �x�x 0 spath2me sPath2Me � R      �w�v�u
�w .ascrerr ****      � ****�v  �u   � k    # � �  � � � l   �t � ��t   � %  path to resource requires 10.4    � � � � >   p a t h   t o   r e s o u r c e   r e q u i r e s   1 0 . 4 �  � � � l   �s � ��s   �   fake it for older OSes    � � � � .   f a k e   i t   f o r   o l d e r   O S e s �  ��r � r    # � � � b    ! � � � l    ��q�p � I   �o � �
�o .earsffdralis        afdr �  f     � �n ��m
�n 
rtyp � m    �l
�l 
TEXT�m  �q  �p   � m      � � � � � p C o n t e n t s : R e s o u r c e s : r e m a k e T e m p l a t e d F i l e s W i t h I n f o F r o m P l i s t � o      �k�k 0 spath2me sPath2Me�r   �  � � � l  $ $�j�i�h�j  �i  �h   �  ��g � Q   $ = � � � � l  ' 0 � � � � r   ' 0 � � � l  ' , ��f�e � n   ' , � � � 1   * ,�d
�d 
strq � l  ' * ��c�b � n   ' * � � � 1   ( *�a
�a 
psxp � o   ' (�`�` 0 spath2me sPath2Me�c  �b  �f  �e   � n      � � � o   - /�_�_ 0 sbinpath sBinPath �  f   , - �  as text    � � � �  a s   t e x t � R      �^ � �
�^ .ascrerr ****      � **** � o      �]�] 0 emsg eMsg � �\ ��[
�\ 
errn � o      �Z�Z 0 enum eNum�[   � I  8 =�Y ��X
�Y .sysodlogaskr        TEXT � o   8 9�W�W 0 emsg eMsg�X  �g   �  � � � l     �V�U�T�V  �U  �T   �  � � � i     � � � I      �S ��R�S 0 dofile doFile �  ��Q � o      �P�P 0 afile aFile�Q  �R   � Q     � � � � � O    �   k    �  Z    ,�O l   �N�M =    	
	 m    �L
�L 
null
 n    o   	 �K�K 0 mainwin mainWin  f    	�N  �M   k    $  r     I   �J�I
�J .coredoscnull��� ��� ctxt m     �   e c h o   ' H i   t h e r e ' ;�I   n      o    �H�H 0 mainwin mainWin  f     �G n   $ I    $�F�E�F �0 Esetboundsofterminalwindowwithxtermescapesequencesasapplescriptisbuggy EsetBoundsOfTerminalWindowWithXtermEscapeSequencesAsAppleScriptIsBuggy  n    o    �D�D 0 mainwin mainWin  f     �C n     !  o     �B�B 0 mainwinbounds mainWinBounds!  f    �C  �E    f    �G  �O   I  ' ,�A�@�?
�A .miscactvnull��� ��� null�@  �?   "#" Q   - �$%&$ k   0 ?'' ()( l  0 0�>*+�>  * k e shell paths (altho they are already converted to aliases in this setup by parseShellArguments(argv))   + �,, �   s h e l l   p a t h s   ( a l t h o   t h e y   a r e   a l r e a d y   c o n v e r t e d   t o   a l i a s e s   i n   t h i s   s e t u p   b y   p a r s e S h e l l A r g u m e n t s ( a r g v ) )) -�=- r   0 ?./. c   0 =010 l  0 ;2�<�;2 b   0 ;343 b   0 5565 n  0 3787 o   1 3�:�: 0 sbinpath sBinPath8  f   0 16 m   3 499 �::   4 l  5 :;�9�8; n   5 :<=< 1   8 :�7
�7 
strq= l  5 8>�6�5> c   5 8?@? o   5 6�4�4 0 afile aFile@ m   6 7�3
�3 
psxf�6  �5  �9  �8  �<  �;  1 m   ; <�2
�2 
ctxt/ o      �1�1 0 	thescript 	theScript�=  % R      �0AB
�0 .ascrerr ****      � ****A o      �/�/ 0 emsg eMsgB �.C�-
�. 
errnC o      �,�, 0 enum eNum�-  & Q   G �DEFD k   J [GG HIH l  J J�+JK�+  J   aliases   K �LL    a l i a s e sI M�*M r   J [NON c   J YPQP l  J WR�)�(R b   J WSTS b   J OUVU n  J MWXW o   K M�'�' 0 sbinpath sBinPathX  f   J KV m   M NYY �ZZ   T l  O V[�&�%[ n   O V\]\ 1   T V�$
�$ 
strq] l  O T^�#�"^ n   O T_`_ 1   P T�!
�! 
psxp` o   O P� �  0 afile aFile�#  �"  �&  �%  �)  �(  Q m   W X�
� 
ctxtO o      �� 0 	thescript 	theScript�*  E R      �ab
� .ascrerr ****      � ****a o      �� 0 emsg eMsgb �c�
� 
errnc o      �� 0 enum eNum�  F k   c �dd efe I  c h�g�
� .miscactvnull��� ��� nullg  f   c d�  f hih I  i n�j�
� .sysodlogaskr        TEXTj o   i j�� 0 emsg eMsg�  i k�k r   o �lml b   o ~non b   o zpqp b   o xrsr b   o ttut m   o rvv �ww � e c h o   ' o o p s ,   A p p l e S c r i p t   E r r o r   c o n v e r t i n g   o r   f i n d i n g   f i l e ,   s k i p p i n g .   A S E (u o   r s�� 0 enum eNums m   t wxx �yy  )  q o   x y�� 0 emsg eMsgo m   z }zz �{{  ' ;m o      �� 0 	thescript 	theScript�  # |}| I  � ��~
� .coredoscnull��� ��� ctxt~ o   � ��� 0 	thescript 	theScript ���
� 
kfil� n  � ���� o   � ��� 0 mainwin mainWin�  f   � ��  } ��
� I  � ��	��
�	 .miscactvnull��� ��� null�  �  �
   m    ���                                                                                      @  alis    P  OS5                        �/�
H+     �Terminal.app                                                     Lv�r�        ����  	                	Utilities     �/��      �Vx       �   �  'OS5:Applications:Utilities:Terminal.app     T e r m i n a l . a p p    O S 5  #Applications/Utilities/Terminal.app   / ��   � R      ���
� .ascrerr ****      � ****� o      �� 0 emsg eMsg� ���
� 
errn� o      �� 0 enum eNum�   � k   � ��� ��� I  � ���� 
� .miscactvnull��� ��� null�  f   � ��   � ���� I  � ������
�� .sysodlogaskr        TEXT� c   � ���� b   � ���� b   � ���� b   � ���� b   � ���� m   � ��� ���  c o u l d n ' t   r u n  � o   � ����� 0 afile aFile� o   � ���
�� 
ret � m   � ��� ���  b e c a u s e :  � o   � ����� 0 emsg eMsg� m   � ���
�� 
ctxt��  ��   � ��� l     ��������  ��  ��  � ��� i  ! $��� I      ������� *0 parseshellarguments parseShellArguments� ���� o      ���� 0 argv  ��  ��  � k     Y�� ��� r     ��� J     ����  � o      ���� 0 
tracefiles 
traceFiles� ��� X    V����� k    Q�� ��� Q    >���� k    3�� ��� l   ������  � / ) this may generate an error at parse time   � ��� R   t h i s   m a y   g e n e r a t e   a n   e r r o r   a t   p a r s e   t i m e� ��� l   ������  � ' !set theFile to POSIX file eachArg   � ��� B s e t   t h e F i l e   t o   P O S I X   f i l e   e a c h A r g� ��� l   ������  � ( " when this only checks at runtime.   � ��� D   w h e n   t h i s   o n l y   c h e c k s   a t   r u n t i m e .� ��� l   ������  � � z thank you Bruce Phillips http://macscripter.net/profile.php?id=5342 http://macscripter.net/viewtopic.php?pid=67264#p67264   � ��� �   t h a n k   y o u   B r u c e   P h i l l i p s   h t t p : / / m a c s c r i p t e r . n e t / p r o f i l e . p h p ? i d = 5 3 4 2   h t t p : / / m a c s c r i p t e r . n e t / v i e w t o p i c . p h p ? p i d = 6 7 2 6 4 # p 6 7 2 6 4� ��� r    ��� c    ��� o    ���� 0 eacharg eachArg� m    ��
�� 
psxf� o      ���� 0 thefile theFile� ���� O   3��� Z  " 2������� H   " (�� l  " '������ I  " '�����
�� .coredoexbool        obj � o   " #���� 0 thefile theFile��  ��  ��  � r   + .��� m   + ,��
�� boovfals� o      ���� 0 thefile theFile��  ��  � m    ���                                                                                  MACS   alis    V  OS5                        �/�
H+     �
Finder.app                                                       s��0�4        ����  	                CoreServices    �/��      �0�       �   Q   P  *OS5:System:Library:CoreServices:Finder.app   
 F i n d e r . a p p    O S 5  &System/Library/CoreServices/Finder.app  / ��  ��  � R      ������
�� .ascrerr ****      � ****��  ��  � r   ; >��� m   ; <��
�� boovfals� o      ���� 0 thefile theFile� ��� l  ? ?��������  ��  ��  � ��� Z  ? O������� >   ? B��� m   ? @��
�� boovfals� o   @ A���� 0 thefile theFile� r   E K��� l  E H������ c   E H��� o   E F���� 0 thefile theFile� m   F G��
�� 
alis��  ��  � n     ���  ;   I J� o   H I���� 0 
tracefiles 
traceFiles��  ��  � ���� l  P P��������  ��  ��  ��  �� 0 eacharg eachArg� o    	���� 0 argv  � ���� L   W Y�� o   W X���� 0 
tracefiles 
traceFiles��  � ��� l     ��������  ��  ��  � ���� i  % (��� I      ������� �0 Esetboundsofterminalwindowwithxtermescapesequencesasapplescriptisbuggy EsetBoundsOfTerminalWindowWithXtermEscapeSequencesAsAppleScriptIsBuggy� ��� o      ���� 0 	thewindow 	theWindow� ���� o      ���� 0 	thebounds 	theBounds��  ��  � k     .�� ��� r     !��� l    ������ c     ��� b     ��� b        b      b      b      b     	 b     

 b      m      �   e c h o   - e n   ' \ E [ 3 ; ' l   ���� n     4    ��
�� 
cobj m    ����  o    ���� 0 	thebounds 	theBounds��  ��   m     �  ' ; '	 l   ���� n     4   	 ��
�� 
cobj m   
 ����  o    	���� 0 	thebounds 	theBounds��  ��   m     � ( ' t ' ; e c h o   - e n   ' \ E [ 4 ; ' l   ���� n     4    ��
�� 
cobj m    ����  o    ���� 0 	thebounds 	theBounds��  ��   m       �!!  ' ; ' l   "����" n    #$# 4    ��%
�� 
cobj% m    ���� $ o    ���� 0 	thebounds 	theBounds��  ��  � m    && �''  ' t ' ; c l e a r ;� m    ��
�� 
TEXT��  ��  � o      ���� 0 	thescript 	theScript� (��( O   " .)*) k   & -++ ,-, l  & &��./��  .  display dialog theScript   / �00 0 d i s p l a y   d i a l o g   t h e S c r i p t- 1��1 I  & -��23
�� .coredoscnull��� ��� ctxt2 o   & '���� 0 	thescript 	theScript3 ��4��
�� 
kfil4 o   ( )���� 0 	thewindow 	theWindow��  ��  * m   " #55�                                                                                      @  alis    P  OS5                        �/�
H+     �Terminal.app                                                     Lv�r�        ����  	                	Utilities     �/��      �Vx       �   �  'OS5:Applications:Utilities:Terminal.app     T e r m i n a l . a p p    O S 5  #Applications/Utilities/Terminal.app   / ��  ��  ��       ��6   789:;<=��  6 
���������������������� 0 sbinpath sBinPath�� 0 usedefaults useDefaults�� 0 usepathdest usePathDest�� 0 mainwinbounds mainWinBounds
�� .aevtodocnull  �    alis
�� .aevtoappnull  �   � ****�� 0 init  �� 0 dofile doFile�� *0 parseshellarguments parseShellArguments�� �0 Esetboundsofterminalwindowwithxtermescapesequencesasapplescriptisbuggy EsetBoundsOfTerminalWindowWithXtermEscapeSequencesAsAppleScriptIsBuggy7 ��>�� >  ���������� 
�� P��X��X8 �� 9����?@��
�� .aevtodocnull  �    alis�� 0 thefiles theFiles��  ? ������ 0 thefiles theFiles�� 0 eachfile eachFile@ ������������ 0 init  
�� 
kocl
�� 
cobj
�� .corecnte****       ****�� 0 dofile doFile�� ")j+  O �[��l kh )�k+ [OY��9 �� S���AB�~
�� .aevtoappnull  �   � ****�� 0 argv  �  A �}�|�} 0 argv  �| 0 eachfile eachFileB �{�z�y�x�w�v�u�t�s�r�q�p�o�n�{ 0 init  �z 0 thefiles theFiles
�y 
list
�x 
pcls
�w .corecnte****       ****�v *0 parseshellarguments parseShellArguments
�u 
kocl
�t 
cobj�s 0 dofile doFile
�r 
lfiv
�q 
mlsl
�p 
shpc�o 
�n .sysostdfalis    ��� null�~ �)j+  OjvE�O��,  j�j  )�k+ E�Y hY hOj�j    �[��l kh )�k+ [OY��Y =*�e�e�e� E�O���, 
�kvE�Y hO �[��l kh )�k+ [OY��: �m ��l�kCD�j�m 0 init  �l  �k  C �i�h�g�i 0 spath2me sPath2Me�h 0 emsg eMsg�g 0 enum eNumD �f�e ��d�c�b�a�`�_ ��^�]�\�[E�Z
�f 
null�e 0 mainwin mainWin
�d .sysorpthalis        TEXT
�c 
TEXT�b  �a  
�` 
rtyp
�_ .earsffdralis        afdr
�^ 
psxp
�] 
strq�\ 0 sbinpath sBinPath�[ 0 emsg eMsgE �Y�X�W
�Y 
errn�X 0 enum eNum�W  
�Z .sysodlogaskr        TEXT�j >�E�O �j �&E�W X  )��l �%E�O ��,�,)�,FW X  �j ; �V ��U�TFG�S�V 0 dofile doFile�U �RH�R H  �Q�Q 0 afile aFile�T  F �P�O�N�M�P 0 afile aFile�O 0 	thescript 	theScript�N 0 emsg eMsg�M 0 enum eNumG ��L�K�J�I�H�G�F9�E�D�C�BIY�A�@vxz�?��>�
�L 
null�K 0 mainwin mainWin
�J .coredoscnull��� ��� ctxt�I 0 mainwinbounds mainWinBounds�H �0 Esetboundsofterminalwindowwithxtermescapesequencesasapplescriptisbuggy EsetBoundsOfTerminalWindowWithXtermEscapeSequencesAsAppleScriptIsBuggy
�G .miscactvnull��� ��� null�F 0 sbinpath sBinPath
�E 
psxf
�D 
strq
�C 
ctxt�B 0 emsg eMsgI �=�<�;
�= 
errn�< 0 enum eNum�;  
�A 
psxp
�@ .sysodlogaskr        TEXT
�? 
kfil
�> 
ret �S � �� ��)�,  �j )�,FO))�,)�,l+ Y *j O )�,�%��&�,%�&E�W @X   )�,�%�a ,�,%�&E�W $X  )j O�j Oa �%a %�%a %E�O�a )�,l O*j UW "X  )j Oa �%_ %a %�%�&j < �:��9�8JK�7�: *0 parseshellarguments parseShellArguments�9 �6L�6 L  �5�5 0 argv  �8  J �4�3�2�1�4 0 argv  �3 0 
tracefiles 
traceFiles�2 0 eacharg eachArg�1 0 thefile theFileK 	�0�/�.�-��,�+�*�)
�0 
kocl
�/ 
cobj
�. .corecnte****       ****
�- 
psxf
�, .coredoexbool        obj �+  �*  
�) 
alis�7 ZjvE�O P�[��l kh   ��&E�O� �j  fE�Y hUW 
X  fE�Of� ��&�6FY hOP[OY��O�= �(��'�&MN�%�( �0 Esetboundsofterminalwindowwithxtermescapesequencesasapplescriptisbuggy EsetBoundsOfTerminalWindowWithXtermEscapeSequencesAsAppleScriptIsBuggy�' �$O�$ O  �#�"�# 0 	thewindow 	theWindow�" 0 	thebounds 	theBounds�&  M �!� ��! 0 	thewindow 	theWindow�  0 	thebounds 	theBounds� 0 	thescript 	theScriptN � �&�5��
� 
cobj� 
� 
TEXT
� 
kfil
� .coredoscnull��� ��� ctxt�% /��k/%�%��l/%�%��m/%�%���/%�%�&E�O� 	��l 
Uascr  ��ޭ