#include <REG51xD2.H>
sbit Amp = P3^3; /* Port line to change amplitude */
sbit Fre = P3^2; /* Port line to change frequency */
void delay (unsigned int x) /* delay routine */
{
for (;x>0;x--);
}
57
main()
{
unsigned char on = 0x7f,off=0x00;
unsigned int fre = 100;
while(1)
{
if(!Amp) /* if user choice is to change amplitude */
{
while(!Amp); /* wait for key release */
on+=0x08; /* Increase the amplitude */
 }
if(!Fre) /* if user choice is to change frequency */
{
if(fre > 1000) /* if frequency exceeds 1000 reset to default */
fre = 100;
while(!Fre); /* wait for key release */
fre += 50;
} /* Increase the frequency */
 P0=on; /* write amplitude to port */
P1=on;
delay(fre);
P0 = off; /* clear port */
P1 = off;
delay(fre);
}
}
