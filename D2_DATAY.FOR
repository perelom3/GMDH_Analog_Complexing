C컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
C        Name: Dialog_2_DATAY                              01/06/92 12:33pm   �
C                                                                             �
C Description: Input of data to file 'DATAY'.                                 �
C                                                                             �
C Copyright (C) Nataly and Gregory Ivakhnenko, 1990-1991. All Rights Reserved �
C컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸

      subroutine  D2_DATAY (KL,D_NAME,M,MY,N,MM,MMY,NN,NN1,Y,XV,XPR,IL)
      real         Y (MMY,N), XV (MM,NN1), XPR (MM)
      integer      IL (MM)
      character*1  NO,NON,Q
      character*65 D_NAME

      JPR = 1
      NO  = 'N'
      NON = 'n'
C --------------------------------------------------------------------------
C          룼∥�嶺硫 ⇔�� 쵟遜Ð� 췅∥在��Ł
C --------------------------------------------------------------------------
      L=N/10.0+1
100   write (*,1111)
      write (*,8888)
      write (*,2222)
      KLL=0

      do 140 K=1,L
         L1=10*(K-1)+1
         L2=10*K
         if(L2.gt.N) L2=N
         if(KLL.ne.0) then
            write (*,3333)
            write (*,6666)
         endif
         KLL=1
110      continue
         do 120 I=L1,L2
            do 120 J=1,M
               read (*,*) XV(J,I)
120            if(JPR.ne.0) write (*,*) XV(J,I)
         call MATPRIN (M,L1,L2,MM,NN1,XV)
         write (*,'(/,3X,A\)') '귗� ��젪Œ彛� ?  (Y/N) '
         read (*,'(A)') Q
         write (*,*)
         if(Q.eq.NO.or.Q.eq.NON) then
            write (*,7777)
            write (*,6666)
            goto 110
         endif
         if(L2.eq.N) goto 150
140   continue

150   if(JPR.eq.1.and.L.gt.1) then
         write (*,*) '뙛遜Ð 췅∥在��Ł :'
         call MATPRI (M,N,MM,NN1,XV)
         write (*,'(3X,A\)') '귗� ��젪Œ彛� ?  (Y/N)'
         read (*,'(A)') Q
         write (*,*)
         if(Q.eq.NO.or.Q.eq.NON) goto 100
      endif
C --------------------------------------------------------------------------
C           궋�� ´も��� 졷ｃД�獸� ㄻ� �昔－�쭬
C --------------------------------------------------------------------------
160   write (*,4444)
      write (*,6666)
      do 170 J=1,M
         read (*,*) XPR(J)
170      if(JPR.ne.0) write(*,*) XPR(J)
      write (*,*)
      write (*,*) '궏も�� 졷ｃД�獸� ㄻ� �昔－�쭬 :'
      call VEMPRY (1,M,MM,XPR,IL)
      write (*,'(/,3X,A\)') '귗� ��젪Œ彛� ?  (Y/N) '
      read (*,'(A)') Q
      write (*,*)
      if(Q.eq.NO.or.Q.eq.NON) goto 160
C --------------------------------------------------------------------------
C           궋�� 쵟遜Ð� 押�ゆŁ
C --------------------------------------------------------------------------
190   write (*,5555)
      write (*,6666)
      do 180 I=1,N
         do 180 J=1,MY
            read (*,*) Y(J,I)
180         if(JPR.ne.0) write (*,*) Y(J,I)

      write (*,*) '뙛遜Ð 押�ゆŁ :'
      call MATPRI (MY,N,MMY,NN,Y)

      write (*,'(/,3X,A\)') '귗� ��젪Œ彛� ?  (Y/N) '
      read (*,'(A)') Q
      write (*,*)
      if(Q.eq.NO.or.Q.eq.NON) then
         write (*,6666)
         goto 190
      endif
C --------------------------------------------------------------------------
C           뇿�ⓤ� 쩆��音 � �젵�
C --------------------------------------------------------------------------
      if(KL.eq.0) then
         open (unit=1, file='DATAY', status='UNKNOWN', err=88888)
            write (1,'(3X,A65)') D_NAME
            write (1,8888)
            write (1,'(A3,I3)')'M =',M
            write (1,'(A3,I3)')'N =',N
            write (1,8888)
               do 200 I=1,N
200            write (1,*) I,(XV(J,I),J=1,M)
            write (1,8888)
            write (1,'(A4,I2)')'MY =',MY
               do 210 I=1,N
210            write (1,*) I,(Y(J,I),J=1,MY)
            write (1,8888)
            write (1,*) (XPR(I),I=1,M)
         close (unit=1)
      endif
      return

1111  format (//,7X,'궋ⅳⓥ� 쵟遜Ð ��誓Д��音 ',
     +'    ( ��飡昔嶺� �� �ㄽ�с 葉笹� ) :')
2222  format (1X,'XXX.XXXX')
3333  format (/,7X,'뤲�ㄾウ젵收 ⇔�� :')
4444  format (//,7X,'궋ⅳⓥ� ´も�� 졷ｃД�獸� ㄻ� �昔－�쭬 :')
5555  format (//,7X,'궋ⅳⓥ� 쵟遜Ð 押�ゆŁ :')
6666  format (79('�'),/)
7777  format (/,7X,'궋ⅳⓥ� 쭬��¡ 將�� ∥�� 쩆��音 :')
8888  format (79('�'))
88888 stop '*** 롨Æ첓: 뜢¡㎚�┃� �洙贍筍 �젵� DATAY ! ***'
      end
