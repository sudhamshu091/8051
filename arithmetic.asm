;Write an ALP to perform the following:
;If x = 0-perform w + v;
;Else if x = 1-perform w - v;
;Else if x = 2-perform w * v;
;Else if x = 3-perform w / v, where w & v are eight bit numbers.

;1. Store the condition x in R1.
;2. Load the first and second numbers to A and B registers respectively
;3. Compare the contents of R1 and perform the operations add, sub, etc
;      accordingly.
;4. Store the result present in A and B registers to the appropriate memory
;      locations.
 
      ORG 0H
      SJMP 30H
      ORG 30H
      MOV R0, #40H
      MOVX A,@R0
      MOV R1, A
      INC R0
      MOVX A,@R0
      MOV B, A
      INC R0
      MOVX A,@R0
      CJNE R1,#00,CKSUB
      ADD A,B
      MOV B,#00
      JNC SKIP
      MOV B,#01H
SKIP: SJMP LAST
CKSUB:CJNE R1,#01,CKMUL
      CLR C
      SUBB A,B
      MOV B,#00
      JNC SKIP1
      MOV B,#0FFH
SKIP1:SJMP LAST
CKMUL:CJNE R1,#02,CKDIV
      MUL AB
      SJMP LAST
CKDIV:CJNE R1,#03,OTHER
      DIV AB
      SJMP LAST
OTHER:MOV A,#00
      MOV B,#00
LAST: INC R0
      MOVX @R0,A
      INC R0
      MOV A,B
      MOVX @R0,A
HERE: SJMP HERE
      END
