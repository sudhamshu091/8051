/*
Configure P0, P1 as output port and P3 as input port.
Let initially the motor rotate with half speed count 7fh.
If “INR” button is pressed reduce the count because the speed is inversely proportional to count.
If “DEC” button is pressed increase the count.
*/

#include <REG51xD2.H>
sbit inr= P3^2; //speed increment switch
sbit dcr= P3^3; //speed decrement switch
main()
{
unsigned char i=0x80;
P0 = 0x7f; /*Run the motor at half speed.*/
while (1)
{
if (!inr)
{
while (!inr);
if(i>10)
i=i-10; //increase the DC motor speed
}
if(!dcr)
{
while(!dcr);
if(i<0xf0)
i=i+10; //decrease the DC motor speed
}
P0=i;
}
}
