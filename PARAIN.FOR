C컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
C        Name: PARAIN                                      12/09/91 02:33am   �
C                                                                             �
C Description: Input of data from file 'PARA'.                                �
C                                                                             �
C Copyright (C) Nataly and Gregory Ivakhnenko, 1990-1991. All Rights Reserved �
C컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸

      subroutine PARAIN (NUM,LL,IPAR)
      integer IPAR(LL)
      character*10 G

      open (unit=1,file='PARA',status='OLD',mode='READ',err=99999)
            do 10 I=1,NUM
10          read (1,'(A7,I3)') G,IPAR(I)
      close (unit=1)
      return
99999 stop '*** 롨Æ첓: 뜢¡㎚�┃� �洙贍筍 �젵� PARA !***'
      end
