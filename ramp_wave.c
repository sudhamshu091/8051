#include <REG51xD2.H>
main ()
{
Unsigned char i=0,slope=1,rising=1;
P0 = 0x00; /* P0 as Output port */
while (1)
{
If(rising==1)
{
for(i=0;i<0xfe;) /* Generate ON pulse */
{
P1 = i;
P0 = i;
i=i+slope;
}
}
else
{
for(i=0xfe;i>0x00;) /* Generate OFF pulse */
{
P0 = i;
P1 = i;
i=i-slope;
}
 }
}
 }
