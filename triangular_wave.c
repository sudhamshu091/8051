;Output the initial value 00 through P0.
;Increment it in steps of 1 until a count value of FFh (5V) is reached.
;Every time repeat step 1.
;Decrement it in steps of 1 until a zero value is reached and repeat step 1.
 
#include <REG51xD2.H>
main()
{
unsigned char i=0,slope=1;
 P0 = 0x00; /* P0 as Output port */
while(1)
{
for(i=0;i<0xfe;) /* Generate ON pulse */
{
P1 = i;
P0 = i;
i=i+slope;
}
for(i=0xfe;i>0x00;) /* Generate OFF pulse */
{
P0 = i;
P1 = i;
i=i-slope;
}
 }
}
