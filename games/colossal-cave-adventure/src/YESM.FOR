      LOGICAL FUNCTION YESM(X,Y,Z)
      
C  CALL YESX (BELOW) WITH MESSAGES FROM SECTION 12.

      IMPLICIT INTEGER*4 (A-Z)
C     INTEGER*2 ASCVAR
      EXTERNAL MSPEAK
      LOGICAL YESX
      
      YESM=YESX(X,Y,Z,MSPEAK)
      RETURN
      END
