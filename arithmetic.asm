;Write an ALP to perform the following:
;If x = 0-perform w + v;
;Else if x = 1-perform w - v;
;Else if x = 2-perform w * v;
;Else if x = 3-perform w / v, where w & v are eight bit numbers.
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
