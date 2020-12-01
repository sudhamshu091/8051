;Write an ALP to implement (display) an eight bit up/down BCD
;counters on watch window.
;Note: To run this program, after selecting DEBUG session in the main menu
;use
;View-> Watch& call Stack window, in the Watches select watch 1(or 2) and
;press F2 and enter a (for accumulator A)

;1. Move 00 to A register
;2. Call the delay subroutine for 1 second (in delay program move FFH to
;   registers R1, R2 and R3, loop and decrement until 0).
;3. Increment A register(add 99h for down counter)
;4. Decimal adjust accumulator for the BCD up/down counter.

      ORG 0000H
      SJMP 30H
      ORG 30H
      MOV a,#00
 BACK:ACALL DELAY
      ADD A,#99H
      DA A
      JNZ BACK
 HERE:SJMP HERE
DELAY:MOV R1,#35H
DERC1:MOV R2,#0FFH
 DECR:MOV R3, #0FFH
      DJNZ R3,$
      DJNZ R2, DECR
      DJNZ R1, DECR1
      RET
      END
