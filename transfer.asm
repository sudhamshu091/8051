//transfer n = 5 bits of data from location 8040h to 8050h
      ORG 0H
      SJMP 30H
      ORG 30H
      MOV DPH,#80H //higher byte address stored at DPH
      MOV R0,#40H  //8040H
      MOV R1,#50H  //8050H
      MOV R3,#05H  //n = 5
BACK: MOV DPL,R0   //DPTR stores source address
      MOVX A,@DPTR //Read content at source
      MOV DPL,R1   //DPTR updated, destination address
      MOVX @DPTR,A //Write data at destination
      INC R1
      INC R0
      DJNZ R3,BACK //Decrement R3 and jump back if non zero met
HERE: SJMP HERE    //Infinite loop
      END
