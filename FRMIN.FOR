CÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
C        Name: FRMIN                                         12/09/91 02:33am ³
C                                                                             ³
C Description:  áç¥â ¢¥á®¢ëå ª®¥ää¨æ¨¥­â®¢ ¨  ¤à¥á®¢  ­ «®£®¢                ³
C              ¢ ¯à®£à ¬¬¥ XXYY                                               ³
C                                                                             ³
C Copyright (C) Nataly and Gregory Ivakhnenko, 1990-1991. All Rights Reserved ³
CÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

      subroutine FRMIN (JFR,N,JJFR,NN,CL,RAS,V,IVM,IN)
      real     CL(JJFR,NN), RAS(NN,NN), V(NN)
      integer IVM(JJFR,NN), IN(NN)

      EPS=1.E+20
      N11=N-1
      do 30 K=1,N
         I=0
         do 10 L=1,N
            if(L.ne.K)  then
               I=I+1
               IN(I)=L
               V(I)=RAS(K,L)
10          endif
            call RA1IV (N11,NN,V,IN)
            do 30 L=1,JFR
               if(V(L).eq.0.0) then
                  CL(L,K)=EPS
                  goto 20
               endif
               CL(L,K)=1/V(L)
20             IVM(L,K)=IN(L)
30       continue
      return
      end
