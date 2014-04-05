#include <pic18fregs.h>

#include <pic16/pic18f26k20.h>

//#pragma from sddc manual? 
// DS41303G-page 300 
#pragma config  FOSC = INTIO7, BOREN = OFF, WDTEN = OFF, MCLRE = OFF, STVREN = ON
#pragma config  LVP = OFF, CP0 = OFF
 

void delay (void)
{
  int i;

  for (i = 0; i < 10000; i++)
    ;
}

void main (void)
{
  /* Make all bits on the Port B (LEDs) output bits.
   * If bit is cleared, then the bit is an output bit.
   */
  TRISB = 0;

  while (1)
    {
      /* Reset the LEDs */
      PORTB = 0;

      /* Delay so human eye can see change */
      delay ();

      /* Light the LEDs */
      PORTB = 0x5A;

      /* Delay so human eye can see change */
      delay ();
    }
}
