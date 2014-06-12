#include <pic14\pic16f876.h>
#include <stdint.h> //Needed for uint16_t

// last one works and puts it in ASM file
static __code uint16_t __at (0x2007)  config  = _XT_OSC & _PWRTE_ON & _BODEN_ON & _CP_OFF & _LVP_OFF & _WDT_OFF;


// If KHZ is not specified by the makefile, assume it to be 4 MHZ
#ifndef KHZ
#define KHZ	4000
#endif

// These are fixed.  The 16f876 can only use these as transmit and recieve.
#define TX_PORT	6
#define RX_PORT	7
#define TX_BIT	(1<<TX_PORT)
#define RX_BIT	(1<<RX_PORT)


// Twiddle these as you like BUT remember that not all values work right!
// See the datasheet for what values can work with what clock frequencies.
#define	BAUD	9600
#define BAUD_HI	1

// This section calculate!s the proper value for SPBRG from the given
// values of BAUD and BAUD_HI.  Derived from Microchip's datasheet.
#if	(BAUD_HI == 1)
#define	BAUD_FACTOR	(16L*BAUD)
#else
#define	BAUD_FACTOR	(64L*BAUD)
#endif
#define SPBRG_VALUE	(unsigned char)(((KHZ*1000L)-BAUD_FACTOR)/BAUD_FACTOR)

void main(void)
{
	static unsigned char i;

	TRISB=TX_BIT|RX_BIT;	// These need to be 1 for USART to work

	SPBRG=SPBRG_VALUE;	// Baud Rate register, calculated by macro
	BRGH=BAUD_HI;

	SYNC=0;			// Disable Synchronous/Enable Asynchronous
	SPEN=1;			// Enable serial port
	TXEN=1;			// Enable transmission mode
	CREN=1;			// Enable reception mode

	while(1)
	{
		while(!RCIF);	// Wait until data recieved
		i=RCREG;	// Store for later

		while(!TRMT);	// Wait until we're free to transmit
		TXREG=i;	// Transmit
	}
}
