C컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
C        Name: PATXYY                                      01/12/92 02:15pm   �
C                                                                             �
C Description: 롟��˛�� Мㅳレ 젷．黍燧� �昔－�쭬 貰〓殊� (歲栒졿Ł)          �
C              췅 �說�´ ぎНゥめⓣ�쥯�⑨ 젺젷�．�                            �
C                                                                             �
C Copyright (C) Nataly and Gregory Ivakhnenko, 1990-1991. All Rights Reserved �                               }
C컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸

      subroutine PATXYY (MY,MV,N,JJFR,MMY,MM,NN,NN1,
     +Y,YP,XV,X,XA,XB,CL,RAS,RIY,RAY,SY,OC,CVJ,CLX,RSX,XPR,
     +V,XN,IVM,IL,IMX,IN,LA)

      real Y(MMY,NN),YP(MMY,NN1),XV(MM,NN1), X(MM,NN1),
     +     XA(MM,NN),XB(MM,NN),  CL(JJFR,NN),RAS(NN,NN),
     +     RIY(MMY), RAY(MMY),   SY(MMY),    OC(MMY),  CLX(MM),
     +     CVJ(MM),  RSX(MM),    XPR(MM),    V(NN),    XN(NN)

      integer    IVM(JJFR,NN), IL(MM), IMX(MM), IN(NN)

      logical*1       LA(MM)
      common /LMAIN/  JP, JFM
      common /LNORXX/ JPRN
      common /LRAXV/  JRAXV
      automatic I,J,K

      EPS=1.E+20
      N1=N+1
C --------------------------------------------------------------------------
C                뜮席ⓣ�쥯��� ⓤ若ㄽ音 쩆��音  Y, XV
C --------------------------------------------------------------------------
         if(JPRN.ne.0) write (*,11)
      call NORXXX (MY,N,MMY,NN,Y,RIY,RAY,XN)
         if(JPRN.ne.0) write (*,22)
      call NORXXX (MV,N,MM,NN,XV,RSX,CLX,XN)
         do 100 J=1,MV              ! 뜮席ⓣ�˚� �音�ㄽ�． ´も��� 졷ｃД�獸�
100      XV(J,N1)=(XPR(J)-RSX(J))/(CLX(J)-RSX(J))
      if(JP.ne.0)  then
       I=JFM*MV
       if(I.gt.20) write (*,'(//,15X,A,//)')'룼ㄾ┐ⓥ�, ��쬊ャ⒰�� ...'
      endif
C --------------------------------------------------------------------------
C                묂ⅳ��� ㎛좂��⑨ 押�ゆŁ SY
C --------------------------------------------------------------------------
      do 120 JY=1,MY
         SY(JY)=0.
            do 120 I=1,N
120         SY(JY)=SY(JY)+Y(JY,I)
      do 130 JY=1,MY
130   SY(JY)=SY(JY)/N
C --------------------------------------------------------------------------
C                귣‘� 젺�젹∥� 졷ｃД�獸� IMX � 葉笹� 젺젷�．� JFC
C --------------------------------------------------------------------------
      call RBYY (CVII,JMC,JFC,MY,MV,N,JJFR,MMY,MM,NN,NN1,
     +Y,XV,X,XA,XB,CL,RAS,CVJ,V,IVM,IL,IMX,IN,LA)

      do 150 I=1,N1
         do 150 J=1,JMC
150      X(J,I)=XV(IMX(J),I)
C --------------------------------------------------------------------------
C                맆淞β �璵�え �昔－�㎜� � �昔－�� 押�ゆŁ
C --------------------------------------------------------------------------
      do 360 K=1,N1
            do 140 J=1,JMC
140         XPR(J)=XV(IMX(J),K)
         call RASXV  (K,JFC,JMC,N,MM,NN,NN1,X,XPR,V,XN,IN)

         if(JP.ne.0.and.K.eq.N1) then
            write (*,333)
            write (*,1111)
            write (*,444) (IN(J),J=1,JFC)
            write (*,2222)
            write (*,555) (V(J), J=1,JFC)
            write (*,3333)
         endif
         if(JFC.eq.1) then
            do 220 J=1,MY
220         YP(J,K)=Y(J,IN(1))
            goto 360
         endif

         do 260 J=1,MY
260      YP(J,K)=0.
         do 270 JA=1,JFC
            do 270 J=1,MY
270         YP(J,K)=YP(J,K)+V(JA)*Y(J,IN(JA))

         S=0.
         do 290 JA=1,JFC
290      S=S+V(JA)

         if(S.ne.0.) then
            do 310 J=1,MY
310         YP(J,K)=YP(J,K)/S
         else
            do 320 J=1,MY
320         YP(J,K)=EPS
         endif

