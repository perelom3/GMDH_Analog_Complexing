C컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
C        Name: MATPRIN                                                        �
C                                                                             �
C Description: 룯�졻� �搜�レ�音 飡昔� 璵ギ． 쵟遜Ð� X(MM,NN)                 �
C              � 젮誓貰� ⅲ� 姉�Д�獸�.                                       �
C                                                                             �
C Copyright (C) Nataly and Gregory Ivakhnenko, 1990-1992. All Rights Reserved �
C컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸

      subroutine MATPRIN (M,N1,N2,MM,NN,X)
      real X(MM,NN)
      automatic K,I
      
      write (*,111)
      L=M/8.0+1
      do 10 K=1,L
         L1=8.0*(K-1)+1
         L2=8.0*K
         if(L2.gt.M) L2=M
         write(*,222) (J,J=L1,L2)
         write (*,333)
            do 20 I=N1,N2
20          write(*,444) I,(X(J,I),J=L1,L2)
         if(L.ne.1.and.K.ne.L.and.L2.ne.M) then
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
     +'袴袴袴袴袴袴袴袴�')
222   format(1X,'�    �',8(I5,4X))
444   format(1X,'�',I3,' �',8F9.3 )
      end
