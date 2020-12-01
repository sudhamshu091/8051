;Write an ALP to implement (display) an eight bit up/down BCD
;counters by using timer delay.

;1. Set up timer0 in mode 2 operation
;2. Load TH1 with 118 to generate an interrupt every 0.05msec.
;3. Reset registers a, r1 & r0.
;4. Repeat step 4 continuously
;5. On interrupt; ISR at 000B location goes to step 6
;6. Disable timer0
;7. Update r1 & r0
;8. Check if 20000 interrupts (=1 sec) over. Yes –increment accumulator a.
;9. Enable timer & return from ISR.

      ORG 0H
      SJMP 30H
      ORG 0BH
      SJMP ISR
      ORG 30H
      MOV A, #00
      MOV R0,#00
      MOV R1,#00
      MOV TMOD, #02H
      MOV TH0, #118
      MOV IE, #82H
      SETB TCON.4
 HERE:SJMP HERE
  ISR:CLR TCON.4
      INC R1
      CJNE R1,#100,SKIP
      MOV R1,#00
      INC R0
      CJNE R0,#200,SKIP
      MOV R0,#00H
      INC A
 SKIP:SETB TCON.4
      RETI
      END