360   continue
C --------------------------------------------------------------------------
C                맆淞β ´も��� �璵��� �昔－�㎜� 押�ゆŁ
C --------------------------------------------------------------------------
      if(JP.ne.0) then
         write (*,55) JFC
         write (*,111) CVII
         write (*,222) (IMX(J),J=1,JMC)
         do 380 J=1,MY
            D =0.0
            D1=0.0
            do 370 I=1,N
               D=D+(Y(J,I)-YP(J,I))**2
               if(Y(J,I).ne.SY(J)) then
                  D1=D1+(Y(J,I)-SY(J))**2
               else
                  D1=1.E-20
               endif
370         continue
            OC(J)=D/D1
380      continue
         if(MY.eq.1) then
            if(OC(1).gt.1.) then
               write (*,888) OC(1)
            else
               write (*,777) OC(1)
            endif
         else
            write (*,33) (OC(J),J=1,MY)
            write (*,44)
         endif
         read (*,*)
      endif
C --------------------------------------------------------------------------
C                맆㎛�席ⓣ�˚� �昔－�㎤說�М． ´も���
C --------------------------------------------------------------------------
      do 400 J=1,MY
         D =RIY(J)
         D1=RAY(J)-RIY(J)
            do 400 I=1,N1
400         YP(J,I)=D+D1*YP(J,I)
      do 410 J=1,MY
410   SY(J)=YP(J,N1)
C      call MATPRI (MY,N1,MMY,NN1,YP)
      if(JP.eq.0) write (*,*)
      write (*,*)
      write (*,1111)
      write (*,6666) (J,J=1,MY)
      write (*,2222)
      write (*,6666)
      write (*,7777) (SY(J),J=1,MY)
      write (*,6666)
C --------------------------------------------------------------------------
C          룯�졻� MIN � MAX ㎛좂��Ł 押�ゆŁ ㄻ� 蓀젪���⑨ � �昔－�쭬Ж
C --------------------------------------------------------------------------
      if(JP.ne.0) then
         write (*,2222)
         write (*,8888) (RIY(J),J=1,MY)
         write (*,9999) (RAY(J),J=1,MY)
      endif
      write (*,3333)
      write (*,*)
      return
11    format (8X,'뜮席ⓣ�쥯��硫 쵟遜Ð 押�ゆŁ :')
22    format (/,8X,'뜮席ⓣ�쥯��硫 쵟遜Ð 졷ｃД�獸� :')
33    format (/,7X,'롦��え �昔－�㎜� 押�ゆŁ :',20F8.3,/)
44    format (/,30X,'( �黍 �璵�ぅ Д�麟� 1.0,',
     +' �昔－�� Þ兒席졻Ð�� )')
55    format (7X,'렞殊쵟レ��� ぎエ曄飡¡ 젺젷�．� :',I4,/)
111   format (7X,'뙣�º僧 むⓥ�黍� 稅�レ㏆耀． ぎ�循�ワ CV ',
     +'췅 �ギ稅�飡� M x F :',E10.3,/)
222   format (7X,'렞殊쵟レ�硫  젺�젹∥�  X : ',50I4,/)
333   format (/,7X,'�췅ギ（ ´も��� 졷ｃД�獸� ㄻ� �昔－�쭬 :')
444   format (1X,'�   뜮Д�� ∥Ĳ젵鼇� 젺젷�．�  �',10(I5,3X))
555   format (1X,'�   궏貰�瑜   ぎδ十與��瞬     �',10E8.2)
777   format (/,7X,'뤲�－�� Þ兒쵟殊´�, ',
     +'�젶 첓� ⅲ� �璵�첓 =',F8.4,' Д�麟� Œ� �젪췅 1.0')
888   format (/,7X,'뤲�－�� �ⅷ�兒쵟殊´�, ',
     +'�젶 첓� ⅲ� �璵�첓 =',F8.4,' ‘レ蜈  1.0')
999   format (/,79('�'),/)
666   format (/,79('~'))
1111  format (1X,
     +'�袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴佶袴袴袴袴袴袴袴袴袴袴袴袴袴�',
     +'袴袴袴袴袴袴袴袴袴�')
2222  format (1X,
     +'픔컴컴컴컴컴컴컴컴컴컴컴컴컴컴컵컴컴컴컴컴컴컴컴컴컴컴컴컴컴',
     +'컴컴컴컴컴컴컴컴컴�')
3333  format (1X,
     +'훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴賈袴袴袴袴袴袴袴袴袴袴袴袴袴袴',
     +'袴袴袴袴袴袴袴袴袴�',//)
6666  format (1X,'�',30X,'�',20(I5,3X))
7777  format (1X,'�   뤲�－�� ㎛좂��Ł 押�ゆŁ Y �',20F8.3)
8888  format (1X,'�   뙣�º젷彛��   ㎛좂����   Y �',20F8.3)
9999  format (1X,'�   뙛めº젷彛��  ㎛좂����   Y �',20F8.3)
      end
