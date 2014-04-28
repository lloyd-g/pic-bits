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
          CCPR1L = 0b00000000 ;
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
          CCPR1L = 0b00000000 ;
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
           CCPR1L = 0b01001101 ;

          while ( delayCount < DIT ) // Delay Loop
                    {
                    delayCount++;
                    }
          delayCount = 0; // reset counter
          // port off
          PORTB = 0x00;
          CCPR1L = 0b00000000 ;

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
          CCPR1L = 0b01001101 ;

          while ( delayCount < DA ) // Delay Loop
                    {
                    delayCount++;
                    }
          delayCount = 0; // reset counter
          // port off
          PORTB = 0x00;
          CCPR1L = 0b00000000 ;

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
    PORTC = 0;


    // Set RB0 as output
    
    TRISB = 0x00;
    TRISB = 0x00;

 /*
 
   * PWM registers configuration
   * Fosc = 8000000 Hz	
   * Fpwm = 801.28 Hz (Requested : 800 Hz)
   * Duty Cycle = 50 %
   * Resolution is 10 bits
   * Prescaler is 16
   * Ensure that your PWM pin is configured as digital output
   * see more details on http://www.micro-examples.com/
   * this source code is provided 'as is',
   * use it at your own risks
 
   */
 
  PR2 = 0b10011011 ; 
  T2CON = 0b00000111 ; 
CCPR1L = 0b01001101 ;
  CCP1CON = 0b00111100 ;
  PORTB = 0x01; 
  PORTC = 0x00; 
 
// keep repeating
    while(1) {
    space();
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

