C컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
C        Name: Dialog_PARA                                 01/09/92 01:33pm   �
C                                                                             �
C Description: Input of data from file 'PARA'.                                �
C                                                                             �
C Copyright (C) Nataly and Gregory Ivakhnenko, 1990-1991. All Rights Reserved �
C컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸

      subroutine  DI_PARA (JJFR,IPAR)
      integer        IPAR(3)
      character*1    NO,NON,Q
      common /LDAT/  JPRI
      common /LMAIN/ JP,JFM

      JPR = 1
      NO  = 'N'
      NON = 'n'
      write(*,'(//,14X,2A\)') '궋α殊 캙�젹β贍 ',
     +'�� �젵쳽 PARA ?  (Y/N) -> '
      read (*,'(A)') Q
      if(Q.ne.NO.and.Q.ne.NON) then
C --------------------------------------------------------------------------
C           궋�� �� �젵쳽 PARA
C --------------------------------------------------------------------------
         call PARAIN (3,LL,IPAR)
         if(IPAR(1).ne.0.and.IPAR(1).ne.1) IPAR(1)=1
         if(IPAR(2).ne.0.and.IPAR(2).ne.1) IPAR(2)=0
         if(IPAR(3).gt.JJFR) then
            write (*,666) IPAR(3),JJFR,JJFR
            IPAR(3)=JJFR
         elseif(IPAR(3).lt.1) then
            write (*,111) IPAR(3)
            IPAR(3)=1
         endif
         JPRI =IPAR(1)
         JP   =IPAR(2)
         JFM  =IPAR(3)
         return
      endif
C --------------------------------------------------------------------------
C        궋�� 캙�젹β昔� � か젪쯄栒贍 � 쭬�ⓤ� � �젵� �黍  KL = 0
C --------------------------------------------------------------------------
      write (*,'(/,14X,2A\)') '뫌ℓ졻� ���硫 �젵� ',
     +'캙�젹β昔� PARA ?  (Y/N) -> '
      read(*,'(A)') Q
      if(Q.eq.NO.or.Q.eq.NON) then
         KL=1
      else
         KL=0
      endif

      if(KL.eq.0) open(unit=1, file='PARA', status='UNKNOWN',err=99999)
10    if(KL.eq.0) write (*,222)
      write (*,6666)
      write (*,'(/,5X,2A\)') '귣¡ㄸ筍 ⓤ若ㄽ硫 쩆��瑜 췅 咨�젺 ? (Y)',
     +'  (Y/N) -> '
      read (*,'(A)') Q
      if(Q.ne.NO.and.Q.ne.NON) then
         if(KL.eq.0) write (1,'(A)') ' JPRI = 1'
         JPRI=1
      else
         if(KL.eq.0) write (1,'(A)') ' JPRI = 0'
         JPRI=0
      endif

20    write (*,'(/,5X,2A)') '뇿쩆⒱� Ħ��殊十첓獸� 飡����� �猶�쩆 ',
     +'�昔Д╉獸嶺音 誓㎯レ�졻��  JP (= 0):'
      write (*,*) '         JP = 0 - 誓┬� ��席젷彛�． �猶�쩆'
      write (*,'(10X,A,6X,A\)') 'JP = 1 - 誓┬� � �졹鼇誓��臾 �猶�ㄾ�',
     +'-> '
       read (*,'(I2)') JP
      write (*,*)
      if(JP.ne.0.and.JP.ne.1) goto 20
      if(JP.eq.0) then
         if(KL.eq.0) write (1,'(A)') ' JP   = 0'
         JP=0
      else
         if(KL.eq.0) write (1,'(A)') ' JP   = 1'
         JP=1
      endif

30    write (*,'(/,5X,2A,/,5X,A,I2,A\)') '뇿쩆⒱� 쵟めº젷彛��',
     +' ぎエ曄飡¡ 젺젷�．� �黍 ��誓‘誓 ',
     +'젺�젹∥ⅸ 졷ｃД�獸�  (0 < JFM=5 < ',JJFR,')         -> '
      read (*,'(I2)') JFM
      if(JFM.eq.0) JFM=5
      if(JFM.le.0.or.JFM.gt.JJFR) goto 30
      if(KL.eq.0) write (1,'(A7,I2)') ' JFM  =',JFM

      write (*,333) JPRI
      write (*,444) JP
      write (*,555) JFM
         write (*,'(/,6X,A\)') '귗� ��젪Œ彛� ?  (Y/N) '
         read (*,'(A)') Q
         if(Q.eq.NO.or.Q.eq.NON) goto 10
         write (*,6666)
      if(KL.eq.0) close(unit=1)

      return
111   format (/,14X,'뤲ⅳ侁ⅵㄵ���: 뙛めº젷彛�� ぎエ曄飡¡',
     +' 젺젷�．� JFM =',I2,/,29X,'笹②ぎ� 쵟ギ (JFM > 0)!',
     +'   뤲Þº젰恂�  JFM = 1.'/)
666   format (/,14X,'뤲ⅳ侁ⅵㄵ���: 뒶エ曄飡¡ 젺젷�．� JFM =',I3,
     +' �誓�泣젰�',/,29X,'쵟めº젷彛��  JJFR =',I3,
     +'!   뤲Þº젰恂� JFM =',I2,'.'/)
222   format (//,1X,'궋�� ㎛좂��Ł � �젵� 캙�젹β昔� :')
333   format (/,7X,'닩��殊十첓獸� �猶�쩆 쩆��音',15X,'JPRI=',I2)
444   format (7X,'닩��殊十첓獸� 飡����� �猶�쩆 誓㎯レ�졻��  JP  =',I2)
555   format (7X,'뙛めº젷彛�� ぎエ曄飡¡ 젺젷�．�          JFM =',I2)
6666  format (79('�'),/)
99999 stop '*** 롨Æ첓: 뜢¡㎚�┃� �洙贍筍 ���硫 �젵� PARA ! ***'
      end
