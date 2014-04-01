#include <pic16/pic18f26k20.h>

//#pragma config WDT = OFF

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
  TRISC = 0;

  while (1)
    {
      /* Reset the LEDs */
      PORTC = 0;

      /* Delay so human eye can see change */
      delay ();

      /* Light the LEDs */
      PORTC = 0x5A;

      /* Delay so human eye can see change */
      delay ();
    }
}
