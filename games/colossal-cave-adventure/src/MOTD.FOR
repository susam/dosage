      SUBROUTINE MOTD(ALTER)
C      
C  HANDLES MESSAGE OF THE DAY.  IF ALTER IS TRUE, READ A NEW MESSGE FROM THE
C  WIZARD.  ELSE PRINT THE CURRENT ONE.  MESSAGE IS INITIALLY NULL.
C
      IMPLICIT INTEGER*4 (A-Z)
      LOGICAL ALTER
      CHARACTER*160 LINE
      CHARACTER*80 LINES(20)
C
      OPEN(UNIT=4,FILE='ADVMOTD.DAT',STATUS='UNKNOWN',
     1     FORM='UNFORMATTED')
C      
      IF(ALTER) THEN
C
C  HERE WE READ AND STORE A NEW MESSAGE OF THE DAY FROM THE WIZARD.  EACH
C  LINE IS LIMITED TO 80 CHARACTERS, AND THERE ARE A MAXIMUM OF 20 LINES.
C
      CALL MSPEAK(23)
      COUNT=0
      DO 5 I=1,20
    5 LINES(I)=' '
   10 LINE=' '
      READ(*,'(A)')LINE
      IF(LINE.EQ.' ') GOTO 20
      INDEX=LCHAR(LINE)
      IF(INDEX.GT.80) THEN
         CALL MSPEAK(24)
         GOTO 10
      ENDIF
      COUNT=COUNT+1
      LINES(COUNT)=LINE(1:INDEX)
      IF(COUNT.GE.20) THEN
         CALL MSPEAK(25)
         GOTO 20
      ENDIF
      GOTO 10
   20 WRITE(4)COUNT,(LINES(I),I=1,COUNT)
      GOTO 90
      ELSE
C
C  HERE WE READ THE MOTD FROM A FILE AND DISPLAY IT TO THE ADVENTURER
C
      READ(4)COUNT,(LINES(I),I=1,COUNT)
      WRITE(*,*)
      DO 30 I=1,COUNT
   30 WRITE(*,'(1H+,A)')LINES(I)
      ENDIF
   90 CLOSE(UNIT=4)
      RETURN
      END
