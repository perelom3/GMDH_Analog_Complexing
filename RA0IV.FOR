C*****************************************************************************}
C                          IiI FORTRAN SubProgram                             }
C        Name: RA0IV                                                          }
C                                                                             }
C Description: Ранжирование по возрастанию целого массива IV(ML).             }
C                                                                             }
C Copyright (C) Nataly and Gregory Ivakhnenko, 1990-1991. All Rights Reserved }
C*****************************************************************************}

      subroutine RA0IV (LV,ML,IV)
      integer IV(ML),IA,IB
      do 10 J=1,LV-1
         K=J+1
         do 10 I=1,J
            if(IV(K).lt.IV(I)) then
               IA=IV(I)
               IB=IV(K)
               IV(I)=IB
               IV(K)=IA
            endif
10       continue
      return
      end
