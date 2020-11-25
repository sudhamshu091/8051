; Exchange n = 5 bytes of data from location 0028H to 0040H
      ORG 0H
      SJMP 30H
      ORG 30H
      MOV R0,#28H  ;0028H
      MOV R1,#40H  ;0040H
      MOV R3,05H   ;n = 5
BACK: MOV A,@R0    ;[0028H] --> A
      MOV R2,A     ;Store
      MOV A,@R1    ;[0040H] --> A
      MOV @R0,A
      MOV A,R2     ;exchange operation
      MOV @R1,A
      INC R0
      INC R1
      DJNZ R3,BACK ;Decrement R3 and jump to BACK if zero not met
HERE: SJMP HERE    ;Infinite loop
      END
