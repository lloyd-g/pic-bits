#include <pic14\pic16f876.h>
#include <stdint.h> //Needed for uint16_t

//#pragma config CP0=OFF,OSCS=ON,OSC=LP,BOR=ON,BORV=25,WDT=ON,WDTPS=128,CCP2MUX=ON
//#pragma config STVR=ON
// Configurations
//    typedef unsigned int  config;
//    config at 0x2007 __CONFIG = _HS_OSC & _PWRTE_ON & _BODEN_OFF & _WDT_OFF & _LVP_OFF;
// unsigned int config at 0x2007 __CONFIG = _HS_OSC & _PWRTE_ON & _BODEN_OFF & _WDT_OFF & _LVP_OFF;
// last one works and puts it in ASM file
static __code uint16_t __at (0x2007)  config  =  _HS_OSC & _PWRTE_ON & _BODEN_OFF & _WDT_OFF & _LVP_OFF;

unsigned int delayCount = 0;
// Main body
void main() {

    // Initializing ports
    PORTA = 0;
    PORTB = 0;

    // Set RA4 as input and RB0 as output
    TRISA |= 0x10;
    TRISB &= 0x00;

    // Set value 0x01 to PORTB
    PORTB = 0x01;

    // If button is pressed, toggle PORTB
    while(1) {
      while ( delayCount < 4000 ) // Delay Loop
		{
			delayCount++;
		}
        //if(RA4 != 0)
            PORTB = ~PORTB;
            delayCount = 0; // reset counter
 
    }
}
