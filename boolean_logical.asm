;3 eight bit numbers X, NUM1 & NUM2 are stored in internal data
;RAM Locations 20h, 21h & 22H respectively.
;Write an ALP to compute the following:
;IF X=0; THEN LSB OF NUM1 (AND) LSB OF NUM2,
;IF X=1; THEN MSB OF NUM1 (OR) MSB OF NUM2,
;IF X=2; THEN COMPLEMENT MSB OF NUM1
;STORE THE BIT RESULT IN RES,
;WHERE RES IS MSB OF 23H LOCATIONS

;1. Move the condition X (from 20h location) into R0 register.
;2. If X=0; then move LSB bit of 21h to carry flag and ‘AND’ Carry flag with
    LSB bit of 22h. Go to step5
;3. If X=1; then move MSB bit of 21h to carry flag and ‘OR’ Carry flag with
;   MSB bit of 22h. Go to step5
;4. If X=0; then complement MSB bit of 21h and move it to carry flag. Go to
;   step5
;5. Store Carry flag at MSB bit of 23h location.

      ORG 0000H
      SJMP 30H
      ORG 30H
      MOV R0,20H
      CJNE R0,#0,CK1
      MOV C, 08H
      ANL C, 10H
      SJMP LAST
  CK1:CJNE R0, #1, CK2
      MOV C, 0FH
      ANL C, 17H
      SJMP LAST
  CK2:CJNE R0,#2,CK3
      CPL 0FH
      MOV C, 0FH
      SJMP LAST
  CK3:CLR C
 LAST:MOV 1FH, C
 HERE:SJMP HERE
      END
