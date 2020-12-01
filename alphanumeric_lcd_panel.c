#include<reg51xd2.h>
//Function prototype declaration
void lcdcmd (unsigned char value);
void msdelay (unsigned int itime);
void lcddata (unsigned char value);
unsigned int i;
sfr ldata=0XA0; //0xA0 is address of Port 2
sbit rs = P3^7; //rs -> Register Select, 0 – Command Register: 1-Data
Register
sbit rw = P3^6; //rw -> Read / Write, 0 – Write : 1- Read
sbit en = P3^5; //en -> Enable
void main()
{
lcdcmd(0x38); //Defines character matrix i.e 7x5
msdelay(250); //Delay is introduced as LCD need time to respond
lcdcmd(0x0E); //Display on cursor blinking
msdelay(250);
lcdcmd(0x01); //Clear display
msdelay(250);
lcdcmd(0x06); //Increment cursor
msdelay(250);
lcdcmd(0x86);
msdelay(250);
lcddata('E');
msdelay(250);
lcddata('N');
msdelay(250);
lcddata('C');
}
void lcdcmd(unsigned char value)
{
ldata=value; //Information bits are copied to Port 2
rs=0; //Selecting Command register
rw=0; //Opted for Write operation
en=1;
msdelay(1);
en=0;
return;
}
void lcddata(unsigned char value)
{
ldata=value;
rs=1; //Selecting Data Register
rw=0;
en=1;
msdelay(1);
en=0;
return;
}
void msdelay(unsigned int itime)
{
unsigned int i,j;
for(i=0;i<itime;i++)
for(j=0;j<1275;j++);
}
