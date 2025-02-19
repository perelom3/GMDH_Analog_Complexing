C─────────────────────────────────────────────────────────────────────────────┐
C        Name: DATINY                                      01/09/92 01:33pm   │
C                                                                             │
C Description: Input of data from the file 'DATAY' for Analog_XY (with XPR).  │
C                                                                             │
C Copyright (C) Nataly and Gregory Ivakhnenko, 1990-1991. All Rights Reserved │
C─────────────────────────────────────────────────────────────────────────────┘

      subroutine DATINY (M,MY,N,MMY,MM,NN,NN1,XV,XPR,Y,IL)
      integer       IL(MM), L
      real          Y(MMY,NN), XV(MM,NN1), XPR(MM)
      character*80  G
      character*65  D_NAME
      common /LDAT/ JPRI

      open (unit=1, file='DATAY', status='OLD',mode='READ',err=99999)
            read (1,'(3X,A,/)') D_NAME
            read (1,'(A3,I3)') G,M
            read (1,'(A3,I3,/)') G,N
         write (*,111)
         write (*,222) D_NAME
         write (*,111)
         write (*,333) M
         write (*,444) N
            do 30 I=1,N
30          read (1,*) L,(XV(J,I),J=1,M)

            read (1,'(3X,A)') G
            read (1,'(A4,I2)') G,MY
         write (*,777) MY
         read (*,*)
            do 40 I=1,N
40          read (1,*) L,(Y(J,I),J=1,MY)
            read (1,'(3X,A)') G
            read (1,*) (XPR(I),I=1,M)
C --------------------------------------------------------------------------
C           Вывод данных на печать
C --------------------------------------------------------------------------
      if(JPRI.eq.1) then
         write (*,11)
         call MATPRI (M,N,MM,NN1,XV)
         read (*,*)
         write (*,22)
         call VEMPRY (1,M,MM,XPR,IL)
         read (*,*)
         write (*,33)
         call MATPRI (MY,N,MMY,NN,Y)
         read (*,*)
      endif
      close (unit=1)
      return

11    format (/,8X,'Исходный массив аргументов :')
22    format (/,8X,'Вектор аргументов для прогноза :')
33    format (/,8X,'Исходный массив функций :')
111   format (79('─'),/)
222   format (14X,A65,/)
333   format (14X,'Количество аргументов    M =',I3)
444   format (14X,'Количество точек         N =',I3)
777   format (14X,'Количество функций      MY =',I3,/)
99999 stop '*** Ошибка: Невозможно открыть файл DATAY ***'
      end
