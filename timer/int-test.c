#include <pic14\pic16f876.h>
#include <stdint.h> //Needed for uint16_t

// last one works and puts it in ASM file
static __code uint16_t __at (0x2007)  config  =  _HS_OSC & _PWRTE_ON & _BODEN_OFF & _WDT_OFF & _LVP_OFF;
// intrupt toggals PORTB
void Intr(void) __interrupt 0 
 { 
T0IF = 0; /* Clear timer interrupt flag */ 
PORTB = ~PORTB; /* toggals PORTB think its all bits is there a c way to do 1 pin? */
 }





// Main body
void main(void) {

    T0CS = 0;               /* clear to enable timer mode */
    PSA = 0;                /* clear to assign prescaller to TMRO */

    TRISB &= 0x00;           /* PORTB.0-3 Output, */
    PORTB = 0x00;           /* PORTB.0-3 to zero, */

    PS2 = 1;                /* 111 @ *Mhz = 33 mS 1:256 1khz */
    PS1 = 1;  
    PS0 = 1;  

    INTCON = 0;             /* clear interrupt flag bits */
    GIE = 1;                /* global interrupt enable */
    T0IE = 1;               /* TMR0 overflow interrupt enable */
      
    TMR0 = 0;               /* clear the value in TMR0 cout to overfollow */
while(1)
 { 
 /* Loop forever */
 /* We aren't doing anything in the main loop... we're just sittin' here like a jackass waiting for that TMR0 interrupt to occur. */ 
 } 
}
