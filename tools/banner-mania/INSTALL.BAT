	echo off
	if not '%1' == '' goto nohelp
:help
	cls
	echo If you have two floppy disk drives, you can install BannerMania
	echo directly onto a floppy disk.  To do so, insert a blank, formatted
	echo disk into the drive that doesn't contain this disk and type:
	echo ÿ
	echo ÿ       INSTALL A:
	echo ÿ
	echo If the blank disk is in drive A, or:
	echo ÿ
	echo ÿ       INSTALL B:
	echo ÿ
	echo If the blank disk is in drive B.
	echo ÿ
	echo ÿ
	echo To install BannerMania on a hard disk, type:
	echo ÿ
	echo ÿ       INSTALL x:
	echo ÿ
	echo Where "x" is the letter of the hard disk (C-J).  A subdirectory will be
	echo created on your hard disk to hold the BannerMania files.  The default
	echo name of this subdirectory is "\BANNER".  To specify a different name,
	echo enter it on the command line following the drive letter.  For example:
	echo ÿ
	echo ÿ       INSTALL C: \BMAN    (The space between C: and \BMAN is required!)
	goto realend
:nohelp
	cls
	echo ÿ
	echo INSTALL %1 %2
	echo ÿ
	echo BannerMania version .78 Installation Program
	echo ÿ
	if %1 == a: goto floppy
	if %1 == A: goto floppy
	if %1 == b: goto floppy
	if %1 == B: goto floppy
	if %1 == c: goto hard
	if %1 == C: goto hard
	if %1 == d: goto hard
	if %1 == D: goto hard
	if %1 == e: goto hard
	if %1 == E: goto hard
	if %1 == f: goto hard
	if %1 == F: goto hard
	if %1 == g: goto hard
	if %1 == G: goto hard
	if %1 == h: goto hard
	if %1 == H: goto hard
	if %1 == i: goto hard
	if %1 == I: goto hard
	if %1 == j: goto hard
	if %1 == J: goto hard
:badparm
	echo     * YOU HAVE TYPED INVALID PARAMETERS *
	echo ÿ
	echo     The letter of the drive on which to install
	echo     BannerMania must be in the range of A through J.
	echo     You must type a colon after the drive letter.
	echo ÿ
	echo     If you wish to specify a hard disk sub-directory other than "\BANNER",
	echo     you must type a space between the drive letter and the directory name.
	echo ÿ
	echo     Remember too that if you specify a directory name without a leading
	echo     backslash, the sub-directory will be created inside the specified
	echo     drive's current directory.
	echo ÿ
	pause
	goto help
:hard
	if not '%2' == '' goto custom
:default
	if not exist %1\BANNER goto mk_defl
	echo     * A FILE CALLED "%1\BANNER" ALREADY EXISTS *
	echo ÿ
	echo     Please delete "%1\BANNER" or specify a
	echo     different sub-directory name and try again.
	goto end
:mk_defl
	echo A sub-directory called %1\BANNER will be created.
	echo The BannerMania files will be copied into it.
	echo ÿ
	echo To cancel installation at any time,
	echo hold down the [Ctrl] key and press [C].
	echo ÿ
	pause
	echo ÿ
	echo Creating %1\BANNER ...
	md %1\BANNER
	echo ÿ
	echo Copying the program ...
	echo BANNER.EXE
	copy BANNER.EXE %1\BANNER /V
	if not exist %1\BANNER\BANNER.EXE goto diskfull
	echo Copying printer driver files ...
	copy BANNER.P* %1\BANNER /V
	if not exist %1\BANNER\BANNER.PRD goto diskfull
	echo Copying font files ...
	copy *.FNT %1\BANNER /V
	if not exist %1\BANNER\ZURICH.FNT goto diskfull
	echo Copying ready-made banner file ...
	copy banner.brm %1\BANNER /V
	if not exist %1\BANNER\BANNER.BRM goto diskfull
	echo ÿ
	echo All Done!
	echo ÿ
	echo To run BannerMania, type:
	echo ÿ
	echo ÿ       %1
	echo ÿ       CD \BANNER
	goto done
:custom
	if not exist %1%2 goto mk_cust
	echo     * A FILE CALLED "%1%2" ALREADY EXISTS *
	echo ÿ
	echo     Please delete "%1%2" or choose a
	echo     different sub-directory name and try again.
	goto end
:mk_cust
	echo A sub-directory called %1%2 will be created.
	echo The BannerMania files will be copied into it.
	echo ÿ
	echo To cancel installation at any time,
	echo hold down the [Ctrl] key and press [C].
	echo ÿ
	pause
	echo ÿ
	echo Creating %1%2 ...
	md %1%2
	echo ÿ
	echo Copying the program ...
	echo BANNER.EXE
	copy BANNER.EXE %1%2 /V
	if not exist %1%2\BANNER.EXE goto diskfull
	echo Copying printer driver files ...
	copy BANNER.P* %1%2 /V
	if not exist %1%2\BANNER.PRD goto diskfull
	echo Copying font files ...
	copy *.FNT %1%2 /V
	if not exist %1%2\ZURICH.FNT goto diskfull
	echo Copying ready-made banner file ...
	copy BANNER.BRM %1%2 /V
	if not exist %1%2\BANNER.BRM goto diskfull
	echo ÿ
	echo All Done!
	echo ÿ
	echo To run BannerMania, type:
	echo ÿ
	echo ÿ       %1
	echo ÿ       CD %2
	goto done
:floppy
	if '%2' == '' goto floppyok
:nosubdir
	echo     * YOU HAVE TYPED AN UNEXPECTED SECOND PARAMETER *
	echo ÿ
	echo     You may not install BannerMania in a
	echo     sub-directory of a floppy disk.
	echo ÿ
	pause
	goto help
:floppyok
	echo All files on the floppy disk in drive %1 will be erased.
	echo The BannerMania files will be copied onto it.
	echo ÿ
	echo If you do NOT want this disk erased,
	echo or to cancel installation at any time,
	echo hold down the [Ctrl] key and press [C].
	echo ÿ
	pause
	echo ÿ
	echo Erasing the floppy disk:
	del %1\*.*
	echo ÿ
	echo Copying the program ...
	echo BANNER.EXE
	copy BANNER.EXE %1 /V
	if not exist %1\BANNER.EXE goto diskfull
	echo Copying printer driver files ...
	copy BANNER.P* %1 /V
	if not exist %1\BANNER.PRD goto diskfull
	echo Copying font files ...
	copy *.FNT %1 /V
	if not exist %1\ZURICH.FNT goto diskfull
	echo Copying ready-made banner files ...
	copy BANNER.BRM %1 /V
	if not exist %1\BANNER.BRM goto diskfull
	echo ÿ
	echo All Done!
	echo ÿ
	echo To run BannerMania, type:
	echo ÿ
	echo ÿ       %1
:done
	echo ÿ       BANNER
	goto end
:diskfull
	echo ÿ
	echo ÿ
	echo Installation was NOT successful.
	echo The disk, %1 doesn't exist or is too
	echo full to hold BannerMania's files.
	echo ÿ
	echo Please free up at least 360K on %1 or
	echo install BannerMania on a different disk.
	echo ÿ
:end
	echo ÿ
:realend
