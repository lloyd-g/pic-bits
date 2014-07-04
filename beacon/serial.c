#include <pic14\pic16f876.h>
#include <stdint.h> //Needed for uint16_t
#define SP  14000
// Configurations
static __code uint16_t __at (0x2007)  config  =  _HS_OSC & _PWRTE_ON & _BODEN_OFF & _WDT_OFF & _LVP_OFF;

unsigned int delayCount = 0;
void space()
     {
          // port off
          PORTB = 0x00;
          TRISC = 0x04;
          while ( delayCount < SP ) // Delay Loop
                    {
                    delayCount++;
                    }
          delayCount = 0; // reset counter
          
          }


void mark()
     {
          // port on
          PORTB = 0x01;
           TRISC = 0x00;

          while ( delayCount < SP ) // Delay Loop
                    {
                    delayCount++;
                    }
          delayCount = 0; // reset counter
         
          
     }



void main() {

    // Initializing ports
    
    PORTB = 0;
    PORTC = 0;


    // Set RB0 as output
    
    TRISB = 0x00;
    TRISC = 0x00;

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
  PORTC = 0x03;
 
// keep repeating
    while(1) {
 mark();
 space();
     

    }
}


