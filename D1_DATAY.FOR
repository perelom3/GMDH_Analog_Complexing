C컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
C        Name: Dialog_1_DATAY                               01/06/92 12:33pm  �
C                                                                             �
C Description: Input of data parameters for file 'DATAY'.                     �
C                                                                             �
C Copyright (C) Nataly and Gregory Ivakhnenko, 1990-1991. All Rights Reserved �
C컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸

      subroutine  D1_DATAY (KL,D_NAME,M,MY,N)
      character*1  NO,NON,Q
      character*65 D_NAME

      NO  = 'N'
      NON = 'n'
      write (*,'(14X,2A\)') '뫌ℓ졻� ���硫 �젵� ',
     +'쩆��音 DATAY ? (Y/N) -> '
      read (*,'(A)') Q
      if(Q.eq.NO.or.Q.eq.NON) then
         KL=1
      else
         KL=0
      endif
C --------------------------------------------------------------------------
C        궋�� 캙�젹β昔� ㄻ� ��¡． �젵쳽
C --------------------------------------------------------------------------
      if(KL.eq.0) write (*,999)
60    continue
      if(KL.eq.0) then
        write(*,6666)
        write(*,'(14X,A,//,13X,A\)')'궋ⅳⓥ� 췅㎖젺�� ㄻ� 쩆��音 :',' '
        read (*,'(A)') D_NAME
      endif
      write (*,*)
      write (*,6666)

70    write(*,'(14X,A\)')   '궋ⅳⓥ� ぎエ曄飡¡ ��誓Д��音  M  -> '
      read (*,'(I3)') M
      if(M.le.0) goto 70
80    write(*,'(/,14X,A\)') '궋ⅳⓥ�  ぎエ曄飡¡  押�ゆŁ  MY  -> '
      read (*,'(I3)') MY
      if(MY.le.0) goto 80
90    write(*,'(/,14X,A\)') '궋ⅳⓥ�  ぎエ曄飡¡  獸曄�     N  -> '
      read (*,'(I3)') N
      if(N.le.1) goto 90

      write (*,'(/,5X,A\)') '귗� ��젪Œ彛� ?  (Y/N) '
      read (*,'(A)') Q
      write (*,*)
      if(Q.eq.NO.or.Q.eq.NON) goto 60
      return
999   format (//,1X,'궋�� ㎛좂��Ł � �젵� 쩆��音 :')
6666  format (79('�'),/)
      end
