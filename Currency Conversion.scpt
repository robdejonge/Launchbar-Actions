FasdUAS 1.101.10   ��   ��    k             l     ��  ��    T N =============================================================================     � 	 	 �   = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =   
  
 l     ��  ��    &   Currency conversion - v20130312     �   @   C u r r e n c y   c o n v e r s i o n   -   v 2 0 1 3 0 3 1 2      l     ��  ��    T N -----------------------------------------------------------------------------     �   �   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��  ��    S M This script is meant to be launched from LaunchBar, taking an input query in     �   �   T h i s   s c r i p t   i s   m e a n t   t o   b e   l a u n c h e d   f r o m   L a u n c h B a r ,   t a k i n g   a n   i n p u t   q u e r y   i n      l     ��  ��    R L the format ##src dst and asking Google to convert ## number of src currency     �   �   t h e   f o r m a t   # # s r c   d s t   a n d   a s k i n g   G o o g l e   t o   c o n v e r t   # #   n u m b e r   o f   s r c   c u r r e n c y      l     ��   !��     O I units into dst currency units. The script will limit the output currency    ! � " " �   u n i t s   i n t o   d s t   c u r r e n c y   u n i t s .   T h e   s c r i p t   w i l l   l i m i t   t h e   o u t p u t   c u r r e n c y   # $ # l     �� % &��   % I C units to 2 decimals. Use ISO 4217 codes for source and destination    & � ' ' �   u n i t s   t o   2   d e c i m a l s .   U s e   I S O   4 2 1 7   c o d e s   f o r   s o u r c e   a n d   d e s t i n a t i o n $  ( ) ( l     �� * +��   *   indication.    + � , ,    i n d i c a t i o n . )  - . - l     ��������  ��  ��   .  / 0 / l     �� 1 2��   1 P J Thanks to iRounak and CapnAverage on the obdev.at forum for their help in    2 � 3 3 �   T h a n k s   t o   i R o u n a k   a n d   C a p n A v e r a g e   o n   t h e   o b d e v . a t   f o r u m   f o r   t h e i r   h e l p   i n 0  4 5 4 l     �� 6 7��   6 #  getting this off the ground.    7 � 8 8 :   g e t t i n g   t h i s   o f f   t h e   g r o u n d . 5  9 : 9 l     �� ; <��   ; T N -----------------------------------------------------------------------------    < � = = �   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - :  > ? > l     �� @ A��   @   Further development:     A � B B ,   F u r t h e r   d e v e l o p m e n t :   ?  C D C l     �� E F��   E B < - allow input with space between amount and source currency    F � G G x   -   a l l o w   i n p u t   w i t h   s p a c e   b e t w e e n   a m o u n t   a n d   s o u r c e   c u r r e n c y D  H I H l     �� J K��   J - ' - elegant error handling and reporting    K � L L N   -   e l e g a n t   e r r o r   h a n d l i n g   a n d   r e p o r t i n g I  M N M l     �� O P��   O T N -----------------------------------------------------------------------------    P � Q Q �   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - N  R S R l     ��������  ��  ��   S  T U T i      V W V I      �� X���� 0 handle_string   X  Y�� Y o      ���� 0 theinput theInput��  ��   W Q     Z [�� Z k   	 \ \  ] ^ ] l   ��������  ��  ��   ^  _ ` _ l   �� a b��   a   stuff iRounak wrote     b � c c *   s t u f f   i R o u n a k   w r o t e   `  d e d r     f g f m     h h � i i    g n      j k j 1    ��
�� 
txdl k 1    ��
�� 
ascr e  l m l r   	  n o n c   	  p q p n   	  r s r 4   
 �� t
