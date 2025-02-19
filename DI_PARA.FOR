C─────────────────────────────────────────────────────────────────────────────┐
C        Name: Dialog_PARA                                 01/09/92 01:33pm   │
C                                                                             │
C Description: Input of data from file 'PARA'.                                │
C                                                                             │
C Copyright (C) Nataly and Gregory Ivakhnenko, 1990-1991. All Rights Reserved │
C─────────────────────────────────────────────────────────────────────────────┘

      subroutine  DI_PARA (JJFR,IPAR)
      integer        IPAR(3)
      character*1    NO,NON,Q
      common /LDAT/  JPRI
      common /LMAIN/ JP,JFM

      JPR = 1
      NO  = 'N'
      NON = 'n'
      write(*,'(//,14X,2A\)') 'Ввести параметры ',
     +'из файла PARA ?  (Y/N) -> '
      read (*,'(A)') Q
      if(Q.ne.NO.and.Q.ne.NON) then
C --------------------------------------------------------------------------
C           Ввод из файла PARA
C --------------------------------------------------------------------------
         call PARAIN (3,LL,IPAR)
         if(IPAR(1).ne.0.and.IPAR(1).ne.1) IPAR(1)=1
         if(IPAR(2).ne.0.and.IPAR(2).ne.1) IPAR(2)=0
         if(IPAR(3).gt.JJFR) then
            write (*,666) IPAR(3),JJFR,JJFR
            IPAR(3)=JJFR
         elseif(IPAR(3).lt.1) then
            write (*,111) IPAR(3)
            IPAR(3)=1
         endif
         JPRI =IPAR(1)
         JP   =IPAR(2)
         JFM  =IPAR(3)
         return
      endif
C --------------------------------------------------------------------------
C        Ввод параметров с клавиатуры и запись в файл при  KL = 0
C --------------------------------------------------------------------------
      write (*,'(/,14X,2A\)') 'Создать новый файл ',
     +'параметров PARA ?  (Y/N) -> '
      read(*,'(A)') Q
      if(Q.eq.NO.or.Q.eq.NON) then
         KL=1
      else
         KL=0
      endif

      if(KL.eq.0) open(unit=1, file='PARA', status='UNKNOWN',err=99999)
10    if(KL.eq.0) write (*,222)
      write (*,6666)
      write (*,'(/,5X,2A\)') 'Выводить исходный данные на экран ? (Y)',
     +'  (Y/N) -> '
      read (*,'(A)') Q
      if(Q.ne.NO.and.Q.ne.NON) then
         if(KL.eq.0) write (1,'(A)') ' JPRI = 1'
         JPRI=1
      else
         if(KL.eq.0) write (1,'(A)') ' JPRI = 0'
         JPRI=0
      endif

20    write (*,'(/,5X,2A)') 'Задайте идентификатор степени вывода ',
     +'промежуточных результатов  JP (= 0):'
      write (*,*) '         JP = 0 - режим нормального вывода'
      write (*,'(10X,A,6X,A\)') 'JP = 1 - режим с расширенным выводом',
     +'-> '
       read (*,'(I2)') JP
      write (*,*)
      if(JP.ne.0.and.JP.ne.1) goto 20
      if(JP.eq.0) then
         if(KL.eq.0) write (1,'(A)') ' JP   = 0'
         JP=0
      else
         if(KL.eq.0) write (1,'(A)') ' JP   = 1'
         JP=1
      endif

30    write (*,'(/,5X,2A,/,5X,A,I2,A\)') 'Задайте максимальное',
     +' количество аналогов при переборе ',
     +'ансамблей аргументов  (0 < JFM=5 < ',JJFR,')         -> '
      read (*,'(I2)') JFM
      if(JFM.eq.0) JFM=5
      if(JFM.le.0.or.JFM.gt.JJFR) goto 30
      if(KL.eq.0) write (1,'(A7,I2)') ' JFM  =',JFM

      write (*,333) JPRI
      write (*,444) JP
      write (*,555) JFM
         write (*,'(/,6X,A\)') 'Все правильно ?  (Y/N) '
         read (*,'(A)') Q
         if(Q.eq.NO.or.Q.eq.NON) goto 10
         write (*,6666)
      if(KL.eq.0) close(unit=1)

      return
111   format (/,14X,'Предуреждение: Максимальное количество',
     +' аналогов JFM =',I2,/,29X,'слишком мало (JFM > 0)!',
     +'   Принимается  JFM = 1.'/)
666   format (/,14X,'Предуреждение: Количество аналогов JFM =',I3,
     +' превышает',/,29X,'максимальное  JJFR =',I3,
     +'!   Принимается JFM =',I2,'.'/)
222   format (//,1X,'Ввод значений в файл параметров :')
333   format (/,7X,'Идентификатор вывода данных',15X,'JPRI=',I2)
444   format (7X,'Идентификатор степени вывода результатов  JP  =',I2)
555   format (7X,'Максимальное количество аналогов          JFM =',I2)
6666  format (79('─'),/)
99999 stop '*** Ошибка: Невозможно открыть новый файл PARA ! ***'
      end
