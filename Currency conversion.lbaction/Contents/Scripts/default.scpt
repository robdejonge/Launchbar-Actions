FasdUAS 1.101.10   ��   ��    k             l     ��  ��    T N =============================================================================     � 	 	 �   = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =   
  
 l     ��  ��    &   Currency conversion - v20190516     �   @   C u r r e n c y   c o n v e r s i o n   -   v 2 0 1 9 0 5 1 6      l     ��  ��    T N -----------------------------------------------------------------------------     �   �   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��  ��    S M This script is meant to be launched from LaunchBar, taking an input query in     �   �   T h i s   s c r i p t   i s   m e a n t   t o   b e   l a u n c h e d   f r o m   L a u n c h B a r ,   t a k i n g   a n   i n p u t   q u e r y   i n      l     ��  ��    R L the format ##src dst and asking Google to convert ## number of src currency     �   �   t h e   f o r m a t   # # s r c   d s t   a n d   a s k i n g   G o o g l e   t o   c o n v e r t   # #   n u m b e r   o f   s r c   c u r r e n c y      l     ��   !��     O I units into dst currency units. The script will limit the output currency    ! � " " �   u n i t s   i n t o   d s t   c u r r e n c y   u n i t s .   T h e   s c r i p t   w i l l   l i m i t   t h e   o u t p u t   c u r r e n c y   # $ # l     �� % &��   % I C units to 2 decimals. Use ISO 4217 codes for source and destination    & � ' ' �   u n i t s   t o   2   d e c i m a l s .   U s e   I S O   4 2 1 7   c o d e s   f o r   s o u r c e   a n d   d e s t i n a t i o n $  ( ) ( l     �� * +��   *   indication.    + � , ,    i n d i c a t i o n . )  - . - l     ��������  ��  ��   .  / 0 / l     �� 1 2��   1 P J Thanks to iRounak and CapnAverage on the obdev.at forum for their help in    2 � 3 3 �   T h a n k s   t o   i R o u n a k   a n d   C a p n A v e r a g e   o n   t h e   o b d e v . a t   f o r u m   f o r   t h e i r   h e l p   i n 0  4 5 4 l     �� 6 7��   6 P J getting this off the ground. Thanks to regulus6633 for the routine, which    7 � 8 8 �   g e t t i n g   t h i s   o f f   t h e   g r o u n d .   T h a n k s   t o   r e g u l u s 6 6 3 3   f o r   t h e   r o u t i n e ,   w h i c h 5  9 : 9 l     �� ; <��   ;   he didnt write.     < � = = "   h e   d i d n t   w r i t e .   :  > ? > l     �� @ A��   @ T N -----------------------------------------------------------------------------    A � B B �   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ?  C D C l     ��������  ��  ��   D  E F E i      G H G I      �� I���� 0 makecaseupper makeCaseUpper I  J�� J o      ���� 0 	thestring 	theString��  ��   H k     � K K  L M L r      N O N m      P P � Q Q 4 A B C D E F G H I J K L M N O P Q R S T U V W X Y Z O o      ���� 0 	uppercase 	UPPERCASE M  R S R r     T U T m     V V � W W 4 a b c d e f g h i j k l m n o p q r s t u v w x y z U o      ���� 0 	lowercase   S  X Y X r     Z [ Z m    	 \ \ � ] ]    [ n      ^ _ ^ 1   
 ��
