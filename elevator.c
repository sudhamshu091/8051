/*
Read the floor request through input port P1.
If the current floor and requested floor are the same no change light up the corresponding LED through P0.
If the requested floor greater than current moving up of the lift is indicated by glowing of LED’s from current floor to the requested.
If the requested floor lesser than current moving down of the lift is indicated by glowing of LED’s from current floor to the requested.
*/

#include <REG51F.H>
void delay(unsigned int);
main()
{
unsigned char Flr[9] = {0xff,0x00,0x03,0xff,0x06,0xff,0xff,0xff,0x09};
unsigned char FClr[9] =
{0xff,0x0E0,0x0D3,0xff,0x0B6,0xff,0xff,0xff,0x79};
unsigned char ReqFlr,CurFlr = 0x01,i,j;
P0 = 0x00;
P0 = 0x0f0;
while(1)
{
P1 = 0x0f;
ReqFlr = P1 | 0x0f0;
while(ReqFlr == 0x0ff)
ReqFlr = P1 | 0x0f0; /* Read Request Floor from P1 */
ReqFlr = ~ReqFlr;
if(CurFlr == ReqFlr) /* If Request floor is equal to Current
Floor */
{
P0 = FClr[CurFlr]; /* Clear Floor Indicator */
continue;
} /* Go up to read again */
else if(CurFlr > ReqFlr) /* If Current floor is > request floor */
{
i = Flr[CurFlr] - Flr[ReqFlr]; /* Get the no of floors to
travel */
j = Flr[CurFlr];
for(;i>0;i--) /*Move the indicator down */
{
delay(25000);
}
}
else /* If Current floor is < request floor */
{
i = Flr[ReqFlr] - Flr[CurFlr]; /* Get the no of floors to travel */
j = Flr[CurFlr];
for(;i>0;i--) /* Move the indicator Up */
{
P0 = 0x0f0 | j;
j++;
delay(25000);
}
}
CurFlr = ReqFlr; /* Update Current floor */
P0 = FClr[CurFlr]; /* Clear the indicator */
}
}
void delay(unsigned int x)
{
for(;x>0;x--);
}
