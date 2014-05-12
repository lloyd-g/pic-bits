/** C O N F I G U R A T I O N B I T S ******************************/
// looks like start up with internal oscilator 16Mhz 1 MHz (Default after Reset)?

// CONFIG1H

#pragma config FOSC = INTIO67   // Oscillator Selection bits (Internal oscillator block, port function on RA6 and RA7)

#pragma config FCMEN = OFF      // Fail-Safe Clock Monitor Enable bit (Fail-Safe Clock Monitor disabled)

#pragma config IESO = OFF       // Internal/External Oscillator Switchover bit (Oscillator Switchover mode disabled)

// CONFIG2L

#pragma config PWRT = OFF       // Power-up Timer Enable bit (PWRT disabled)

#pragma config BOREN = SBORDIS  // Brown-out Reset Enable bits (Brown-out Reset enabled in hardware only (SBOREN is disabled))

#pragma config BORV = 30        // Brown Out Reset Voltage bits (VBOR set to 3.0 V nominal)

// CONFIG2H

#pragma config WDTEN = OFF      // Watchdog Timer Enable bit (WDT is controlled by SWDTEN bit of the WDTCON register)

#pragma config WDTPS = 32768    // Watchdog Timer Postscale Select bits (1:32768)

// CONFIG3H

#pragma config CCP2MX = PORTC   // CCP2 MUX bit (CCP2 input/output is multiplexed with RC1)

#pragma config PBADEN = ON      // PORTB A/D Enable bit (PORTB<4:0> pins are configured as analog input channels on Reset)

#pragma config LPT1OSC = OFF    // Low-Power Timer1 Oscillator Enable bit  (Timer1 configured for higher power operation)

#pragma config HFOFST = ON      // HFINTOSC Fast Start-up (HFINTOSC starts clocking the CPU without waiting for the oscillator to stablize.)

#pragma config MCLRE = OFF      // MCLR Pin Enable bit (RE3 input pin enabled; MCLR disabled)

// CONFIG4L

#pragma config STVREN = ON      // Stack Full/Underflow Reset Enable bit (Stack full/underflow will cause Reset)

#pragma config LVP = OFF        // Single-Supply ICSP Enable bit (Single-Supply ICSP disabled)

#pragma config XINST = OFF      // Extended Instruction Set Enable bit (Instruction set extension and Indexed Addressing mode disabled (Legacy mode))

// CONFIG5L

#pragma config CP0 = OFF        // Code Protection Block 0 (Block 0 (000800-001FFFh) not code-protected)

#pragma config CP1 = OFF        // Code Protection Block 1 (Block 1 (002000-003FFFh) not code-protected)

#pragma config CP2 = OFF        // Code Protection Block 2 (Block 2 (004000-005FFFh) not code-protected)

#pragma config CP3 = OFF        // Code Protection Block 3 (Block 3 (006000-007FFFh) not code-protected)

// CONFIG5H

#pragma config CPB = OFF        // Boot Block Code Protection bit (Boot block (000000-0007FFh) not code-protected)

#pragma config CPD = OFF        // Data EEPROM Code Protection bit (Data EEPROM not code-protected)

// CONFIG6L

#pragma config WRT0 = OFF       // Write Protection Block 0 (Block 0 (000800-001FFFh) not write-protected)

#pragma config WRT1 = OFF       // Write Protection Block 1 (Block 1 (002000-003FFFh) not write-protected)

#pragma config WRT2 = OFF       // Write Protection Block 2 (Block 2 (004000-005FFFh) not write-protected)

#pragma config WRT3 = OFF       // Write Protection Block 3 (Block 3 (006000-007FFFh) not write-protected)

// CONFIG6H

#pragma config WRTC = OFF       // Configuration Register Write Protection bit (Configuration registers (300000-3000FFh) not write-protected)

#pragma config WRTB = OFF       // Boot Block Write Protection bit (Boot Block (000000-0007FFh) not write-protected)

#pragma config WRTD = OFF       // Data EEPROM Write Protection bit (Data EEPROM not write-protected)

// CONFIG7L

#pragma config EBTR0 = OFF      // Table Read Protection Block 0 (Block 0(000800-001FFFh) not protected from table reads executed in other blocks)

#pragma config EBTR1 = OFF      // Table Read Protection Block 1 (Block 1 (002000-003FFFh) not protected from table reads executed in other blocks)

#pragma config EBTR2 = OFF      // Table Read Protection Block 2 (Block 2 (004000-005FFFh) not protected from table reads executed in other blocks)

#pragma config EBTR3 = OFF      // Table Read Protection Block 3 (Block 3 (006000-007FFFh) not protected from table reads executed in other blocks)

// CONFIG7H

#pragma config EBTRB = OFF      // Boot Block Table Read Protection bit (Boot Block (000000-0007FFh) not protected from table reads executed in other blocks)


/** I N C L U D E S **************************************************/
#include <pic18fregs.h>

#include <pic16/pic18f26k20.h>

//#include <pic16/delays.h>

/** V A R I A B L E S *************************************************/
#pragma udata // declare statically allocated uninitialized variables
unsigned char LED_Number; // 8-bit variable

/** D E C L A R A T I O N S *******************************************/
// declare constant data in program memory starting at address 0x180
#pragma romdata Data_Table = 0x180
const rom unsigned char LED_LookupTable[8] = {0x01, 0x02, 0x04, 0x08,
0x10, 0x20, 0x40, 0x80};
#pragma code // declare executable instructions
void delay (void)
{
  int i;

  for (i = 0; i < 10000; i++)
    ;
}



void main (void)
 {
  LED_Number = 0; // initialize
  TRISC = 0b00000000; // PORTC bits 7:0 are all outputs (0)
  while (1)
   {
      // use lookup table to output one LED on based on LED_Number value
      LATC = LED_LookupTable[LED_Number];
      LED_Number++; // rotate display by 1
      if (LED_Number == 8)
      LED_Number = 0; // go back to LED 0.
      /* Delay so human eye can see change */
      delay ();

   }
 }

