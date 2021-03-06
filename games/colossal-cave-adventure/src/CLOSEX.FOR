      SUBROUTINE CLOSEX(IRET)
C
      INCLUDE 'ADVCOM.COM'
      INCLUDE 'NEWCOM.COM'
      INCLUDE 'FUNCT.H'
      
C
C  TRANSFER TO REQUIRED PROCESSING SECTION
C
      GOTO(10000,11000,12000,12200,12400,12600,13000,19000,20000),IRET
C
C  CAVE CLOSING AND SCORING
C
C  THESE SECTIONS HANDLE THE CLOSING OF THE CAVE.  THE CAVE CLOSES "CLOCK1"
C  TURNS AFTER THE LAST TREASURE HAS BEEN LOCATED (INCLUDING THE PIRATE'S
C  CHEST, WHICH MAY OF COURSE NEVER SHOW UP).  NOTE THAT THE TREASURES NEED NOT
C  HAVE BEEN TAKEN YET, JUST LOCATED.  HENCE CLOCK1 MUST BE LARGE ENOUGH TO GET
C  OUT OF THE CAVE (IT ONLY TICKS WHILE INSIDE THE CAVE).  WHEN IT HITS ZERO,
C  WE BRANCH TO 10000 TO START CLOSING THE CAVE, AND THEN SIT BACK AND WAIT FOR
C  HIM TO TRY TO GET OUT.  IF HE DOESN'T WITHIN CLOCK2 TURNS, WE CLOSE THE
C  CAVE; IF HE DOES TRY, WE ASSUME HE PANICS, AND GIVE HIM A FEW ADDITIONAL
C  TURNS TO GET FRANTIC BEFORE WE CLOSE.  WHEN CLOCK 2 HITS ZERO, WE BRANCH TO
C  11000 TO TRANSPORT HIM INTO THE FINAL PUZZLE.  NOTE THAT THE PUZZLE DEPENDS
C  UPON ALL SORTS OF RANDOM THINGS.  FOR INSTANCE, THERE MUST BE NO WATER OR
C  OIL, SINCE THERE ARE BEANSTALKS WHICH WE DON'T WANT TO BE ABLE TO WATER,
C  SINCE THE CODE CAN'T HANDLE IT.  ALSO, WE CAN HAVE NO KEYS, SINCE THERE IS A
C  GRATE (HAVING MOVED THE FIXED OBJECT!) THERE SEPARATING HIM FROM ALL THE
C  TREASURES.  MOST OF THESE PROBLEMS ARISE FROM THE USE OF NEGATIVE PROP
C  NUMBERS TO SUPPRESS THE OBJECT DESCRIPTIONS UNTIL HE'S ACTUALLY MOVED THE
C  OBJECTS.

C  WHEN THE FIRST WARNING COMES, WE LOCK THE GRATE, DESTROY THE BRIDGE, KILL
C  ALL THE DWARVES (AND THE PIRATE), REMOVE THE TROLL AND BEAR (UNLESS DEAD),
C  AND SET "CLOSNG" TO TRUE.  LEAVE THE DRAGON; TOO MUCH TROUBLE TO MOVE IT.
C  FROM NOW UNTIL CLOCK2 RUNS OUT, HE CANNOT UNLOCK THE GRATE, MOVE TO ANY
C  LOCATION OUTISDE THE CAVE (LOC<9), OR CREATE THE BRIDGE.  NOR CAN HE BE
C  RESURRECTED IF HE DIES.  NOTE THAT THE SNAKE IS ALREADY GONE, SINCE HE GOT
C  TO THE TREASURE ACCESSIBLE ONLY VIA THE HALL OF THE MT. KING.  ALSO, HE'S
C  GOTTEN THE PEARL, SO WE KNOW THE BIVALVE IS AN OYSTER.  *AND*, THE DWARVES
C  MUST HAVE BEEN ACTIVATED, SINCE WE'VE FOUND CHEST.

10000 PROP(GRATE)=0
      PROP(FISSUR)=0
      DO 10010 I=1,6
      DSEEN(I)=.FALSE.
10010 DLOC(I)=0
      CALL MOVE(TROLL,0)
      CALL MOVE(TROLL+100,0)
      CALL MOVE(TROLL2,PLAC(TROLL))
      CALL MOVE(TROLL2+100,FIXD(TROLL))
      CALL JUGGLE(CHASM)
      IF(PROP(BEAR).NE.3) CALL DSTROY(BEAR)
      PROP(CHAIN)=0
      FIXED(CHAIN)=0
      PROP(AXE)=0
      FIXED(AXE)=0
      CALL RSPEAK(129)
      CLOCK1=-1
      CLOSNG=.TRUE.
      GOTO 19999
      
