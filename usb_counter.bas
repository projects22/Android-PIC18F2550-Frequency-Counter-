!Frequency Counter using USB keyboard 

!GR.OPEN 255, 255, 255, 255, 1	%white
GR.OPEN 255, 0, 0, 0, 1		%black
GR.ORIENTATION 0	%landscape
GR.SCREEN w,h

start=0
start2=0
DO
INKEY$ k$
IF k$<>"f"
IF k$="z" THEN k$="0"
IF k$="b" THEN start=1
IF k$<>"@" & start THEN	
IF k$<>"c" & k$<>"b" THEN freq$=freq$+k$
	IF k$="c"
	start=0
	END IF

END IF

IF k$="d" THEN start2=1
IF k$<>"@" & start2 THEN	
IF k$<>"e" & k$<>"d" THEN volt$=volt$+k$
	IF k$="e"
	voltage$ = FORMAT$("###%.###", VAL(volt$)*5 / 1024)
	start2=0

	GR.HIDE V
	 GR.HIDE F
	 GR.RENDER
	!GR.COLOR 255, 0, 0, 255, 1		%blue
	GR.COLOR 255, 255, 255, 255, 1
	GR.TEXT.SIZE h/4 
	GR.TEXT.BOLD 1
	GR.TEXT.DRAW F, w/16, h*0.35, freq$ + " Hz"

	!GR.COLOR 255, 255, 0, 0, 1		%red
	GR.TEXT.DRAW V, w/16, h*0.75, voltage$ + " V"
	 GR.RENDER
	 
	 freq$=""
	 volt$=""
	 
	END IF
	
END IF
END IF
!PAUSE 10
UNTIL 0

END