�� 
txdl _ 1   	 
��
�� 
ascr Y  ` a ` r     b c b c     d e d n     f g f 2   ��
�� 
citm g o    ���� 0 	thestring 	theString e m    ��
�� 
list c o      ���� 0 thewords theWords a  h i h r     j k j m     l l � m m   k n      n o n 1    ��
�� 
txdl o 1    ��
�� 
ascr i  p q p r      r s r J    ����   s o      ���� 0 newlist newList q  t u t X   ! � v�� w v k   1 | x x  y z y r   1 6 { | { n   1 4 } ~ } 2  2 4��
�� 
cha  ~ o   1 2���� 0 theword theWord | o      ���� 0 chrs   z   �  l  7 > � � � � r   7 > � � � I  7 <�� ���
�� .corecnte****       **** � o   7 8���� 0 chrs  ��   � o      ���� 0 nchrs Nchrs � #  get the number of characters    � � � � :   g e t   t h e   n u m b e r   o f   c h a r a c t e r s �  � � � Y   ? s ��� � ��� � Z   I n � ����� � E  I O � � � o   I J���� 0 	lowercase   � l  J N ����� � n   J N � � � 4   K N�� �
�� 
cobj � o   L M���� 0 k K � o   J K���� 0 chrs  ��  ��   � k   R j � �  � � � r   R ` � � � I  R ^���� �
�� .sysooffslong    ��� null��   � �� � �
�� 
psof � l  T X ����� � n   T X � � � 4   U X�� �
�� 
cobj � o   V W���� 0 k K � o   T U���� 0 chrs  ��  ��   � �� ���
�� 
psin � o   Y Z���� 0 	lowercase  ��   � o      ���� 0 olc   �  ��� � r   a j � � � n   a e � � � 4   b e�� �
�� 
cha  � o   c d���� 0 olc   � o   a b���� 0 	uppercase 	UPPERCASE � n       � � � 4   f i�� �
�� 
cobj � o   g h���� 0 k K � o   e f���� 0 chrs  ��  ��  ��  �� 0 k K � m   B C����  � o   C D���� 0 nchrs Nchrs��   �  ��� � r   t | � � � c   t y � � � o   t u���� 0 chrs   � m   u x��
�� 
TEXT � n       � � �  ;   z { � o   y z���� 0 newlist newList��  �� 0 theword theWord w o   $ %���� 0 thewords theWords u  � � � r   � � � � � m   � � � � � � �    � n      � � � 1   � ���
�� 
txdl � 1   � ���
�� 
ascr �  � � � r   � � � � � c   � � � � � o   � ����� 0 newlist newList � m   � ���
�� 
TEXT � o      ���� 0 	thestring 	theString �  � � � r   � � � � � m   � � � � � � �   � n      � � � 1   � ���
�� 
txdl � 1   � ���
�� 
ascr �  ��� � L   � � � � o   � ����� 0 	thestring 	theString��   F  � � � l     ��������  ��  ��   �  � � � i     � � � I      �� ����� 0 handle_string   �  ��� � o      ���� 0 theinput theInput��  ��   � k      � �  � � � l     ��������  ��  ��   �  � � � Q     � � � � � k    � � �  � � � l   ��������  ��  ��   �  � � � l   �� � ���   �  	 settings    � � � �    s e t t i n g s �  � � � r     � � � m     � � � � � H S I G N _ U P _ A N D _ I N S E R T _ Y O U R _ A P I _ K E Y _ H E R E � o      ���� 0 apikey APIKEY �  � � � l   ��������  ��  ��   �  � � � l   �� � ���   �   break down the query    � � � � *   b r e a k   d o w n   t h e   q u e r y �  � � � r     � � � m     � � � � �    � n      � � � 1   	 ��
�� 
txdl � 1    	��
�� 
ascr �  � � � r     � � � c     � � � n     � � � 4    �� �
�� 
citm � m    ����  � o    ���� 0 theinput theInput � m    ��
�� 
ctxt � o      ���� 0 	theamount 	theAmount �    r     c     n     4    ��
�� 
citm m    ����  o    ���� 0 theinput theInput m    ��
�� 
ctxt o      ���� $0 thefirstcurrency theFirstCurrency 	
	 r    ' c    % n    # 4     #��
�� 
citm m   ! "������ o     ���� 0 theinput theInput m   # $��
�� 
ctxt o      ���� &0 thesecondcurrency theSecondCurrency
  l  ( (��������  ��  ��    l  ( (����     obtain the exchange rate    � 2   o b t a i n   t h e   e x c h a n g e   r a t e  r   ( 7 n   ( 5 1   3 5�
� 
strq l  ( 3�~�} b   ( 3 !  b   ( 1"#" b   ( /$%$ b   ( -&'& b   ( +()( m   ( )** �++ V h t t p s : / / f r e e . c u r r c o n v . c o m / a p i / v 7 / c o n v e r t ? q =) o   ) *�|�| $0 thefirstcurrency theFirstCurrency' m   + ,,, �--  _% o   - .�{�{ &0 thesecondcurrency theSecondCurrency# m   / 0.. �// , & c o m p a c t = u l t r a & a p i K e y =! o   1 2�z�z 0 apikey APIKEY�~  �}   o      �y�y 0 theurl theURL 010 r   8 C232 c   8 A454 l  8 ?6�x�w6 I  8 ?�v7�u
�v .sysoexecTEXT���     TEXT7 b   8 ;898 m   8 9:: �;;  c u r l   - - s i l e n t  9 o   9 :�t�t 0 theurl theURL�u  �x  �w  5 m   ? @�s
�s 
TEXT3 o      �r�r 0 	thesource 	theSource1 <=< r   D I>?> m   D E@@ �AA  ? n     BCB 1   F H�q
�q 
txdlC 1   E F�p
�p 
ascr= DED r   J _FGF c   J ]HIH l  J [J�o�nJ n   J [KLK 7 K [�mMN
�m 
cha M m   O Q�l�l N l  R ZO�k�jO \   R ZPQP l  S XR�i�hR n   S XSTS 1   T X�g
�g 
lengT o   S T�f�f 0 	thesource 	theSource�i  �h  Q m   X Y�e�e �k  �j  L o   J K�d�d 0 	thesource 	theSource�o  �n  I m   [ \�c
�c 
TEXTG o      �b�b 0 therate theRateE UVU l  ` `�a�`�_�a  �`  �_  V WXW l  ` `�^YZ�^  Y 0 * crazy complicated math processing engine    Z �[[ T   c r a z y   c o m p l i c a t e d   m a t h   p r o c e s s i n g   e n g i n e  X \]\ r   ` g^_^ c   ` e`a` ]   ` cbcb o   ` a�]�] 0 	theamount 	theAmountc o   a b�\�\ 0 therate theRatea m   c d�[
�[ 
TEXT_ o      �Z�Z 0 	theresult 	theResult] ded l  h h�Y�X�W�Y  �X  �W  e fgf l  h h�Vhi�V  h    prepare stuff for display   i �jj 4   p r e p a r e   s t u f f   f o r   d i s p l a yg klk r   h pmnm I   h n�Uo�T�U 0 makecaseupper makeCaseUppero p�Sp o   i j�R�R $0 thefirstcurrency theFirstCurrency�S  �T  n o      �Q�Q $0 thefirstcurrency theFirstCurrencyl qrq r   q ysts I   q w�Pu�O�P 0 makecaseupper makeCaseUpperu v�Nv o   r s�M�M &0 thesecondcurrency theSecondCurrency�N  �O  t o      �L�L &0 thesecondcurrency theSecondCurrencyr wxw r   z �yzy I  z ��K�J{
�K .sysooffslong    ��� null�J  { �I|}
�I 
psof| m   ~ �~~ �  .} �H��G
�H 
psin� o   � ��F�F 0 	theresult 	theResult�G  z o      �E�E 0 
the_offset  x ��� Z   � ����D�C� >  � ���� o   � ��B�B 0 
the_offset  � m   � ��A�A  � k   � ��� ��� r   � ���� [   � ���� o   � ��@�@ 0 
the_offset  � m   � ��?�? � o      �>�> 0 
the_offset  � ��=� r   � ���� n   � ���� 7 � ��<��
�< 
ctxt� m   � ��;�; � o   � ��:�: 0 
the_offset  � o   � ��9�9 0 	theresult 	theResult� o      �8�8 0 	theresult 	theResult�=  �D  �C  � ��� l  � ��7�6�5�7  �6  �5  � ��� l  � ��4���4  �   display the message   � ��� (   d i s p l a y   t h e   m e s s a g e� ��� O   � ���� k   � ��� ��� r   � ���� b   � ���� b   � ���� o   � ��3�3 $0 thefirstcurrency theFirstCurrency� m   � ��� ���   � o   � ��2�2 0 	theamount 	theAmount� o      �1�1 0 thetitle theTitle� ��� r   � ���� b   � ���� b   � ���� o   � ��0�0 &0 thesecondcurrency theSecondCurrency� m   � ��� ���   � o   � ��/�/ 0 	theresult 	theResult� o      �.�. 0 
themessage 
theMessage� ��� I  � ��-��
�- .odlbltypnull���     ctxt� o   � ��,�, 0 
themessage 
theMessage� �+��*
�+ 
pttl� o   � ��)�) 0 thetitle theTitle�*  � ��(� I  � ��'��&
�' .JonspClpnull���     ****� o   � ��%�% 0 	theresult 	theResult�&  �(  � m   � ����                                                                                  ODLB  alis    .  Macintosh HD                   BD ����LaunchBar.app                                                  ����            ����  
 cu             Applications  /:Applications:LaunchBar.app/     L a u n c h B a r . a p p    M a c i n t o s h   H D  Applications/LaunchBar.app  / ��  � ��$� l  � ��#�"�!�#  �"  �!  �$   � R      � ��
�  .ascrerr ****      � ****� o      �� 0 errmsg ErrMsg�   � k   � ��� ��� l  � �����  �  �  � ��� O  � ���� I  � ����
� .GURLGURLnull��� ��� TEXT� b   � ���� m   � ��� ��� @ h t t p s : / / w w w . g o o g l e . c o m / s e a r c h ? q =� l  � ����� b   � ���� b   � ���� b   � ���� b   � ���� o   � ��� 0 	theamount 	theAmount� m   � ��� ���  % 2 0� o   � ��� $0 thefirstcurrency theFirstCurrency� m   � ��� ���   � o   � ��� &0 thesecondcurrency theSecondCurrency�  �  �  � m   � ����                                                                                  sfri  alis    "  Macintosh HD                   BD ����
Safari.app                                                     ����            ����  
 cu             Applications  /:Applications:Safari.app/   
 S a f a r i . a p p    M a c i n t o s h   H D  Applications/Safari.app   / ��  � ��� l  � �����  �  �  �   � ��� l  � �����  �  �  �   � ��� l     ��
�	�  �
  �	  � ��� l     ����  �  �  �       �����  � ��� 0 makecaseupper makeCaseUpper� 0 handle_string  � � H� ������� 0 makecaseupper makeCaseUpper�  ����� �  ���� 0 	thestring 	theString��  � 
���������������������� 0 	thestring 	theString�� 0 	uppercase 	UPPERCASE�� 0 	lowercase  �� 0 thewords theWords�� 0 newlist newList�� 0 theword theWord�� 0 chrs  �� 0 nchrs Nchrs�� 0 k K�� 0 olc  �  P V \�������� l������������������ � �
�� 
ascr
�� 
txdl
�� 
citm
�� 
list
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
cha 
�� 
psof
�� 
psin�� 
�� .sysooffslong    ��� null
�� 
TEXT�� ��E�O�E�O���,FO��-�&E�O���,FOjvE�O _�[��l 
kh ��-E�O�j 
E�O 3k�kh ���/ *��/��� E�O��/��/FY h[OY��O�a &�6F[OY��Oa ��,FO�a &E�Oa ��,FO�� �� ����������� 0 handle_string  �� ����� �  ���� 0 theinput theInput��  � ���������������������������� 0 theinput theInput�� 0 apikey APIKEY�� 0 	theamount 	theAmount�� $0 thefirstcurrency theFirstCurrency�� &0 thesecondcurrency theSecondCurrency�� 0 theurl theURL�� 0 	thesource 	theSource�� 0 therate theRate�� 0 	theresult 	theResult�� 0 
the_offset  �� 0 thetitle theTitle�� 0 
themessage 
theMessage�� 0 errmsg ErrMsg� $ � ���������*,.��:����@����������~�������������������������
�� 
ascr
�� 
txdl
�� 
citm
�� 
ctxt
�� 
strq
�� .sysoexecTEXT���     TEXT
�� 
TEXT
�� 
cha �� 
�� 
leng�� 0 makecaseupper makeCaseUpper
�� 
psof
�� 
psin�� 
�� .sysooffslong    ��� null
�� 
pttl
�� .odlbltypnull���     ctxt
�� .JonspClpnull���     ****�� 0 errmsg ErrMsg��  
�� .GURLGURLnull��� ��� TEXT�� ��E�O���,FO��k/�&E�O��l/�&E�O��i/�&E�O�%�%�%�%�%�,E�O�%j �&E�O���,FO�[�\[Z�\Z�a ,k2�&E�O�� �&E�O*�k+ E�O*�k+ E�O*a a a �a  E�O�j �lE�O�[�\[Zk\Z�2E�Y hOa  %�a %�%E�O�a %�%E�O�a �l O�j UOPW %X  a  a  �a !%�%a "%�%%j #UOPOPascr  ��ޭ