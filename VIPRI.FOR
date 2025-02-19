CÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
C     Name: ViPri                                         10/29/92 12:57pm    ³
C                                                                             ³
C     Description: Print of integer vector IV( MM ) without numbers.          ³
C                                                                             ³
C     Nataly and Gregory Ivakhnenko, 1990-1992.                               ³
CÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

      subroutine ViPri ( M,MM, IV )
      integer IV( MM )
      
      write (*,111)
      L = M / 15. + 1
      do 10 K= 1,L
         L1 = 15. * (K - 1) + 1
         L2 = 15. *  K
         if( L2 .gt. M ) L2 = M
         write (*,222) ( IV(I), I= L1,L2 )
         if( L2 .eq. M ) goto 20
10    continue
20    write (*,*)
      return
111   format( 1X, 79('Ä'))
222   format( 4X, 15I5, /)
      end
