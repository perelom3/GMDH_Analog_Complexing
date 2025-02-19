C─────────────────────────────────────────────────────────────────────────────┐
C        Name: Dialog_2_DATAY                              01/06/92 12:33pm   │
C                                                                             │
C Description: Input of data to file 'DATAY'.                                 │
C                                                                             │
C Copyright (C) Nataly and Gregory Ivakhnenko, 1990-1991. All Rights Reserved │
C─────────────────────────────────────────────────────────────────────────────┘

      subroutine  D2_DATAY (KL,D_NAME,M,MY,N,MM,MMY,NN,NN1,Y,XV,XPR,IL)
      real         Y (MMY,N), XV (MM,NN1), XPR (MM)
      integer      IL (MM)
      character*1  NO,NON,Q
      character*65 D_NAME

      JPR = 1
      NO  = 'N'
      NON = 'n'
C --------------------------------------------------------------------------
C          Поблочный ввод массива наблюдений
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
         write (*,'(/,3X,A\)') 'Все правильно ?  (Y/N) '
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
         write (*,*) 'Массив наблюдений :'
         call MATPRI (M,N,MM,NN1,XV)
         write (*,'(3X,A\)') 'Все правильно ?  (Y/N)'
         read (*,'(A)') Q
         write (*,*)
         if(Q.eq.NO.or.Q.eq.NON) goto 100
      endif
C --------------------------------------------------------------------------
C           Ввод вектора аргументов для прогноза
C --------------------------------------------------------------------------
160   write (*,4444)
      write (*,6666)
      do 170 J=1,M
         read (*,*) XPR(J)
170      if(JPR.ne.0) write(*,*) XPR(J)
      write (*,*)
      write (*,*) 'Вектор аргументов для прогноза :'
      call VEMPRY (1,M,MM,XPR,IL)
      write (*,'(/,3X,A\)') 'Все правильно ?  (Y/N) '
      read (*,'(A)') Q
      write (*,*)
      if(Q.eq.NO.or.Q.eq.NON) goto 160
C --------------------------------------------------------------------------
C           Ввод массива функций
C --------------------------------------------------------------------------
190   write (*,5555)
      write (*,6666)
      do 180 I=1,N
         do 180 J=1,MY
            read (*,*) Y(J,I)
180         if(JPR.ne.0) write (*,*) Y(J,I)

      write (*,*) 'Массив функций :'
      call MATPRI (MY,N,MMY,NN,Y)

      write (*,'(/,3X,A\)') 'Все правильно ?  (Y/N) '
      read (*,'(A)') Q
      write (*,*)
      if(Q.eq.NO.or.Q.eq.NON) then
         write (*,6666)
         goto 190
      endif
C --------------------------------------------------------------------------
C           Запись данных в файл
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

1111  format (//,7X,'Введите массив переменных ',
     +'    ( построчно по одному числу ) :')
2222  format (1X,'XXX.XXXX')
3333  format (/,7X,'Продолжайте ввод :')
4444  format (//,7X,'Введите вектор аргументов для прогноза :')
5555  format (//,7X,'Введите массив функций :')
6666  format (79('─'),/)
7777  format (/,7X,'Введите заново этот блок данных :')
8888  format (79('─'))
88888 stop '*** Ошибка: Невозможно открыть файл DATAY ! ***'
      end
