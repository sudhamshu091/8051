;Write an ALP to implement decimal to hex conversion.

;1. Move the decimal data to be converted from external memory 40h to
;   accumulator.
;2. AND A reg with 0f0h and obtain the upper MSB of the decimal digit and
;   swap the LSB and MSB of accumulator to bring the same to units place.
;3. Move 0ah to B register and multiply with A reg to convert to hex value,
;   store the converted tens value in r1
;4. Get the LSB of the decimal number and add to the converted tens value
;5. Point to the next memory location and store the result (hexadecimal).

      ORG 0000H
      SJMP 30H
      ORG 30H
      MOV DPTR,#40H
      MOVX A, @DPTR
      ANL A, #0F0H
      SWAP A
      MOV B,#0AH
      MUL AB
      MOV R1,a
      MOVX A,@DPTR
      ANL A,#0FH
      ADD A,R1
      INC DPTR
      MOVX @DPTR,A
 HERE:SJMP HERE
      END
