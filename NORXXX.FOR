C─────────────────────────────────────────────────────────────────────────────┐
C        Name: NORXX                                         12/09/91 02:33am │
C                                                                             │
C Description: Нормирование входного массива X(MM,NN) по размаху,             │
C              вывод на печать нормированных значений.                        │
C                                                                             │
C Copyright (C) Nataly and Gregory Ivakhnenko, 1990-1991. All Rights Reserved │
C─────────────────────────────────────────────────────────────────────────────┘

      subroutine NORXXX (M,N,MM,NN,X,RIX,RAX,V)
      real X(MM,NN),RIX(MM),RAX(MM),V(NN)
      common /LNORXX/ JPRN

      do 30 J=1,M
         do 10 I=1,N
10       V(I)=X(J,I)
         call NORV(RI,RA,N,NN,V)
            do 20 I=1,N
20          X(J,I)=V(I)
         RIX(J)=RI
         RAX(J)=RA
30    continue
      if(JPRN.ne.0) call MATPRI (M,N,MM,NN,X)
      return
      end
