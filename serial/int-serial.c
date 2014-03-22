#include <pic14\pic16f876.h>
#include <stdint.h> //Needed for uint16_t

// last one works and puts it in ASM file
static __code uint16_t __at (0x2007)  config  =  _HS_OSC & _PWRTE_ON & _BODEN_OFF & _WDT_OFF & _LVP_OFF;


void Intr(void) __interrupt 0 
{
T0IF = 0; /* Clear timer interrupt flag */ 
PORTB = ~PORTB; /* toggals PORTB think its all bits */	
  if(TXIF) { // serial interrupt
    // Most interrupts must be cleared in software:
     TXIF = 0; // not doable :)
    TXREG = 'n';
    TXIE = 0;
  } 
}




// Main body
void main() {
  NOT_RBPU=0;
  
  // Configure UART serial transmit
  
  SPBRG = 25; // 16MHz => 9600 baud
  BRGH = 0;
  SYNC = 0;
  SPEN = 1;
  RCIE = 1;
  CREN = 1;
  
  GIE = 1;
  PEIE = 1;
  TRISC = 0;
  TRISB = 0;
 PORTC = 0x0f;

    T0CS = 0;               /* clear to enable timer mode */
    PSA = 0;                /* clear to assign prescaller to TMRO */

    TRISB &= 0x00;           /* PORTB.0-3 Output, */
    PORTB = 0x00;           /* PORTB.0-3 to zero, */

    PS2 = 1;                /* 001 @ 4Mhz = 1.024 mS 1:4 1khz */
    PS1 = 1;  
    PS0 = 1;  

    INTCON = 0;             /* clear interrupt flag bits */
    GIE = 1;                /* global interrupt enable */
    T0IE = 1;               /* TMR0 overflow interrupt enable */
      
    TMR0 = 0;               /* clear the value in TMR0 cout to overfollow */
  while(1);
}