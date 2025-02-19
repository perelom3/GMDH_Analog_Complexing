C*****************************************************************************}
C        Name: NORV                                                           }
C                                                                             }
C Description: Нормирование вектора X(ML) по размаху                          }
C                                                                             }
C Copyright (C) Nataly and Gregory Ivakhnenko, 1990-1991. All Rights Reserved }
C*****************************************************************************}
      subroutine NORV (RI,RA,LV,ML,V)
      real V(ML)
      automatic I

      RI=1.E+20
      RA=-1.E+20
      do 10 I=1,LV
         if(V(I).LE.RI) RI=V(I)
         if(V(I).GT.RA) RA=V(I)
10    continue
      A=RA-RI
      if(A.eq.0) stop ' Error (NORV): X(max) = X(min)'
         do 20 I=1,LV
20       V(I)=(V(I)-RI)/A
      return
      end