�� 
citm t m    ����  s o   	 
���� 0 theinput theInput q m    ��
�� 
ctxt o o      ���� $0 thefirstcurrency theFirstCurrency m  u v u r     w x w n     y z y 4    �� {
�� 
citm { m    ������ z o    ���� 0 theinput theInput x o      ���� &0 thesecondcurrency theSecondCurrency v  | } | r    $ ~  ~ n    " � � � 1     "��
�� 
strq � l     ����� � b      � � � b     � � � b     � � � m     � � � � � X h t t p : / / w w w . g o o g l e . c o m / i g / c a l c u l a t o r ? h l = e n & q = � o    ���� $0 thefirstcurrency theFirstCurrency � m     � � � � �  = ? � o    ���� &0 thesecondcurrency theSecondCurrency��  ��    o      ���� 0 theurl theURL }  � � � r   % 0 � � � c   % . � � � l  % , ����� � I  % ,�� ���
�� .sysoexecTEXT���     TEXT � b   % ( � � � m   % & � � � � � 
 c u r l   � o   & '���� 0 theurl theURL��  ��  ��   � m   , -��
�� 
TEXT � o      ���� 0 	thesource 	theSource �  � � � r   1 6 � � � n  1 4 � � � 1   2 4��
�� 
txdl � 1   1 2��
�� 
ascr � o      ���� 	0 astid   �  � � � r   7 < � � � m   7 8 � � � � �    � n      � � � 1   9 ;��
�� 
txdl � 1   8 9��
�� 
ascr �  � � � r   = B � � � n   = @ � � � 2  > @��
�� 
citm � o   = >���� 0 	thesource 	theSource � o      ���� 0 	thesource 	theSource �  � � � r   C H � � � m   C D � � � � �   � n      � � � 1   E G��
�� 
txdl � 1   D E��
�� 
ascr �  � � � r   I N � � � c   I L � � � o   I J���� 0 	thesource 	theSource � m   J K��
�� 
ctxt � o      ���� 0 	thesource 	theSource �  � � � l  O O��������  ��  ��   �  � � � l  O O�� � ���   � @ : grab the 2 important bits from the google-returned string    � � � � t   g r a b   t h e   2   i m p o r t a n t   b i t s   f r o m   t h e   g o o g l e - r e t u r n e d   s t r i n g �  � � � r   O T � � � m   O P � � � � �  , � n      � � � 1   Q S��
�� 
txdl � 1   P Q��
�� 
ascr �  � � � r   U [ � � � n   U Y � � � 4   V Y�� �
�� 
citm � m   W X����  � o   U V���� 0 	thesource 	theSource � o      ���� 0 gsfrom gsFrom �  � � � r   \ b � � � n   \ ` � � � 4   ] `�� �
�� 
citm � m   ^ _����  � o   \ ]���� 0 	thesource 	theSource � o      ���� 0 gsto gsTo �  � � � l  c c��������  ��  ��   �  � � � l  c c�� � ���   � !  crop those important bits     � � � � 6   c r o p   t h o s e   i m p o r t a n t   b i t s   �  � � � r   c h � � � m   c d � � � � �  " � n      � � � 1   e g��
�� 
txdl � 1   d e��
�� 
ascr �  � � � r   i o � � � n   i m � � � 4   j m�� �
�� 
citm � m   k l����  � o   i j���� 0 gsfrom gsFrom � o      ���� 0 gsfrom gsFrom �  � � � r   p v � � � n   p t � � � 4   q t�� �
�� 
citm � m   r s����  � o   p q���� 0 gsto gsTo � o      ���� 0 gsto gsTo �  � � � l  w w��������  ��  ��   �  � � � l  w w�� � ���   � Y S split the important bits into their 2 components, the amount and the currency name    � � � � �   s p l i t   t h e   i m p o r t a n t   b i t s   i n t o   t h e i r   2   c o m p o n e n t s ,   t h e   a m o u n t   a n d   t h e   c u r r e n c y   n a m e �  � � � r   w | � � � m   w x   �    � n      1   y {��
�� 
txdl 1   x y��
�� 
ascr �  r   } � n   } �	 4   ~ ���

�� 
citm
 m    ����� 	 o   } ~���� 0 gsfrom gsFrom o      ���� 0 	gsfromamt 	gsFromAmt  r   � � n   � � 7 � ���
