FasdUAS 1.101.10   ��   ��    k             l      ��  ��   GA
newSssSphocoaProject.scpt
needs newSssSphocoaProject php shell script as this is a droplet/GUI frontend to it

used to copy project structure from a template and setup the config files and other duties
everytime newSssSphocoaProject is run successfully it creates plist files. You can edit or
use these files to drop onto this droplet

this script may also be run from shell:
/usr/bin/osascript -s so pathTo/newSssSphocoaProject.scpt [-noInteraction] plistPath0 ... plistPathN

version: 20100503_183328
author: SwissalpS@LukeZimmermann.com

copyright: free to use at own risk
     � 	 	� 
 n e w S s s S p h o c o a P r o j e c t . s c p t 
 n e e d s   n e w S s s S p h o c o a P r o j e c t   p h p   s h e l l   s c r i p t   a s   t h i s   i s   a   d r o p l e t / G U I   f r o n t e n d   t o   i t 
 
 u s e d   t o   c o p y   p r o j e c t   s t r u c t u r e   f r o m   a   t e m p l a t e   a n d   s e t u p   t h e   c o n f i g   f i l e s   a n d   o t h e r   d u t i e s 
 e v e r y t i m e   n e w S s s S p h o c o a P r o j e c t   i s   r u n   s u c c e s s f u l l y   i t   c r e a t e s   p l i s t   f i l e s .   Y o u   c a n   e d i t   o r 
 u s e   t h e s e   f i l e s   t o   d r o p   o n t o   t h i s   d r o p l e t 
 
 t h i s   s c r i p t   m a y   a l s o   b e   r u n   f r o m   s h e l l : 
 / u s r / b i n / o s a s c r i p t   - s   s o   p a t h T o / n e w S s s S p h o c o a P r o j e c t . s c p t   [ - n o I n t e r a c t i o n ]   p l i s t P a t h 0   . . .   p l i s t P a t h N 
 
 v e r s i o n :   2 0 1 0 0 5 0 3 _ 1 8 3 3 2 8 
 a u t h o r :   S w i s s a l p S @ L u k e Z i m m e r m a n n . c o m 
 
 c o p y r i g h t :   f r e e   t o   u s e   a t   o w n   r i s k 
   
  
 l     ��������  ��  ��        j     �� �� 0 sbinpath sBinPath  m        �   � / V o l u m e s / U N I X / I m g S r a c h / p u b l i c / S s s S / _ s y n e r g i z e / P H O C O A / n e w S s s S p h o c o a P r o j e c t      j    �� �� 0 usedefaults useDefaults  m       �    - n o I n t e r a c t i o n        j    �� �� 0 usepathdest usePathDest  m       �          l          j   	 ��  �� 0 mainwinbounds mainWinBounds   J   	  ! !  " # " m   	 
���� 
 #  $ % $ m   
 ���� P %  & ' & m    ����X '  (�� ( m    ����X��      x, y, h, w !!!!     � ) )     x ,   y ,   h ,   w   ! ! ! !   * + * l     ��������  ��  ��   +  , - , p     . . ������ 0 mainwin mainWin��   -  / 0 / l     ��������  ��  ��   0  1 2 1 l     �� 3 4��   3   droplet entrance    4 � 5 5 "   d r o p l e t   e n t r a n c e 2  6 7 6 i     8 9 8 I     �� :��
