C컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
C        Name: RASXV                                       12/09/91 02:33am   �
C                                                                             �
C Description: 맆淞β ´も��� RSX(NN) 率К� あ젮�졻�� 笠かĦ�¡． �졹飡�輾⑨  �
C              �� 飡�ァ�젹, ⅲ� �젺┬昔˚�, �졹曄� ´も��� CLX(NN)            �
C              �□졻��． �졹飡�輾⑨ � �昔｀젹Д XXYY                          �
C                                                                             �
C Copyright (C) Nataly and Gregory Ivakhnenko, 1990-1991. All Rights Reserved �
C컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸

      subroutine RASXV (K,JFC,JMC,N,MM,NN,NN1,X,XPR,V,XN,IN)
      real X(MM,NN1), XPR(MM), V(NN), XN(NN)
      integer IN(NN)
      common /LRAXV/ JRAXV

      N1=N+1
      EPS=1.E+20
      if(K.eq.N1) then
         N11=N
      else
         N11=N-1
      endif
         do 10 I=1,N
10       XN(I)=0.
      L=0
      do 30 I=1,N
         if(I.eq.K) goto 30
            L=L+1
            IN(L)=I
               do 20 J=1,JMC
               XN(L)=XN(L)+(XPR(J)-X(J,I))**2
20             continue
30    continue

      call RA1IV (N11,NN,XN,IN)

      if(JRAXV.eq.1) then
         write (*,111) K
         call VEMPRY (0,N11,NN,XN,IN)
      endif

      do 50 J=1,JFC
         if(XN(J).eq.0.0) then
            V(J)=EPS
            goto 50
         endif
         V(J)=1/XN(J)
50    continue
      return
111   format(2X,'궏も�� あ젮�졻�� �졹飡�輾Ł ㄻ�',I3,' 獸囹�:')
      end
