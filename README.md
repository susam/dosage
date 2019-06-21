DOSAge
======
This directory contains a collection of vintage DOS games and tools that
I grew up with. These can be run using [DOSBox][DOSBOX].

[DOSBOX]: http://www.dosbox.com/download.php?main=1

The following list contains the copyright details of all software in
this directory.

* games/bricks
  - URL: https://www.myabandonware.com/game/bricks-1qf
  - URL: https://archive.org/details/Bricksa11984VinceBlyAction
  - Download: Bricks (1984)(Vince Bly) [Action].zip
  - Command: `dosbox -startmapper`
  - Command: `dosbox -machine cga -c "config -set cpu cycles 400" -c "mount c ." -c "c:\brick"`
  - Notes:
    - The first command starts key mapper to map Caps Lock and Insert
      keys to other convenient keys.
    - The second command does not start key mapper.
  - Manual Settings:
    - Press `Ctrl` + `Fn` + `F11` to reduce CPU speed to about 400 cycles.
    - Press `Command` + `Ctrl` + `Fn` + `F1` to remap Caps Lock and
      Insert keys to convenient keys like left arrow and right arrow.
* games/moon-bugs
  - Copyright (c) 1983 Windmill Software
  - Author: Windmill Software
  - URL: https://www.myabandonware.com/game/moon-bugs-2l
  - Command: `dosbox -startmapper`
  - Command: `dosbox -machine cga -c "config -set cpu cycles 400" -c "mount c ." -c "c:\moonbugs"`
* games/digger
  - Digger Remastered
  - Copyright (c) 1998-2004 Andrew Jenner
  - Author: Andrew Jenner
  - License: GNU General Public License version 2 or later
  - URLs: http://www.digger.org/digger.zip http://www.digger.org/digsrc.zip
* games/inv78-02
  - Invaders 1978 v02
  - Copyright (c) 1996-2000 James Eibisch
  - Author: James Eibisch
  - License: Freeware
  - URL: http://netadelica.com/coding/inv78/inv78-02.zip
* games/mspacman
  - Ms. Pac-Man
  - Copyright (c) 1983 Atari, Inc.
  - Author: Atari, Inc.
  - URL: http://dosgamezone.com/download/ms-pacman-1615.html
* games/grandprix
  - Grand Prix Circuit
  - Copyright (c) 1988 Accolade Inc.
  - Author: Accolade, Inc.
  - URL: http://www.bestoldgames.net/eng/old-games/grand-prix-circuit.php
* games/dangerous-dave
  - Dangerous Dave
  - Copyright (c) 1990 Softdisk, Inc.
  - Author: John Romero
  - URL: http://www.dosgames.com/g_side2.php
* langs/logo
  - IBM Personal Computer Logo Version 1.00
  - (c) Copyright IBM Corp. 1983
  - (c) Copyright LCSI 1983
  - URL: https://www.myabandonware.com/game/logo-2ms
* langs/gwbasic
  - GW-BASIC 3.23
  - (C) Copyright Microsoft 1983,1984,1985,1986,1987,1988
  - URL: https://web.archive.org/web/20091027112638/http://geocities.com/KindlyRat/GWBASIC.html
  - Downloads: GWBASIC.EXE.zip, gw-man.zip
  - URL: https://hwiegman.home.xs4all.nl/gwbasic.html
  - Downloads: GW-BASIC.ZIP, GW-MAN.zip
* langs/qb45
  - Microsoft (R) QuickBasic Version 4.50
  - (C) Copyright Microsoft Corporation, 1985-1988
  - URL: http://www.qbasic.net/en/qbasic-downloads/compiler/qbasic-compiler.htm
  - Download: QuickBasic 4.5 EN
  - URL: https://hwiegman.home.xs4all.nl/gwbasic.html
  - Download: QuickBasic 4.5
  - Notes:
    - Most files in both URLs are identical.
    - The first download contains files in HLP, INC, and LIB directory
      whereas the second download have these files in the top-level
      directory.
    - The first download have paths to HLP, INC, and LIB directories in
      QB.INI whereas the second download have paths to QB45 directory in
      QB.INI.
    - The first download contains PACKING.LST.lst but the second one
      does not have this file.
* langs/qb11
  - MS-DOS QBasic Version 1.1
  - Copyright (C) Microsoft Corporation, 1987-1992
  - URL: https://www.qbasic.net/en/qbasic-downloads/compiler/qbasic-interpreter.htm
  - Download: QBasic 1.1 EN
  - URL: https://hwiegman.home.xs4all.nl/gwbasic.html
  - Download: QBasic 1.1
* langs/bascom
  - IBM Personal Computer BASIC Compiler
  - (C) Copyright IBM Corp. 1982, 1983, 1984, 1985 Version 2.00
  - (C) Copyright Microsoft Corp. 1982, 1983, 1984, 1985
  - URL: https://web.archive.org/web/20091027112638/http://geocities.com/KindlyRat/GWBASIC.html
  - Download: COMPILER.zip
  - URL: https://hwiegman.home.xs4all.nl/gwbasic.html
  - Download: BASCOM.ZIP
  - Notes:
    - The important files are same in both downloads but there are
      differences as well.
    - This directory contains a subset of the content from BASCOM.ZIP
      downloaded from the second URL.
    - The following files have been removed from the download because
      they are not useful: GETCLOCK.COM, RAMDISK.COM, SAMPLE1.BAT,
      SAMPLE2.BAT.
  - Commands: `BASCOM HELLO /O`, `LINK HELLO`.
