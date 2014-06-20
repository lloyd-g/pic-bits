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


// Until SDCC supports strings again the message will be far more terse.
static const char str[]={'d', 'a', 't', 'a', '=', '\0'};

int putchar(char ch){
    TXREG=ch;
    while(!TXIF);   // Wait while the output buffer is full
    }

void main(void)
{
	static unsigned char i;
	static char tx;
	TRISB = 0X00;
	PORTB = 0X00;
	TRISC|=TX_BIT|RX_BIT;	// These need to be 1 for USART to work
	SPBRG=SPBRG_VALUE;	// Baud Rate register, calculated by macro
	BRGH=BAUD_HI;

	SYNC=0;			// Disable Synchronous/Enable Asynchronous
	SPEN=1;			// Enable serial port
	TXEN=1;			// Enable transmission mode
  TRISA=0x0C;        //set AN2 (RAx) and AN3 (RAx) to inputs
	
	while(1) // repeat over and over
	{				
		PORTB = 0X01; // message flag on
		for(i=0; str[i] != '\0'; i++)
		{
			PORTB = 0X03;  // char flag on
			putchar(str[i]);	// Add a character to the output buffer    
 
			PORTB = 0X01;  // char flag off
		}
      
		// read AN2
		ADCON1=0b00100010; //adc initonce
		TMR2=0x00;         //clear timer2 output
		T2CON=0x04;        //start timer2
 
		ADCON0=0b11010101; //begin AD conversion on AN2
		while(ADCON0<2>=1); //wait until ADCON0<1> flips to 0
      
		//sending  AN2 8bit value as 3 digits			     
		tx=(ADRESH/100)+48;	// Add a character to the output buffer 
		putchar(tx);
 
		tx=(ADRESH%10)+0x30; // Add a character to the output buffer     
		putchar(tx);
 
		putchar('\n');
		T2CON=0x00;        //end timer
		PORTB = 0X00; // message flag on   
	} 
	
}