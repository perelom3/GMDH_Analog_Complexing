C컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
C      닾�: VEMPRY                                                            �
C                                                                             �
C 렞ⓤ젺��: 룯�졻� ´も��� V(MM) � 젮誓貰� ⅲ� 姉�Д�獸�.                     �
C                                                                             �
C 뜝�ⓤ젺� 뜝�젷伊� � 꺺ª�黍�� 닣졾���ぎ, 1990-1992 (c)                      �
C컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸

      subroutine VEMPRY (JM,M,MM,V,IV)
      real V(MM)
      integer IV(MM)
      if(JM.ne.0) then
         do 10 J=1,M
10       IV(J)=J
      endif
      write(*,111)
      L=M/8.0+1
      do 20 K=1,L
         L1=8*(K-1)+1
         L2=8*K
         if(L2.gt.M) L2=M
         write(*,222) (IV(J),J=L1,L2)
         write (*,333)
         write(*,444) (V(J),J=L1,L2)
         if(L.ne.1.and.K.ne.L.and.L2.ne.M) then
            write (*,555)
         else
            write (*,666)
            return
         endif
20    continue
      return
111   format (1X,
     +'�袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�',
     +'袴袴袴袴袴袴袴袴�')
333   format (1X,
     +'픔컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴',
     +'컴컴컴컴컴컴컴컴�')
555   format (1X,
     +'勁袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴',
     +'袴袴袴袴袴袴袴袴�')
666   format (1X,
     +'훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴',
     +'袴袴袴袴袴袴袴袴�')
222   format(1X,'�   ',8(I5,4X))
444   format(1X,'�   ',8F9.3 )
      end
