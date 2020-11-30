;Write an assembly language program to sort an array of n= 6
;bytes of data in Descending order stored from location 9000h. (Use bubble
;sort algorithm).

;1. Store the elements of the array from the address 9000h
;2. Initialize a pass counter with array size-1 count (for number of passes).
;3. Load compare counter with pass counter contents & initialize DPTR to
;   point to the start address of the array (here 9000h).
;4. Store the current and the next array elements pointed by DPTR in
;   registers B and r2 respectively.
;5. Subtract the next element from the current element.
;6. If the carry flag is set (for ascending order) then exchange the 2 numbers
;   in the array.
;7. Decrement the compare counter and repeat through step 4 until the
;   counter becomes 0.
;8. Decrement the pass counter and repeat through step 3 until the counter
;   becomes 0.

      ORG 0000H
      SJMP 30H
      ORG 30H
      MOV R0,#05
  L1: MOV DPTR,#9000h
      MOV A,R0
      MOV R1,A
  L2: MOVX A,@DPTR
      MOV B, A
      INC DPTR
      MOVX A, @DPTR
      CLR C
      MOV R2, A
      SUBB A, B
      JC NOEXCHG
      MOV A,B
      MOVX @DPTR,A
      DEC DPL
      MOV A,R2
      MOVX @DPTR,A
NOEXCHG:INC DPTR
      DJNZ R1,L2
      DJNZ R0,L1
HERE: SJMP HERE
      END
