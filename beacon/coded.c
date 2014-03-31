#include <pic14\pic16f876.h>
#include <stdint.h> //Needed for uint16_t

// Configurations
static __code uint16_t __at (0x2007)  config  =  _HS_OSC & _PWRTE_ON & _BODEN_OFF & _WDT_OFF & _LVP_OFF;

unsigned int delayCount = 0;
// Main body
void main() {

    // Initializing ports
    
    PORTB = 0;

    // Set RB0 as output
    
    TRISB = 0x00;

    // Set value 0x01 to PORTB
    PORTB = 0x01;

    while(1) {
    // delay while on
       while ( delayCount < 4000 ) // Delay Loop
          {
           delayCount++;
          }
          delayCount = 0; // reset counter 
     // port off     
     PORTB = 0x00;
            
// delay while off
       while ( delayCount < 4000 ) // Delay Loop
          {
           delayCount++;
          }
          delayCount = 0; // reset counter 
     // port off     
     PORTB = 0x01;
 
    }
}