C컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
C                            IiI FORTRAN Program            01/12/92 03:00pm  �
C        Name: Analog_XY                                                      �
C                                                                             �
C Description: 댂ㅳもÐ�硫 젷．黍燧 뒶Нゥめⓣ�쥯�⑨ �췅ギ．�                 �
C              뙠獸쩆 꺺承��¡． 볡β� �薯僧��獸�   (똽��)                    �
C              ㄻ� �昔－�쭬 � �졹��㎛젪젺⑨ 貰〓殊� (歲栒졿Ł)                �
C                                                                             �
C Copyright (C) Nataly and Gregory Ivakhnenko, 1990-1991. All Rights Reserved �
C컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸

      program  Analog_XY
      real
     +Y   [allocatable] (:,:), YP  [allocatable] (:,:),
     +XV  [allocatable] (:,:), X   [allocatable] (:,:),
     +XA  [allocatable] (:,:), XB  [allocatable] (:,:),
     +CL  [allocatable] (:,:), RAS [allocatable] (:,:),
     +RIY [allocatable] (:),   RAY [allocatable] (:),
     +SY  [allocatable] (:),   OC  [allocatable] (:),
     +CVJ [allocatable] (:),   CLX [allocatable] (:),
     +RSX [allocatable] (:),   XPR [allocatable] (:),
     +V   [allocatable] (:),   XN  [allocatable] (:)
      integer
     +IVM [allocatable] (:,:), IL [allocatable] (:),
     +IMX [allocatable] (:),   IN [allocatable] (:),
     +IPAR (3), KL

      logical*1    LA [allocatable] (:)
      character*80 D,G
      character*65 D_NAME

      common /LDAT/  JPRI
      common /LNORXX/JPRN
      common /LRAST/ JRAS
      common /LRAXV/ JRAXV
      common /LMAIN/ JP,JFM
      automatic I,J,K
C==============================================================================
C       MM           - 쵟めº젷彛�� ぎエ曄飡¡ ��誓Д��音
C       MMY          - 쵟めº젷彛�� ぎエ曄飡¡ 押�ゆŁ
C       NN           - 쵟めº젷彛�� ぎエ曄飡¡ 獸曄�
C       XV  (MM,NN1) - ⓤ若ㄽ硫 쵟遜Ð 졷ｃД�獸�
C       X   (MM,NN1) - 쵟遜Ð 졷ｃД�獸� ㄻ� 收ゃ耀． 젺�젹∥� ��誓Д��音
C       Y   (MMY,NN) - ⓤ若ㄽ硫 쵟遜Ð 押�ゆŁ
C       YP  (MMY,NN1)- 쵟遜Ð �昔－�㎜� 押�ゆŁ
C       XA  (MM,NN)  - 쵟遜Ð �‘↓���音 젺젷�．�
C       XB  (MM,NN)  - 쵟遜Ð ㄵ⒰手ⓥ�レ�音 ㎛좂��Ł 졷ｃД�獸�
C       CL  (JJFR,NN)- 쵟遜Ð ´貰�音 ぎδ十與��獸� 젺젷�．�
C       RAS (NN,NN)  - 쵟遜Ð �졹飡�輾Ł ㄻ� 押�ゆŁ
C       RSX (MM)     - ´も�� Ж�º젷彛音 ㎛좂��Ł 졷ｃД�獸�
C       CLX (MM)     - ´も�� 쵟めº젷彛音 ㎛좂��Ł 졷ｃД�獸�
C       RIY (MMY)    - ´も�� Ж�º젷彛音 ㎛좂��Ł 押�ゆŁ
C       RAY (MMY)    - ´も�� 쵟めº젷彛音 ㎛좂��Ł 押�ゆŁ
C       SY  (MMY)    - ´も�� 蓀ⅳ�ⓨ ㎛좂��Ł 押�ゆŁ
C       OC  (MMY)    - ´も�� �璵��� �昔－�㎜� 押�ゆŁ
C       CVJ (MM)     - ´も�� むⓥ�黍ⅱ �昔－�쭬 졷ｃД�獸�
C       XPR (MM)     - 收ゃ蟯� ´も�� 졷ｃД�獸� ㄻ� �昔－�쭬
C       V   (NN)     - ´も�� �□졻�音 �졹飡�輾Ł �� 收ゃ耀． ´も��� 졷ｃД�獸�
C       XN  (NN)     - ㏇��М짛收レ�硫 ´も�� �졹飡�輾Ł
C       IVM (JJFR,NN)- 쵟遜Ð ∥Ĳ젵鼇� 貰醒ㄵ�-젺젷�．�
C       IL  (MM)     - ´も�� �□졻�音 �졹飡�輾Ł �� 收ゃ耀．
C       IMX (MM)     - ㏇��М짛收レ�硫 ´も�� 젺�젹∥� ��誓Д��音
C       IN  (NN)     - ´も�� ��Д昔� 獸曄� ㄻ� �젺┬昔쥯�⑨ �� �졹飡�輾⑧
C       IPAR(LL)     - ´も�� 캙�젹β昔� �� �젵쳽 PARA
C       LA  (MM)     - ´も�� 젺�젹∥� ��誓Д��音
C       JJFR [=10]   - 쵟めº젷彛�� ぎエ曄飡¡ 젺젷�．�
C       JFM          - ぎエ曄飡¡ 젺젷�．�
C       JFC          - ��殊쵟レ��� ぎエ曄飡¡ 젺젷�．�
C       JMC          - ��殊쵟レ��� ぎエ曄飡¡ ��誓Д��音
C       JPRI         - 氏젫 �η졻� ⓤ若ㄽ音 쩆��音 (�젪�� 0 Œ� 1)
C       JPRN         - 氏젫 �η졻� ��席ⓣ�쥯��音 쵟遜Ð�� ⓤ若ㄽ音 쩆��音
C       JRAS         - 氏젫 �η졻� �졹飡�輾Ł ㄻ� 押�ゆŁ
C       JRAXV        - 氏젫 �η졻� �졹飡�輾Ł ㄻ� 졷ｃД�獸�
C       JP           - 氏젫 �η졻� �昔Д╉獸嶺音 誓㎯レ�졻��
C==============================================================================
      JJFR=10
      write (*,1111)
      write (*,999)
      write (*,2222)
