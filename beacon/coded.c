#include <pic14\pic16f876.h>
#include <stdint.h> //Needed for uint16_t
#define DIT 2000
#define DA  6000
#define GAP 6000
#define SP  14000
// Configurations
static __code uint16_t __at (0x2007)  config  =  _HS_OSC & _PWRTE_ON & _BODEN_OFF & _WDT_OFF & _LVP_OFF;

unsigned int delayCount = 0;
void gap()
     {
          // port off
          PORTB = 0x00;
          while ( delayCount < GAP ) // Delay Loop
                    {
                    delayCount++;
                    }
          delayCount = 0; // reset counter
          
          }
void space()
     {
          // port off
          PORTB = 0x00;
          while ( delayCount < SP ) // Delay Loop
                    {
                    delayCount++;
                    }
          delayCount = 0; // reset counter
          
          }


void dit()
     {
          // port on
          PORTB = 0x01;
          while ( delayCount < DIT ) // Delay Loop
                    {
                    delayCount++;
                    }
          delayCount = 0; // reset counter
          // port off
          PORTB = 0x00;

          // delay while off
          while ( delayCount < DIT ) // Delay Loop
                    {
                    delayCount++;
                    }
          delayCount = 0; // reset counter
          
          
     }
void da()
     {
          // port on
          PORTB = 0x01;
          while ( delayCount < DA ) // Delay Loop
                    {
                    delayCount++;
                    }
          delayCount = 0; // reset counter
          // port off
          PORTB = 0x00;

          // delay while off
          while ( delayCount < DA ) // Delay Loop
                    {
                    delayCount++;
                    }
          delayCount = 0; // reset counter
          
          
     }

/* hello world in morse is 
H ....
E .
L .-..
L .-..
O ---

W .--
O ---
R .-.
L .-..
D -..
*/
// Main body
void main() {

    // Initializing ports
    
    PORTB = 0;

    // Set RB0 as output
    
    TRISB = 0x00;

    // Set value 0x00 to PORTB
    PORTB = 0x00;
// keep repeating
    while(1) {
     dit();
     dit();
     dit();
     dit();
     gap(); //H
     dit();
     gap(); //E
     dit();
     da();
     dit();
     dit();
     gap(); //L
     dit();
     da();
     dit();
     dit();
     gap(); //L
     da();
     da();
     da();
     gap(); //O
     space();
     dit();
     da();
     da();
     gap(); //W
     da();
     da();
     da();
     gap(); //O
     dit();
     da();
     dit();
     gap(); //R
     dit();
     da();
     dit();
     dit();
     gap(); //L
     da();
     dit();
     dit();
     gap(); //D
     space();
     space();
     space();
     

    }
}

