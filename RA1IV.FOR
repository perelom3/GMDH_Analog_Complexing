C*****************************************************************************}
C                          IiI FORTRAN SubProgram                             }
C        Name: RA1IV                                                          }
C                                                                             }
C Description: Ранжирование по возрастанию целого массива IV(ML)              }
C              и адресов его элементов.                                       }
C                                                                             }
C Copyright (C) Nataly and Gregory Ivakhnenko, 1990-1991. All Rights Reserved }
C*****************************************************************************}

      subroutine RA1IV (LV,ML,V,IV)
      real V(ML),A,B
      integer IV(ML),IA,IB
      L=LV-1
      do 30 J=1,L
      K=J+1
      do 20 I=1,J
      if(V(K)-V(I)) 10,20,20
10    A=V(K)
      B=V(I)
      V(K)=B
      V(I)=A
      IA=IV(K)
      IB=IV(I)
      IV(K)=IB
      IV(I)=IA
20    continue
30    continue
      return
      end
