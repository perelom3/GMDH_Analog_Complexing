CÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
C        Name: PARAIN                                      12/09/91 02:33am   ³
C                                                                             ³
C Description: Input of data from file 'PARA'.                                ³
C                                                                             ³
C Copyright (C) Nataly and Gregory Ivakhnenko, 1990-1991. All Rights Reserved ³
CÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

      subroutine PARAIN (NUM,LL,IPAR)
      integer IPAR(LL)
      character*10 G

      open (unit=1,file='PARA',status='OLD',mode='READ',err=99999)
            do 10 I=1,NUM
10          read (1,'(A7,I3)') G,IPAR(I)
      close (unit=1)
      return
99999 stop '*** è¨¡ª : ¥¢®§¬®¦­® ®âªàëâì ä ©« PARA !***'
      end
