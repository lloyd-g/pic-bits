#include <pic14\pic16f876.h>
#include <stdint.h> //Needed for uint16_t

// last one works and puts it in ASM file
static __code uint16_t __at (0x2007)  config  =  _HS_OSC & _PWRTE_ON & _BODEN_OFF & _WDT_OFF & _LVP_OFF;


// intrupt 
void Intr(void) __interrupt 0 
 { 
T0IF = 0; /* Clear timer interrupt flag */ 
PORTA = PORTA + 1; // count will role over but should show as contiuouse?
}

// Main body
void main(void) {

    T0CS = 0;               /* clear to enable timer mode */
    PSA = 0;                /* clear to assign prescaller to TMRO */

    TRISA &= 0x00;           /* PORTA.0-5 Output, */
    PORTA = 0x00;           /* PORTA.0-5 to zero, */

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
 
 } 
}