�� .aevtodocnull  �    alis : o      ���� 0 thefiles theFiles��   9 k     ' ; ;  < = < n     > ? > I    �������� 0 init  ��  ��   ?  f      =  @ A @ n    B C B I    �������� *0 askaboutinteraction askAboutInteraction��  ��   C  f     A  D E D l   ��������  ��  ��   E  F�� F X    ' G�� H G n   " I J I I    "�� K���� 0 dofile doFile K  L�� L o    ���� 0 eachfile eachFile��  ��   J  f    �� 0 eachfile eachFile H o    ���� 0 thefiles theFiles��   7  M N M l     ��������  ��  ��   N  O P O l     �� Q R��   Q %  doubleclick and shell entrance    R � S S >   d o u b l e c l i c k   a n d   s h e l l   e n t r a n c e P  T U T i     V W V I     �� X��
�� .aevtoappnull  �   � **** X o      ���� 0 argv  ��   W k     � Y Y  Z [ Z n     \ ] \ I    �������� 0 init  ��  ��   ]  f      [  ^ _ ^ r     ` a ` m     b b � c c   a n      d e d o    
���� 0 usedefaults useDefaults e  f     _  f g f l   ��������  ��  ��   g  h i h r     j k j J    ����   k o      ���� 0 thefiles theFiles i  l m l Z    3 n o���� n =    p q p m    ��
�� 
list q n    r s r 1    ��
�� 
pcls s o    ���� 0 argv   o Z   / t u���� t A      v w v m    ����   w l    x���� x I   �� y��
�� .corecnte****       **** y o    ���� 0 argv  ��  ��  ��   u r   # + z { z n  # ) | } | I   $ )�� ~���� *0 parseshellarguments parseShellArguments ~  ��  o   $ %���� 0 argv  ��  ��   }  f   # $ { o      ���� 0 thefiles theFiles��  ��  ��  ��   m  � � � l  4 4��������  ��  ��   �  ��� � Z   4 � � ��� � � A   4 ; � � � m   4 5����   � l  5 : ����� � I  5 :�� ���
�� .corecnte****       **** � o   5 6���� 0 thefiles theFiles��  ��  ��   � X   > Y ��� � � n  N T � � � I   O T�� ����� 0 dofile doFile �  ��� � o   O P���� 0 eachfile eachFile��  ��   �  f   N O�� 0 eachfile eachFile � o   A B���� 0 thefiles theFiles��   � k   \ � � �  � � � l  \ \�� � ���   �   (no file passed?)    � � � � $   ( n o   f i l e   p a s s e d ? ) �  � � � l  \ \�� � ���   �   doubleclick    � � � �    d o u b l e c l i c k �  � � � r   \ i � � � l  \ g ����� � I  \ g���� �
�� .sysostdfalis    ��� null��   � �� � �
�� 
lfiv � m   b c��
�� boovtrue � �� � �
�� 
mlsl � �� ���
�� 
shpc��  ��  ��   � o      ���� 0 thefiles theFiles �  � � � Z  j { � ����� � >  j o � � � m   j k��
�� 
list � n  k n � � � 1   l n��
�� 
pcls � o   k l���� 0 thefiles theFiles � r   r w � � � J   r u � �  ��� � o   r s���� 0 thefiles theFiles��   � o      ���� 0 thefiles theFiles��  ��   �  � � � n  | � � � � I   } ��������� *0 askaboutinteraction askAboutInteraction��  ��   �  f   | } �  ��� � X   � � ��� � � n  � � � � � I   � ��� ����� 0 dofile doFile �  ��� � o   � ����� 0 eachfile eachFile��  ��   �  f   � ��� 0 eachfile eachFile � o   � ����� 0 thefiles theFiles��  ��   U  � � � l     ��������  ��  ��   �  � � � i    � � � I      ������� *0 askaboutinteraction askAboutInteraction��  �   � k     � � �  � � � r      � � � m      � � � � �  - n o I n t e r a c t i o n   � n      � � � o    �~�~ 0 usedefaults useDefaults �  f     �  � � � r     � � � m     � � � � �   � n      � � � o    
�}�} 0 usepathdest usePathDest �  f     �  � � � Z   , � ��|�{ � l    ��z�y � =    � � � n     � � � 1    �x
�x 
bhit � l    ��w�v � I   �u � �
�u .sysodlogaskr        TEXT � m     � � � � � P   u s e   V a l u e s   w i t h o u t   a s k i n g   f o r   a d a p t i o n ? � �t � �
�t 
btns � J     � �  � � � m     � � � � �  N o �  ��s � m     � � � � �  Y e s ,   A u t o�s   � �r � �
�r 
dflt � m     � � � � �  Y e s ,   A u t o � �q ��p
�q 
givu � m    �o�o �p  �w  �v   � m     � � � � �  N o�z  �y   � r   ! ( � � � m   ! $ � � � � �   � n      � � � o   % '�n�n 0 usedefaults useDefaults �  f   $ %�|  �{   �  � � � r   - E � � � l  - C ��m�l � I  - C�k � �
�k .sysodlogaskr        TEXT � m   - 0 � � � � � �   u s e   t a r g e t   ( s P a t h D e s t )   f r o m   p l i s t   o r   c h o o s e   t h e   d e s t i n a t i o n   n o w ? � �j 
�j 
btns  J   1 9  m   1 4 �   U s e   p l i s t   o r   c w d �i m   4 7 �		 $ C h o o s e   d e s t i n a t i o n�i   �h

�h 
dflt
 m   : = � $ C h o o s e   d e s t i n a t i o n �g�f
�g 
givu m   > ?�e�e �f  �m  �l   � o      �d�d 0 theres theRes �  l  F F�c�b�a�c  �b  �a   �` Z  F ��_�^ G   F Z l  F L�]�\ n  F L 1   G K�[
�[ 
gavu o   F G�Z�Z 0 theres theRes�]  �\   l  O V�Y�X =  O V n   O R 1   P R�W
�W 
bhit o   O P�V�V 0 theres theRes m   R U � $ C h o o s e   d e s t i n a t i o n�Y  �X   r   ] � !  c   ] �"#" l  ] |$�U�T$ b   ] |%&% b   ] x'(' m   ] `)) �**  - t a r g e t  ( l  ` w+�S�R+ n   ` w,-, 1   s w�Q
�Q 
strq- l  ` s.�P�O. n   ` s/0/ 1   o s�N
�N 
psxp0 l  ` o1�M�L1 I  ` o�K�J2
�K .sysostflalis    ��� null�J  2 �I34
�I 
lfiv3 m   h i�H
�H boovtrue4 �G3�F
�G 
shpc�F  �M  �L  �P  �O  �S  �R  & m   x {55 �66   �U  �T  # m   | �E
�E 
ctxt! n     787 o   � ��D�D 0 usepathdest usePathDest8  f   � ��_  �^  �`   � 9:9 l     �C�B�A�C  �B  �A  : ;<; i    =>= I      �@�?�>�@ 0 init  �?  �>  > k     =?? @A@ l     �=�<�;�=  �<  �;  A BCB r     DED m     �:
�: 
nullE o      �9�9 0 mainwin mainWinC FGF l   �8�7�6�8  �7  �6  G HIH Q    #JKLJ r    MNM c    OPO l   Q�5�4Q I   �3R�2
�3 .sysorpthalis        TEXTR m    SS �TT ( n e w S s s S p h o c o a P r o j e c t�2  �5  �4  P m    �1
�1 
TEXTN o      �0�0 0 spath2me sPath2MeK R      �/�.�-
�/ .ascrerr ****      � ****�.  �-  L k    #UU VWV l   �,XY�,  X %  path to resource requires 10.4   Y �ZZ >   p a t h   t o   r e s o u r c e   r e q u i r e s   1 0 . 4W [\[ l   �+]^�+  ]   fake it for older OSes   ^ �__ .   f a k e   i t   f o r   o l d e r   O S e s\ `�*` r    #aba b    !cdc l   e�)�(e I   �'fg
�' .earsffdralis        afdrf  f    g �&h�%
�& 
rtyph m    �$
�$ 
TEXT�%  �)  �(  d m     ii �jj N C o n t e n t s : R e s o u r c e s : n e w S s s S p h o c o a P r o j e c tb o      �#�# 0 spath2me sPath2Me�*  I klk l  $ $�"�!� �"  �!  �   l m�m Q   $ =nopn l  ' 0qrsq r   ' 0tut l  ' ,v��v n   ' ,wxw 1   * ,�
� 
strqx l  ' *y��y n   ' *z{z 1   ( *�
� 
psxp{ o   ' (�� 0 spath2me sPath2Me�  �  �  �  u n     |}| o   - /�� 0 sbinpath sBinPath}  f   , -r  as text   s �~~  a s   t e x to R      ��
� .ascrerr ****      � **** o      �� 0 emsg eMsg� ���
� 
errn� o      �� 0 enum eNum�  p I  8 =���
� .sysodlogaskr        TEXT� o   8 9�� 0 emsg eMsg�  �  < ��� l     ����  �  �  � ��� i  ! $��� I      ���
� 0 dofile doFile� ��	� o      �� 0 afile aFile�	  �
  � Q     ����� O    ���� k    ��� ��� Z    ,����� l   ���� =    ��� m    �
� 
null� n   ��� o   	 �� 0 mainwin mainWin�  f    	�  �  � k    $�� ��� r    ��� I   ���
� .coredoscnull��� ��� ctxt� m    �� ���   e c h o   ' H i   t h e r e ' ;�  � n     ��� o    � �  0 mainwin mainWin�  f    � ���� n   $��� I    $������� �0 Esetboundsofterminalwindowwithxtermescapesequencesasapplescriptisbuggy EsetBoundsOfTerminalWindowWithXtermEscapeSequencesAsAppleScriptIsBuggy� ��� n   ��� o    ���� 0 mainwin mainWin�  f    � ���� n    ��� o     ���� 0 mainwinbounds mainWinBounds�  f    ��  ��  �  f    ��  �  � I  ' ,������
�� .miscactvnull��� ��� null��  ��  � ��� Q   - ����� k   0 C�� ��� l  0 0������  � k e shell paths (altho they are already converted to aliases in this setup by parseShellArguments(argv))   � ��� �   s h e l l   p a t h s   ( a l t h o   t h e y   a r e   a l r e a d y   c o n v e r t e d   t o   a l i a s e s   i n   t h i s   s e t u p   b y   p a r s e S h e l l A r g u m e n t s ( a r g v ) )� ���� r   0 C��� c   0 A��� l  0 ?������ b   0 ?��� b   0 9��� b   0 5��� n  0 3��� o   1 3���� 0 sbinpath sBinPath�  f   0 1� m   3 4�� ���   � n  5 8��� o   6 8���� 0 usedefaults useDefaults�  f   5 6� l  9 >������ n   9 >��� 1   < >��
�� 
strq� l  9 <������ c   9 <��� o   9 :���� 0 afile aFile� m   : ;��
�� 
psxf��  ��  ��  ��  ��  ��  � m   ? @��
�� 
ctxt� o      ���� 0 	thescript 	theScript��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 emsg eMsg� �����
�� 
errn� o      ���� 0 enum eNum��  � Q   K ����� k   N k�� ��� l  N N������  �   aliases   � ���    a l i a s e s� ���� r   N k��� c   N i��� l  N g������ b   N g��� b   N _��� b   N Y��� b   N U��� n  N Q��� o   O Q���� 0 sbinpath sBinPath�  f   N O� m   Q T�� ���   � n  U X��� o   V X���� 0 usedefaults useDefaults�  f   U V� n  Y ^��� o   Z ^���� 0 usepathdest usePathDest�  f   Y Z� l  _ f������ n   _ f��� 1   d f��
�� 
strq� l  _ d������ n   _ d��� 1   ` d��
�� 
psxp� o   _ `���� 0 afile aFile��  ��  ��  ��  ��  ��  � m   g h��
�� 
ctxt� o      ���� 0 	thescript 	theScript��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 emsg eMsg� �����
�� 
errn� o      ���� 0 enum eNum��  � k   s ��� � � I  s x����
�� .miscactvnull��� ��� null  f   s t��     I  y ~����
�� .sysodlogaskr        TEXT o   y z���� 0 emsg eMsg��   �� r    � b    �	 b    �

 b    � b    � m    � � � e c h o   ' o o p s ,   A p p l e S c r i p t   E r r o r   c o n v e r t i n g   o r   f i n d i n g   f i l e ,   s k i p p i n g .   A S E ( o   � ����� 0 enum eNum m   � � �  )   o   � ����� 0 emsg eMsg	 m   � � �  ' ; o      ���� 0 	thescript 	theScript��  � �� I  � ���
�� .coredoscnull��� ��� ctxt o   � ����� 0 	thescript 	theScript ����
�� 
kfil n  � � o   � ����� 0 mainwin mainWin  f   � ���  ��  � m    �                                                                                      @  alis    P  OS5                        �/�
H+     �Terminal.app                                                     Lv�r�        ����  	                	Utilities     �/��      �Vx       �   �  'OS5:Applications:Utilities:Terminal.app     T e r m i n a l . a p p    O S 5  #Applications/Utilities/Terminal.app   / ��  � R      ��
�� .ascrerr ****      � **** o      ���� 0 emsg eMsg ����
�� 
errn o      ���� 0 enum eNum��  � k   � �   !"! I  � ���#��
�� .miscactvnull��� ��� null#  f   � ���  " $��$ I  � ���%��
�� .sysodlogaskr        TEXT% c   � �&'& b   � �()( b   � �*+* b   � �,-, b   � �./. m   � �00 �11  c o u l d n ' t   r u n  / o   � ����� 0 afile aFile- o   � ���
�� 
ret + m   � �22 �33  b e c a u s e :  ) o   � ����� 0 emsg eMsg' m   � ���
�� 
ctxt��  ��  � 454 l     ��������  ��  ��  5 676 i  % (898 I      ��:���� *0 parseshellarguments parseShellArguments: ;��; o      ���� 0 argv  ��  ��  9 k     g<< =>= r     ?@? J     ����  @ o      ���� 0 
tracefiles 
traceFiles> ABA X    dC��DC k    _EE FGF Z    ]HI��JH =   KLK m    MM �NN  - n o I n t e r a c t i o nL o    ���� 0 eacharg eachArgI =     OPO n   QRQ o    ���� 0 usedefaults useDefaultsR  f    P m    SS �TT  - n o I n t e r a c t i o n  ��  J k   # ]UU VWV Q   # LXYZX k   & A[[ \]\ l  & &��^_��  ^ / ) this may generate an error at parse time   _ �`` R   t h i s   m a y   g e n e r a t e   a n   e r r o r   a t   p a r s e   t i m e] aba l  & &��cd��  c ' !set theFile to POSIX file eachArg   d �ee B s e t   t h e F i l e   t o   P O S I X   f i l e   e a c h A r gb fgf l  & &��hi��  h ( " when this only checks at runtime.   i �jj D   w h e n   t h i s   o n l y   c h e c k s   a t   r u n t i m e .g klk l  & &��mn��  m � z thank you Bruce Phillips http://macscripter.net/profile.php?id=5342 http://macscripter.net/viewtopic.php?pid=67264#p67264   n �oo �   t h a n k   y o u   B r u c e   P h i l l i p s   h t t p : / / m a c s c r i p t e r . n e t / p r o f i l e . p h p ? i d = 5 3 4 2   h t t p : / / m a c s c r i p t e r . n e t / v i e w t o p i c . p h p ? p i d = 6 7 2 6 4 # p 6 7 2 6 4l pqp r   & +rsr c   & )tut o   & '���� 0 eacharg eachArgu m   ' (��
�� 
psxfs o      ���� 0 thefile theFileq v��v O  , Awxw Z  0 @yz����y H   0 6{{ l  0 5|����| I  0 5��}��
�� .coredoexbool        obj } o   0 1���� 0 thefile theFile��  ��  ��  z r   9 <~~ m   9 :��
�� boovfals o      ���� 0 thefile theFile��  ��  x m   , -���                                                                                  MACS   alis    V  OS5                        �/�
H+     �
Finder.app                                                       s��0�4        ����  	                CoreServices    �/��      �0�       �   Q   P  *OS5:System:Library:CoreServices:Finder.app   
 F i n d e r . a p p    O S 5  &System/Library/CoreServices/Finder.app  / ��  ��  Y R      ������
�� .ascrerr ****      � ****��  ��  Z r   I L��� m   I J��
�� boovfals� o      ���� 0 thefile theFileW ��� l  M M��������  ��  ��  � ���� Z  M ]������� >   M P��� m   M N��
�� boovfals� o   N O���� 0 thefile theFile� r   S Y��� l  S V������ c   S V��� o   S T���� 0 thefile theFile� m   T U��
�� 
alis��  ��  � n     ���  ;   W X� o   V W���� 0 
tracefiles 
traceFiles��  ��  ��  G ���� l  ^ ^��~�}�  �~  �}  ��  �� 0 eacharg eachArgD o    	�|�| 0 argv  B ��{� L   e g�� o   e f�z�z 0 
tracefiles 
traceFiles�{  7 ��� l     �y�x�w�y  �x  �w  � ��v� i  ) ,��� I      �u��t�u �0 Esetboundsofterminalwindowwithxtermescapesequencesasapplescriptisbuggy EsetBoundsOfTerminalWindowWithXtermEscapeSequencesAsAppleScriptIsBuggy� ��� o      �s�s 0 	thewindow 	theWindow� ��r� o      �q�q 0 	thebounds 	theBounds�r  �t  � k     .�� ��� r     !��� l    ��p�o� c     ��� b     ��� b     ��� b     ��� b     ��� b     ��� b     ��� b     ��� b     ��� m     �� ���   e c h o   - e n   ' \ E [ 3 ; '� l   ��n�m� n    ��� 4    �l�
�l 
cobj� m    �k�k � o    �j�j 0 	thebounds 	theBounds�n  �m  � m    �� ���  ' ; '� l   ��i�h� n    ��� 4   	 �g�
�g 
cobj� m   
 �f�f � o    	�e�e 0 	thebounds 	theBounds�i  �h  � m    �� ��� ( ' t ' ; e c h o   - e n   ' \ E [ 4 ; '� l   ��d�c� n    ��� 4    �b�
�b 
cobj� m    �a�a � o    �`�` 0 	thebounds 	theBounds�d  �c  � m    �� ���  ' ; '� l   ��_�^� n    ��� 4    �]�
�] 
cobj� m    �\�\ � o    �[�[ 0 	thebounds 	theBounds�_  �^  � m    �� ���  ' t ' ; c l e a r ;� m    �Z
�Z 
TEXT�p  �o  � o      �Y�Y 0 	thescript 	theScript� ��X� O   " .��� k   & -�� ��� l  & &�W���W  �  display dialog theScript   � ��� 0 d i s p l a y   d i a l o g   t h e S c r i p t� ��V� I  & -�U��
�U .coredoscnull��� ��� ctxt� o   & '�T�T 0 	thescript 	theScript� �S��R
�S 
kfil� o   ( )�Q�Q 0 	thewindow 	theWindow�R  �V  � m   " #���                                                                                      @  alis    P  OS5                        �/�
H+     �Terminal.app                                                     Lv�r�        ����  	                	Utilities     �/��      �Vx       �   �  'OS5:Applications:Utilities:Terminal.app     T e r m i n a l . a p p    O S 5  #Applications/Utilities/Terminal.app   / ��  �X  �v       �P�� ������������O�N�M�L�K�J�I�H�G�F�P  � �E�D�C�B�A�@�?�>�=�<�;�:�9�8�7�6�5�4�3�2�1�0�E 0 sbinpath sBinPath�D 0 usedefaults useDefaults�C 0 usepathdest usePathDest�B 0 mainwinbounds mainWinBounds
�A .aevtodocnull  �    alis
�@ .aevtoappnull  �   � ****�? *0 askaboutinteraction askAboutInteraction�> 0 init  �= 0 dofile doFile�< *0 parseshellarguments parseShellArguments�; �0 Esetboundsofterminalwindowwithxtermescapesequencesasapplescriptisbuggy EsetBoundsOfTerminalWindowWithXtermEscapeSequencesAsAppleScriptIsBuggy�: 0 mainwin mainWin�9  �8  �7  �6  �5  �4  �3  �2  �1  �0  � ���� ' / V o l u m e s / U N I X b / g i t S w i s s a l p S / p h o c o a / e x t e r n a l / S w i s s a l p S / _ s y n e r g i z e / P H O C O A / S s s S p h o c o a G e n T e m p l a t e s / S s s S p h o c o a A p p / S s s S p h o c o a G e n / n e w S s s S p h o c o a P r o j e c t F r o m P l i s t . a p p / C o n t e n t s / R e s o u r c e s / n e w S s s S p h o c o a P r o j e c t '� ��� � - t a r g e t   ' / V o l u m e s / U s e r s / l u k e / D o c u m e n t s / _ P r o j e c t s / P H P   p r o j e c t s / P H O C O A / '  � �/��/ �  �.�-�,�+�. 
�- P�,X�+X� �* 9�)�(���'
�* .aevtodocnull  �    alis�) 0 thefiles theFiles�(  � �&�%�& 0 thefiles theFiles�% 0 eachfile eachFile� �$�#�"�!� ��$ 0 init  �# *0 askaboutinteraction askAboutInteraction
�" 
kocl
�! 
cobj
�  .corecnte****       ****� 0 dofile doFile�' ()j+  O)j+ O �[��l kh )�k+ [OY��� � W�����
� .aevtoappnull  �   � ****� 0 argv  �  � ��� 0 argv  � 0 eachfile eachFile� � b��������������
�	� 0 init  � 0 usedefaults useDefaults� 0 thefiles theFiles
� 
list
� 
pcls
� .corecnte****       ****� *0 parseshellarguments parseShellArguments
� 
kocl
� 
cobj� 0 dofile doFile
� 
lfiv
� 
mlsl
� 
shpc� 
�
 .sysostdfalis    ��� null�	 *0 askaboutinteraction askAboutInteraction� �)j+  O�)�,FOjvE�O��,  j�j  )�k+ E�Y hY hOj�j    �[��l kh )�k+ 
[OY��Y C*�e�e�e� E�O���, 
�kvE�Y hO)j+ O �[��l kh )�k+ 
[OY��� � ������� *0 askaboutinteraction askAboutInteraction�  �  � �� 0 theres theRes� ! �� �� �� � ��  ����������� � � �����)������������5��� 0 usedefaults useDefaults� 0 usepathdest usePathDest
� 
btns
�  
dflt
�� 
givu�� �� 
�� .sysodlogaskr        TEXT
�� 
bhit
�� 
gavu
�� 
bool
�� 
lfiv
�� 
shpc�� 
�� .sysostflalis    ��� null
�� 
psxp
�� 
strq
�� 
ctxt� ��)�,FO�)�,FO����lv����� �,�  a )�,FY hOa �a a lv�a ��� E�O�a ,E
 ��,a  a & ,a *a ea ea  a ,a ,%a %a  &)�,FY h� ��>���������� 0 init  ��  ��  � �������� 0 spath2me sPath2Me�� 0 emsg eMsg�� 0 enum eNum� ����S������������i�����������
�� 
null�� 0 mainwin mainWin
�� .sysorpthalis        TEXT
�� 
TEXT��  ��  
�� 
rtyp
�� .earsffdralis        afdr
�� 
psxp
�� 
strq�� 0 sbinpath sBinPath�� 0 emsg eMsg� ������
�� 
errn�� 0 enum eNum��  
�� .sysodlogaskr        TEXT�� >�E�O �j �&E�W X  )��l �%E�O ��,�,)�,FW X  �j � ������������� 0 dofile doFile�� ����� �  ���� 0 afile aFile��  � ���������� 0 afile aFile�� 0 	thescript 	theScript�� 0 emsg eMsg�� 0 enum eNum� ������������������������������������0��2
�� 
null�� 0 mainwin mainWin
�� .coredoscnull��� ��� ctxt�� 0 mainwinbounds mainWinBounds�� �0 Esetboundsofterminalwindowwithxtermescapesequencesasapplescriptisbuggy EsetBoundsOfTerminalWindowWithXtermEscapeSequencesAsAppleScriptIsBuggy
�� .miscactvnull��� ��� null�� 0 sbinpath sBinPath�� 0 usedefaults useDefaults
�� 
psxf
�� 
strq
�� 
ctxt�� 0 emsg eMsg� ������
�� 
errn�� 0 enum eNum��  �� 0 usepathdest usePathDest
�� 
psxp
�� .sysodlogaskr        TEXT
�� 
kfil
�� 
ret �� � �� ��)�,  �j )�,FO))�,)�,l+ Y *j O )�,�%)�,%��&�,%�&E�W LX   ")�,a %)�,%)a ,%�a ,�,%�&E�W $X  )j O�j Oa �%a %�%a %E�O�a )�,l UW "X  )j Oa �%_ %a %�%�&j � ��9���������� *0 parseshellarguments parseShellArguments�� ����� �  ���� 0 argv  ��  � ���������� 0 argv  �� 0 
tracefiles 
traceFiles�� 0 eacharg eachArg�� 0 thefile theFile� ������M��S�����������
�� 
kocl
�� 
cobj
�� .corecnte****       ****�� 0 usedefaults useDefaults
�� 
psxf
�� .coredoexbool        obj ��  ��  
�� 
alis�� hjvE�O ^�[��l kh �  
)�,� Y <  ��&E�O� �j  fE�Y hUW 
X 	 
fE�Of� ��&�6FY hOP[OY��O�� ������������� �0 Esetboundsofterminalwindowwithxtermescapesequencesasapplescriptisbuggy EsetBoundsOfTerminalWindowWithXtermEscapeSequencesAsAppleScriptIsBuggy�� ����� �  ������ 0 	thewindow 	theWindow�� 0 	thebounds 	theBounds��  � �������� 0 	thewindow 	theWindow�� 0 	thebounds 	theBounds�� 0 	thescript 	theScript� ����������������
�� 
cobj�� 
�� 
TEXT
�� 
kfil
�� .coredoscnull��� ��� ctxt�� /��k/%�%��l/%�%��m/%�%���/%�%�&E�O� 	��l 
U� ��  ����  ������
�� 
cwin��   ��
�� kfrmID  
�� 
ttab�� �O  �N  �M  �L  �K  �J  �I  �H  �G  �F   ascr  ��ޭ