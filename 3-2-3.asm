DSEG	SEGMENT
C1		DD	12345678H, 'MN'
C2		DD	80000000H, -1
C3		DD	36.625, -36.625
C4		DD	C1, 3 DUP (?)
DSEG	ENDS
		END