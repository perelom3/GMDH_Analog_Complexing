C컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
C     Name: RAST                                             03/19/93 12:27pm �
C                                                                             �
C     Description: 맆淞β 쵟遜Ð� RAS(LL,LL) あ젮�졻�� 笠かĦ�¡． �졹飡�輾⑨.�
C                                                                             �
C     Copyright (c) Nataly and Gregory Ivakhnenko, 1990-1991.                 �
C컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸

      subroutine RAST ( M,N, MM,NN, X, RAS )
      real X( MM,NN ), RAS( NN,NN )
      common /LRast/ JRas
      automatic I,J,K,L

      do 10 K= 1,N
         do 10 L= 1,N
10       RAS( K,L ) = 0.
      do 20 J= 1,M
         do 20 K= 1,N
            do 20 L= 1,N
20          RAS( K,L ) = RAS( K,L ) + ( X( J,K ) - X( J,L )) **2
C --------------------------------------------------------------------------
      if( JRas .ne. 0 ) then
         write (*,111)
         write (*,222)
         call MatPri ( N,N, NN,NN, RAS )
      endif
      return
111   format(//,78('+'),/)
222   format(5X,'Square distance array :')
      end