C --------------------------------------------------------------------------
C           궋�� 캙�젹β昔� �� �젵쳽 PARA
C --------------------------------------------------------------------------
      call DI_PARA (JJFR,IPAR)
C --------------------------------------------------------------------------
C           궋�� 쩆��音
C --------------------------------------------------------------------------
      write (*,'(/,14X,2A\)') '궋α殊 쩆��瑜 ��  �젵쳽 ',
     +' DATAY ?  (Y/N) -> '
       read (*,'(A)') Q
      write (*,*)
C --------------------------------------------------------------------------
C           궋�� 쩆��音 �� �젵쳽 DATAY
C --------------------------------------------------------------------------
      if(Q.ne.'N'.and.Q.ne.'n') then
         open (unit=1,file='DATAY',status='OLD',mode='READ',err=99999)
            read (1,'(3X,A,/)') D
            read (1,'(A3,I3)') G,M
            read (1,'(A3,I3,/)') G,N
            if(M.le.0.or.N.le.1) then
               close (unit=1)
               write (*,444) M,N
               stop ' '
            endif

            allocate ( XV(M,N+1), XPR(M), IL(M), stat=MEMERR )
            if(MEMERR.ne.0)  stop ' Abort: Not enough storage!'
               do 30 I=1,N
30             read (1,*) J,(XV(J,I),J=1,M)
            read (1,'(3X,A)') G
            read (1,'(A4,I2)') G,MY
         close (unit=1)
         if(MY.le.0) then
            write (*,666) MY
            deallocate ( XV,XPR,IL, stat=IERR )
            if(IERR.ne.0) write (*,*) ' Warning: Deallocation error!'
            stop ' '
         endif

         allocate ( Y(MY,N), stat=MEMERR )
         if(MEMERR.ne.0)  stop ' Abort: Not enough storage!'
         MM=M
         MMY=MY
         NN=N
         NN1=N+1
         call DATINY (M,MY,N,MMY,MM,NN,NN1,XV,XPR,Y,IL)
      else
C --------------------------------------------------------------------------
C           궋�� 쩆��音 � 誓┬Д ㄸ젷�짛 c か젪쯄栒贍 � �젵� DATAY
C --------------------------------------------------------------------------
         call D1_DATAY (KL,D_NAME,M,MY,N)
         MM=M
         MMY=MY
         NN=N
         NN1=N+1
            allocate (XV(MM,NN1),XPR(MM),IL(MM),Y(MMY,NN),stat=MEMERR)
            if(MEMERR.ne.0) stop ' Abort: Not enough storage!'
         call D2_DATAY (KL,D_NAME,M,MY,N,MM,MMY,NN,NN1,Y,XV,XPR,IL)
      endif
