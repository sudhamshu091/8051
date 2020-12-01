;Write an ALP to implement hex to decimal conversion

;1. Move the hex data to be converted to accumulator.
;2. Move 10 to B register and divide with A reg to convert to ASCII value
;3. Store the converted LSB value in r7
;4. Repeat the step 2 to obtain the converted MSB value
;5. Store the same in r6

      ORG 0000H
      SJMP 30h
      ORG 30h
      MOV DPTR,#9000H
      MOVX A,@DPTR
      MOV B,#10
      DIV AB
      INC DPTR
      XCH A,B
      MOVX @DPTR, A
      XCH A,B
      MOV B,#10
      DIV AB
      INC DPTR
      XCH A,B
      MOVX @DPTR, A
      XCH A,B
      INC DPTR
      MOVX @DPTR, A
 HERE:SJMP HERE
      END
