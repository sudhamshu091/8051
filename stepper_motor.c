/*
Configure P0 as output.
Apply the initial excitation of 11 to motor coils through P0.
For clockwise motion -Rotate right once the excitation and repeat step 2.
For anticlockwise motion -Rotate left once the excitation and repeat step 2.
*/

#include <REG51xD2.H>
void delay (unsigned int x) /* Delay Routine */
{
for(;x>0;x--);
return;
}
Main ( )
{
unsigned char Val, i;
P0=0x00;
Val = 0x11;
for (i=0;i<4;i++)
{
P0 = Val;
Val = Val<<1; /* Val= Val>>1; for clockwise direction*/
delay (500);
}
}
S