C --------------------------------------------------------------------------
C           맆召誓ㄵゥ��� 캙э殊 ��� �飡젷彛瑜 쵟遜Ð� � ´も���
C --------------------------------------------------------------------------
      allocate ( YP(MMY,NN1), X(MM,NN1), XA(MM,NN), XB(MM,NN),
     +           CL(JJFR,NN), RAS(NN,NN), RIY(MMY), RAY(MMY), SY(MMY),
     +           OC(MMY), CVJ(MM), CLX(MM), RSX(MM), V(NN), XN(NN),
     +           IVM(JJFR,NN), IMX(MM), IN(NN), LA(MM),
     +           stat=MEMERR )
      if(MEMERR.ne.0)  stop ' Abort: Not enough storage!'
C --------------------------------------------------------------------------
C        뤲ⓤ¡���� ㎛좂��Ł Ħ��殊十첓獸�젹 � 캙�젹β�젹
C --------------------------------------------------------------------------
      if(JFM.ge.N)  then
         write (*,777) JFM,N,N-1
         JFM=N-1
      endif
      JPRN  = JP
      JRAS  = 0
      JRAXV = 0
      write (*,111) JPRI
      write (*,222) JP
      write (*,333) JFM
      write (*,888)
      read (*,*)
      I=M*N
      if(JP.eq.0.and.I.gt.40) write (*,'(13X,A,//)')
     +'룼ㄾ┐ⓥ�, ��쬊ャ⒰�� ...'
C --------------------------------------------------------------------------
C        귣㎜� �說�˛�． Мㅳワ
C --------------------------------------------------------------------------
      call PATXYY (MY,M,N,JJFR,MMY,MM,NN,NN1,
     +Y,YP,XV,X,XA,XB,CL,RAS,RIY,RAY,SY,OC,CVJ,CLX,RSX,XPR,
     +V,XN,IVM,IL,IMX,IN,LA)
C --------------------------------------------------------------------------
C        롟¡‘┐���� 캙э殊
C --------------------------------------------------------------------------
      read (*,*)
C      deallocate (YP,X,XA,XB,CL,RAS,RIY,RAY,SY,OC,CVJ,CLX,RSX,
C     +            V,XN,IVM,IMX,IN,LA, stat=IERR )
C      if(IERR.ne.0) write (*,*) ' Warning: Deallocation error!'
      stop ' '

111   format (/,7X,'룧�젹β贍 誓┬쵟 �젩�瞬 젷．黍燧� :',/,
     +13X,'닩��殊十첓獸� �η졻� ⓤ若ㄽ音 쩆��音',11X,
     +'JPRI = ',I2)
222   format (13X,'닩��殊十첓獸� �η졻� �昔Д╉獸嶺音',
     +' 誓㎯レ�졻��   JP = ',I2)
333   format (13X,'뙛めº젷彛�� ぎエ曄飡¡ 젺젷�．�',16X,'JFM =',I3)
444   format (/,8X,'롨Æ첓: 뒶エ曄飡¡ ��誓Д��音 ⓤ若ㄽ�． ',
     +'쵟遜Ð� M =',I2,/,16X,'Œ� 獸曄� N =',I2,' 쵟ギ ㄻ� �昔－�쭬 ',
     +'( M > 0, N > 1 ) !',/)
666   format (/,8X,'롨Æ첓: 뒶エ曄飡¡ 押�ゆŁ MY =',I2,
     +' 쵟ギ ㄻ� �昔－�쭬  ( MY > 0 ) !',/)
777   format (/,8X,'뤲ⅳ侁ⅵㄵ���: ぎエ曄飡¡ 젺젷�．� JFM =',I3,
     +' �誓�泣젰�',/,15X,'ぎエ曄飡¡ 獸曄� N =',I3,
     +' !  뤲Þº젰恂� JFM =',I3,'.'/)
888   format (/,1X,79('�'),/)
999   format(4X,'�',69X,'�',
     +/,4X,'�',16X,'�땭럯닋�  뒑뙊땯뒔닇럟�뜄�  ���땸깕�',17X,'�',
     +/,4X,'�',5X,'뙠獸쩆  꺺承��¡．  볡β�  �薯僧��獸�  (똽��)',
     +'  ㄻ�  �昔－�쭬',4X,'�',
     +/,4X,'�',22X,'�  �졹��㎛젪젺⑨  貰〓殊�',22X,'�',
     +/,4X,'�',69X,'�',
     +/,4X,'�',5X,'궏褻⑨ 2.16   뜝�젷逸 � 꺺ª�黍� 닣졾���ぎ (c)',
     +'  뒯ⅱ 1990-92',4X,'�')
1111  format (///,4X,'�袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�',
     +'袴袴袴袴袴袴袴袴袴袴袴袴�')
2222  format (4X,'훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴',
     +'袴袴袴袴袴袴袴袴袴袴袴袴�')
99999 stop '*** 롨Æ첓: 뜢¡㎚�┃� �洙贍筍 �젵� DATAY ***'
      end