�� 
citm m   � �����  l  � ����� I  � �����
�� .corecnte****       **** n   � � 2  � ���
�� 
citm o   � ����� 0 gsfrom gsFrom��  ��  ��   o   � ����� 0 gsfrom gsFrom o      ���� 0 
gsfromcurr 
gsFromCurr  r   � � n   � � 4   � ���
�� 
citm m   � �����  o   � ����� 0 gsto gsTo o      ���� 0 gstoamt gsToAmt  r   � � !  n   � �"#" 7 � ���$%
�� 
citm$ m   � ����� % l  � �&����& I  � ���'��
�� .corecnte****       ****' n   � �()( 2  � ���
�� 
citm) o   � ����� 0 gsto gsTo��  ��  ��  # o   � ��� 0 gsto gsTo! o      �~�~ 0 gstocurr gsToCurr *+* l  � ��}�|�{�}  �|  �{  + ,-, l  � ��z./�z  . , & limit the result amount to 2 decimals   / �00 L   l i m i t   t h e   r e s u l t   a m o u n t   t o   2   d e c i m a l s- 121 r   � �343 I  � ��y�x5
�y .sysooffslong    ��� null�x  5 �w67
�w 
psof6 m   � �88 �99  .7 �v:�u
�v 
psin: o   � ��t�t 0 gstoamt gsToAmt�u  4 o      �s�s 0 
the_offset  2 ;<; r   � �=>= [   � �?@? o   � ��r�r 0 
the_offset  @ m   � ��q�q > o      �p�p 0 
the_offset  < ABA r   � �CDC n   � �EFE 7 � ��oGH
�o 
ctxtG m   � ��n�n H o   � ��m�m 0 
the_offset  F o   � ��l�l 0 gstoamt gsToAmtD o      �k�k 0 gstoamt gsToAmtB IJI l  � ��j�i�h�j  �i  �h  J KLK l  � ��gMN�g  M   display the message   N �OO (   d i s p l a y   t h e   m e s s a g eL PQP O   �RSR k   �TT UVU r   � �WXW o   � ��f�f 0 gstoamt gsToAmtX o      �e�e 0 
themessage 
theMessageV YZY r   � �[\[ b   � �]^] b   � �_`_ b   � �aba b   � �cdc o   � ��d�d 0 	gsfromamt 	gsFromAmtd m   � �ee �ff   b o   � ��c�c 0 
gsfromcurr 
gsFromCurr` m   � �gg �hh    i n  ^ o   � ��b�b 0 gstocurr gsToCurr\ o      �a�a 0 thetitle theTitleZ iji r   � �klk o   � ��`�` 0 
themessage 
theMessagel 1   � ��_
�_ 
sltxj m�^m I  ��]no
�] .odlbltypnull���     ctxtn o   � ��\�\ 0 
themessage 
theMessageo �[p�Z
�[ 
pttlp o  �Y�Y 0 thetitle theTitle�Z  �^  S m   � �qq�                                                                                  ODLB  alis    X  Macintosh HD               �1ubH+     OLaunchBar.app                                                   z�3��        ����  	                Applications    �1�      �f�       O  (Macintosh HD:Applications: LaunchBar.app    L a u n c h B a r . a p p    M a c i n t o s h   H D  Applications/LaunchBar.app  / ��  Q r�Xr l �W�V�U�W  �V  �U  �X   [ R      �T�S�R
�T .ascrerr ****      � ****�S  �R  ��   U s�Qs l     �P�O�N�P  �O  �N  �Q       �Mtu�M  t �L�L 0 handle_string  u �K W�J�Ivw�H�K 0 handle_string  �J �Gx�G x  �F�F 0 theinput theInput�I  v �E�D�C�B�A�@�?�>�=�<�;�:�9�8�7�E 0 theinput theInput�D $0 thefirstcurrency theFirstCurrency�C &0 thesecondcurrency theSecondCurrency�B 0 theurl theURL�A 0 	thesource 	theSource�@ 	0 astid  �? 0 gsfrom gsFrom�> 0 gsto gsTo�= 0 	gsfromamt 	gsFromAmt�< 0 
gsfromcurr 
gsFromCurr�; 0 gstoamt gsToAmt�: 0 gstocurr gsToCurr�9 0 
the_offset  �8 0 
themessage 
theMessage�7 0 thetitle theTitlew  h�6�5�4�3 � ��2 ��1�0 � � � � �/�.8�-�,�+qeg�*�)�(�'�&
�6 
ascr
�5 
txdl
�4 
citm
�3 
ctxt
�2 
strq
�1 .sysoexecTEXT���     TEXT
�0 
TEXT
�/ .corecnte****       ****
�. 
psof
�- 
psin�, 
�+ .sysooffslong    ��� null
�* 
sltx
�) 
pttl
�( .odlbltypnull���     ctxt�'  �&  �H���,FO��k/�&E�O��i/E�O�%�%�%�,E�O�%j 	�&E�O��,E�O���,FO��-E�O���,FO��&E�O���,FO��k/E�O��l/E�O���,FO��l/E�O��l/E�O���,FO��k/E�O�[�\[Zl\Z��-j 2E�O��k/E�O�[�\[Zl\Z��-j 2E�O*a a a �a  E�O�lE�O�[�\[Zk\Z�2E�Oa  '�E�O�a %�%a %�%E�O�*a ,FO�a �l UOPW X  hascr  ��ޭ