C  ONCE HE'S PANICKED, AND CLOCK2 HAS RUN OUT, WE COME HERE TO SET UP THE
C  STORAGE ROOM.  THE ROOM HAS TWO LOCS, HARDWIRED AS 115 (NE) AND 116 (SW).
C  AT THE NE END, WE PLACE EMPTY BOTTLES, A NURSERY OF PLANTS, A BED OF
C  OYSTERS, A PILE OF LAMPS, RODS WITH STARS, SLEEPING DWARVES, AND HIM.  AND
C  THE SW END WE PLACE GRATE OVER TREASURES, SNAKE PIT, COVEY OF CAGED BIRDS,
C  MORE RODS, AND PILLOWS.  A MIRROR STRETCHES ACROSS ONE WALL.  MANY OF THE
C  OBJECTS COME FROM KNOWN LOCATIONS AND/OR STATES (E.G., THE SNAKE IS KNOWN TO
C  HAVE BEEN DESTROYED AND NEEDN'T BE CARRIED AWAY FROM ITS OLD "PLACE"),
C  MAKING THE VARIOUS OBJECTS BE HANDLED DIFFERENTLY.  WE ALSO DROP ALL OTHER
C  OBJECTS HE MIGHT BE CARRYING (LEST HE HAVE SOME WHICH COULD CAUSE TROUBLE,
C  SUCH AS THE KEYS).  WE DESCRIBE THE FLASH OF LIGHT AND TRUNDLE BACK.

11000 PROP(BOTTLE)=PUT(BOTTLE,115,1)
      PROP(PLANT)=PUT(PLANT,115,0)
      PROP(OYSTER)=PUT(OYSTER,115,0)
      PROP(LAMP)=PUT(LAMP,115,0)
      PROP(ROD)=PUT(ROD,115,0)
      PROP(DWARF)=PUT(DWARF,115,0)
      LOC=115
      OLDLOC=115
      NEWLOC=115
      
C  LEAVE THE GRATE WTIH NORMAL (NON-NEGATIVE) PROPERTY.

      FOO=PUT(GRATE,116,0)
      PROP(SNAKE)=PUT(SNAKE,116,1)
      PROP(BIRD)=PUT(BIRD,116,1)
      PROP(CAGE)=PUT(CAGE,116,0)
      PROP(ROD2)=PUT(ROD2,116,0)
      PROP(PILLOW)=PUT(PILLOW,116,0)
      
      PROP(MIRROR)=PUT(MIRROR,115,0)
      FIXED(MIRROR)=116
      
      DO 11010 I=1,100
11010 IF(TOTING(I)) CALL DSTROY(I)

      CALL RSPEAK(132)
      CLOSED=.TRUE.
      GOTO 2
      
C  ANOTHER WAY WE CAN FORCE AN END TO THINGS IS BY HAVING THE LAMP GIVE OUT.
C  WHEN IT GETS CLOSE, WE COME HERE TO WARN HIM.  WE GO TO 12000 IF THE LAMP
C  AND FRESH BATTERIES ARE HERE, IN WHICH CASE WE REPLACE THE BATTERIES AND
C  CONTINUE.  12200 IS FOR OTHER CASES OF LAMP DYING.  12400 IS WHEN IT GOES
C  OUT, AND 12600 IS IF HE'S WANDERED OUTSIDE AND THE LAMP IS USED UP, IN WHICH
C  CASE WE FORCE HIM TO GIVE UP.

12000 CALL RSPEAK(188)
      PROP(BATTER)=1
      IF(TOTING(BATTER)) CALL DROP(BATTER,LOC)
      LIMIT=LIMIT+2500
      LMWARN=.FALSE.
      GOTO 19999
      
12200 IF(LMWARN.OR..NOT.HERE(LAMP)) GOTO 19999
      LMWARN=.TRUE.
      SPK=187
      IF(PLACE(BATTER).EQ.0) SPK=183
      IF(PROP(BATTER).EQ.1) SPK=189
      CALL RSPEAK(SPK)
      GOTO 19999
      
12400 LIMIT=-1
      PROP(LAMP)=0
      IF(HERE(LAMP)) CALL RSPEAK(184)
      GOTO 19999
      
12600 CALL RSPEAK(185)
      GAVEUP=.TRUE.
      GOTO 20000
      
C  AND, OF COURSE, DEMO GAMES ARE ENDED BY THE WIZARD.

13000 CALL MSPEAK(1)
      GOTO 20000
      
C  OH DEAR, HE'S DISTURBED THE DWARVES.

19000 CALL RSPEAK(136)

C  EXIT CODE.  WILL EVENTUALLY INCLUDE SCORING.  FOR NOW, HOWEVER, ...

C  THE PRESENT SCORING ALGORITHM IS AS FOLLOWS:
C     OBJECTIVE:          POINTS:        PRESENT TOTAL POSSIBLE:
C  GETTING WELL INTO CAVE   25                    25
C  EACH TREASURE < CHEST    12                    60
C  TREASURE CHEST ITSELF    14                    14
C  EACH TREASURE > CHEST    16                   144
C  SURVIVING             (MAX-NUM)*10             30
C  NOT QUITTING              4                     4
C  REACHING "CLOSNG"        25                    25
C  "CLOSED": QUIT/KILLED    10
C            KLUTZED        25
C            WRONG WAY      30
C            SUCCESS        45                    45
C  CAME TO WITT'S END        1                     1
C  ROUND OUT THE TOTAL       2                     2
C                                       TOTAL:   350
C  (POINTS CAN ALSO BE DEDUCTED FOR USING HINTS.)

20000 SCORE=0
      MXSCOR=0
      
C  FIRST TALLY UP THE TREASURES.  MUST BE IN BUILDING AND NOT BROKEN.
C  GIVE THE POOR GUY 2 POINTS JUST FOR FINDING EACH TREASURE.

      DO 20010 I=50,MAXTRS
      IF(PTEXT(I).EQ.0) GOTO 20010
      K=12
      IF(I.EQ.CHEST) K=14
      IF(I.GT.CHEST) K=16
      IF(PROP(I).GE.0) SCORE=SCORE+2
      IF(PLACE(I).EQ.3.AND.PROP(I).EQ.0) SCORE=SCORE+K-2
      MXSCOR=MXSCOR+K
20010 CONTINUE

C  NOW LOOK AT HOW HE FINISHED AND HOW FAR HE GOT.  MAXDIE AND NUMDIE TELL US
C  HOW WELL HE SURVIVED.  GAVEUP SAYS WHETHER HE EXITED VIA QUIT.  DFLAG WILL
C  TELL US IF HE EVER GOT SUITABLY DEEP INTO THE CAVE.  CLOSNG STILL INDICATES
C  WHETHER HE REACHED THE ENDGAME.  AND IF HE GOT AS FAR AS "CAVE CLOSED"
C  (INDICATED BY "CLOSED"), THEN BONUS IS ZERO FOR MUNDANE EXITS OR 133, 134,
C  135 IF HE BLEW IT (SO TO SPEAK).

      SCORE=SCORE+(MAXDIE-NUMDIE)*10
      MXSCOR=MXSCOR+MAXDIE*10
      IF(.NOT.(SCORNG.OR.GAVEUP)) SCORE=SCORE+4
      MXSCOR=MXSCOR+4
      IF(DFLAG.NE.0) SCORE=SCORE+25
      MXSCOR=MXSCOR+25
      IF(CLOSNG)SCORE=SCORE+25
      MXSCOR=MXSCOR+25
      IF(.NOT.CLOSED) GOTO 20020
      IF(BONUS.EQ.0) SCORE=SCORE+10
      IF(BONUS.EQ.135) SCORE=SCORE+25
      IF(BONUS.EQ.134) SCORE=SCORE+30
      IF(BONUS.EQ.133) SCORE=SCORE+45
20020 MXSCOR=MXSCOR+45

C  DID HE COME TO WITT'S END AS HE SHOULD?

      IF(PLACE(MAGZIN).EQ.108) SCORE=SCORE+1
      MXSCOR=MXSCOR+1
      
C  ROUND IT OFF.

      SCORE=SCORE+2
      MXSCOR=MXSCOR+2
      
C  DEDUCT POINTS FOR HINTS.  HINTS < 4 ARE SPECIAL; SEE DATABASE DESCRIPTION.

      DO 20030 I=1,HNTMAX
20030 IF(HINTED(I)) SCORE=SCORE-HINTS(I,2)

C  RETURN TO SCORE COMAND IF THAT'S WHERE WE CAME FROM.

      IF(SCORNG) GOTO 8241
      
C  THAT SHOULD BE GOOD ENOUGH.  LET'S TELL HIM ALL ABOUT IT.

      WRITE(*,20100) SCORE,MXSCOR,TURNS
20100 FORMAT(///' YOU SCORED',I4,' OUT OF A POSSIBLE',I4,
     1          ', USING',I5,' TURNS.')
     
      DO 20200 I=1,CLSSES
      IF(CVAL(I).GE.SCORE) GOTO 20210
20200 CONTINUE
      WRITE(*,20202)
20202 FORMAT(/' YOU JUST WENT OFF MY SCALE!!'/)
      GOTO 25000
20210 CALL SPEAK(CTEXT(I))
      IF(I.EQ.CLSSES-1) GOTO 20220
      K=CVAL(I)+1-SCORE
      KK='S.'
      IF(K.EQ.1) KK='. '
      WRITE(*,20212) K,KK
20212 FORMAT(/' TO ACHIEVE THE NEXT HIGHER RATING, YOU NEED',I3,
     1        ' MORE POINT',A2/)
      GOTO 25000
      
20220 WRITE(*,20222)
20222 FORMAT(/' TO ACHIEVE THE NEXT HIGHER RATING ',
     1        'WOULD BE A NEAT TRICK!'//' CONGRATULATIONS!!'/)
     
      GOTO 25000
C
C  SET COMPLETION CODE FOR RETURN TO THE CALLING ROUTINE.
C
19999 CONTINUE
      IRET=1
      RETURN
C
    2 CONTINUE
      IRET=2
      RETURN
C
 8241 CONTINUE
      IRET=3
      RETURN
C
25000 CONTINUE
      IRET=4
      RETURN
      END

    