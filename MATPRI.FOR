C컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
C     Name: MatPri                                           03/10/94 06:17pm �
C                                                                             �
C     Description: Print of real array  A( MM,NN ).                           �
C                                                                             �
C     Nataly and Gregory Ivakhnenko  (c)                                      �
C컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸

      subroutine  MatPri ( M,N, MM,NN, A )
      real        A ( MM,NN )
      automatic K,I
      
      L = M / 8. + 1
      write (*,111)
      do 10 K= 1,L
         L1 = 8. * (K - 1) + 1
         L2 = 8. *  K
         if( L2 .gt. M ) L2 = M
         write (*,222) ( J, J= L1,L2 )
         write (*,333)
            do 20 I= 1,N
20          write (*,444) I,( A( J,I ), J= L1,L2 )
         if( L .ne. 1  .and.  K .ne. L  .and.  L2 .ne. M )  then
            write (*,555)
         else
            write (*,666)
            return
         endif
10    continue
      return
111   format (1X,
     +'�袴袴佶袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�',
     +'袴袴袴袴袴袴袴袴�')
333   format (1X,
     +'픔컴컵컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴',
     +'컴컴컴컴컴컴컴컴�')
555   format (1X,
     +'勁袴曲袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴',
     +'袴袴袴袴袴袴袴袴�')
666   format (1X,
     +'훤袴賈袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴',
     +'袴袴袴袴袴袴袴袴�',/)
222   format (1X, '�    �', 8(I5,4X))
444   format (1X, '�', I3, ' �', 8F9.3 )
      end
