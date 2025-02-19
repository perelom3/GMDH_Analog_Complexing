CÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
C        Name: Dialog_1_DATAY                               01/06/92 12:33pm  ³
C                                                                             ³
C Description: Input of data parameters for file 'DATAY'.                     ³
C                                                                             ³
C Copyright (C) Nataly and Gregory Ivakhnenko, 1990-1991. All Rights Reserved ³
CÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

      subroutine  D1_DATAY (KL,D_NAME,M,MY,N)
      character*1  NO,NON,Q
      character*65 D_NAME

      NO  = 'N'
      NON = 'n'
      write (*,'(14X,2A\)') '‘®§¤ âì ­®¢ë© ä ©« ',
     +'¤ ­­ëå DATAY ? (Y/N) -> '
      read (*,'(A)') Q
      if(Q.eq.NO.or.Q.eq.NON) then
         KL=1
      else
         KL=0
      endif
C --------------------------------------------------------------------------
C        ‚¢®¤ ¯ à ¬¥âà®¢ ¤«ï ­®¢®£® ä ©« 
C --------------------------------------------------------------------------
      if(KL.eq.0) write (*,999)
60    continue
      if(KL.eq.0) then
        write(*,6666)
        write(*,'(14X,A,//,13X,A\)')'‚¢¥¤¨â¥ ­ §¢ ­¨¥ ¤«ï ¤ ­­ëå :',' '
        read (*,'(A)') D_NAME
      endif
      write (*,*)
      write (*,6666)

70    write(*,'(14X,A\)')   '‚¢¥¤¨â¥ ª®«¨ç¥áâ¢® ¯¥à¥¬¥­­ëå  M  -> '
      read (*,'(I3)') M
      if(M.le.0) goto 70
80    write(*,'(/,14X,A\)') '‚¢¥¤¨â¥  ª®«¨ç¥áâ¢®  äã­ªæ¨©  MY  -> '
      read (*,'(I3)') MY
      if(MY.le.0) goto 80
90    write(*,'(/,14X,A\)') '‚¢¥¤¨â¥  ª®«¨ç¥áâ¢®  â®ç¥ª     N  -> '
      read (*,'(I3)') N
      if(N.le.1) goto 90

      write (*,'(/,5X,A\)') '‚á¥ ¯à ¢¨«ì­® ?  (Y/N) '
      read (*,'(A)') Q
      write (*,*)
      if(Q.eq.NO.or.Q.eq.NON) goto 60
      return
999   format (//,1X,'‚¢®¤ §­ ç¥­¨© ¢ ä ©« ¤ ­­ëå :')
6666  format (79('Ä'),/)
      end
