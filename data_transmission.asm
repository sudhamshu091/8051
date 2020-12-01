;Write a program illustrating serial ASCII data transmission (data-SUDHAMSHU). Conduct an experiment to configure 8051 microcontroller to
;transmit characters (SUDHAMSHU) to a PC using the serial port and display on
;the serial window.

;1. Initialize timer 1 to operate in mode 2 by loading TMOD register.
;2. load TH1 with -3 to obtain 9600 baud.
;3. Initialize the asynchronous serial communication transmission (SCON)
;   register.
;4. Start timer1 to generate the baud rate clock.
;5. Transmit the characters “SUDHAMSHU” by writing into the SBUF register and
;   waiting for the TI flag.


      ORG 0H
      SJMP 30H
      ORG 30H
      MOV R0,#05H
      MOV DPTR, #300H
      MOV TMOD,#20H
      MOV TH1, #-3        ; -3=FD loaded into TH1 for 9600 baud, 11.0592MHz
      MOV SCON, #50H
      SETB TR1
AGAIN:CLR A
      MOVC A, @A+DPTR
      JZ BACK
      ACALL TRANS
      INC DPTR
      SJMP AGAIN
 BACK:SJMP BACK
TRANS:MOV SBUF, A
 HERE:JNB TI, HERE
      CLR TI
      RET
MYDATA:ORG 300H
      DB “SUDHAMSHU”,0
      END
