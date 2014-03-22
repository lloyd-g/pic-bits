#include <pic14\pic16f876.h>
#include <stdint.h> //Needed for uint16_t

// last one works and puts it in ASM file
static __code uint16_t __at (0x2007)  config  =  _HS_OSC & _PWRTE_ON & _BODEN_OFF & _WDT_OFF & _LVP_OFF;


void Intr(void) __interrupt 0 
{
  if(TXIF) { // serial interrupt
    // Most interrupts must be cleared in software:
    // TXIF = 0; // not doable :)
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
  
  TRISB = 0;
  while(1);
}