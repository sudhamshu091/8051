;Assembly Program Illustrating Logical Instructions (Byte Level)
;3 eight bit numbers X, NUM1 & NUM2 are stored in internal data RAM
;locations 20h, 21h & 22H respectively.
;Write an ALP to compute the following:
;IF X=0; THEN NUM1 (AND) NUM2,
;IF X=1; THEN NUM1 (OR) NUM2,
;IF X=2; THEN NUM1 (XOR) NUM2,
;ELSE RES =00,
;STORE RES AT 23H LOCATION

;1. Point to the data RAM register 20h and store the condition x.
;2. Point to 21h and 22h and move the first number to A register.
;3. Compare the contents of r1 and perform the operations accordingly.
;4. The result will be stored in 23H register.

      ORG 0000H
      SJMP 30H
      ORG 30H
      MOV A, 20h
      MOV R1, A
      MOV A, 21H
      CJNE R1,#0,CKOR
      ANL A, 22H
      SJMP END1
CKOR: CJNE R1,#01,CKXOR
      ORL A, 22H
      SJMP END1
CKXOR:CJNE R1,#02,OTHER
      XRL A, 22H
      SJMP END1
OTHER:CLR A
END1: MOV 23H, A
HERE: SJMP HERE
      END
