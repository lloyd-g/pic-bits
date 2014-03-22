;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.3.0 #8604 (May 11 2013) (MINGW32)
; This file was generated Sat Mar 22 09:20:04 2014
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"int-test.c"
	list	p=16f876
	radix dec
	include "p16f876.inc"
;--------------------------------------------------------
; config word(s)
;--------------------------------------------------------
	__config 0x3f32
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_STATUSbits
	extern	_PORTAbits
	extern	_PORTBbits
	extern	_PORTCbits
	extern	_INTCONbits
	extern	_PIR1bits
	extern	_PIR2bits
	extern	_T1CONbits
	extern	_T2CONbits
	extern	_SSPCONbits
	extern	_CCP1CONbits
	extern	_RCSTAbits
	extern	_CCP2CONbits
	extern	_ADCON0bits
	extern	_OPTION_REGbits
	extern	_TRISAbits
	extern	_TRISBbits
	extern	_TRISCbits
	extern	_PIE1bits
	extern	_PIE2bits
	extern	_PCONbits
	extern	_SSPCON2bits
	extern	_SSPSTATbits
	extern	_TXSTAbits
	extern	_ADCON1bits
	extern	_EECON1bits
	extern	_INDF
	extern	_TMR0
	extern	_PCL
	extern	_STATUS
	extern	_FSR
	extern	_PORTA
	extern	_PORTB
	extern	_PORTC
	extern	_PCLATH
	extern	_INTCON
	extern	_PIR1
	extern	_PIR2
	extern	_TMR1
	extern	_TMR1L
	extern	_TMR1H
	extern	_T1CON
	extern	_TMR2
	extern	_T2CON
	extern	_SSPBUF
	extern	_SSPCON
	extern	_CCPR1
	extern	_CCPR1L
	extern	_CCPR1H
	extern	_CCP1CON
	extern	_RCSTA
	extern	_TXREG
	extern	_RCREG
	extern	_CCPR2
	extern	_CCPR2L
	extern	_CCPR2H
	extern	_CCP2CON
	extern	_ADRESH
	extern	_ADCON0
	extern	_OPTION_REG
	extern	_TRISA
	extern	_TRISB
	extern	_TRISC
	extern	_PIE1
	extern	_PIE2
	extern	_PCON
	extern	_SSPCON2
	extern	_PR2
	extern	_SSPADD
	extern	_SSPSTAT
	extern	_TXSTA
	extern	_SPBRG
	extern	_ADRESL
	extern	_ADCON1
	extern	_EEDATA
	extern	_EEADR
	extern	_EEDATH
	extern	_EEADRH
	extern	_EECON1
	extern	_EECON2
	extern	___sdcc_saved_fsr
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_Intr
	global	_main

	global PSAVE
	global SSAVE
	global WSAVE
	global STK12
	global STK11
	global STK10
	global STK09
	global STK08
	global STK07
	global STK06
	global STK05
	global STK04
	global STK03
	global STK02
	global STK01
	global STK00

sharebank udata_ovr 0x0070
PSAVE	res 1
SSAVE	res 1
WSAVE	res 1
STK12	res 1
STK11	res 1
STK10	res 1
STK09	res 1
STK08	res 1
STK07	res 1
STK06	res 1
STK05	res 1
STK04	res 1
STK03	res 1
STK02	res 1
STK01	res 1
STK00	res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	code 0x0000
	nop
	pagesel __sdcc_gsinit_startup
	goto	__sdcc_gsinit_startup
;--------------------------------------------------------
; interrupt and initialization code
;--------------------------------------------------------
c_interrupt	code	0x4
__sdcc_interrupt
;***
;  pBlock Stats: dbName = I
;***
;entry:  _Intr	;Function start
; 0 exit points
;; Starting pCode block
_Intr	;Function start
; 0 exit points
;	.line	7; "int-test.c"	void Intr(void) __interrupt 0 
	MOVWF	WSAVE
	SWAPF	STATUS,W
	CLRF	STATUS
	MOVWF	SSAVE
	MOVF	PCLATH,W
	CLRF	PCLATH
	MOVWF	PSAVE
	MOVF	FSR,W
	BANKSEL	___sdcc_saved_fsr
	MOVWF	___sdcc_saved_fsr
;	.line	9; "int-test.c"	T0IF = 0; /* Clear timer interrupt flag */ 
	BANKSEL	_INTCONbits
	BCF	_INTCONbits,2
;	.line	10; "int-test.c"	PORTB = ~PORTB; /* toggals PORTB think its all bits */
	COMF	_PORTB,W
	MOVWF	_PORTB
	BANKSEL	___sdcc_saved_fsr
	MOVF	___sdcc_saved_fsr,W
	BANKSEL	FSR
	MOVWF	FSR
	MOVF	PSAVE,W
	MOVWF	PCLATH
	CLRF	STATUS
	SWAPF	SSAVE,W
	MOVWF	STATUS
	SWAPF	WSAVE,F
	SWAPF	WSAVE,W
END_OF_INTERRUPT
	RETFIE	

;--------------------------------------------------------
; code
;--------------------------------------------------------
code_int_test	code
;***
;  pBlock Stats: dbName = M
;***
;entry:  _main	;Function start
; 2 exit points
;has an exit
;; Starting pCode block
_main	;Function start
; 2 exit points
;	.line	21; "int-test.c"	T0CS = 0;               /* clear to enable timer mode */
	BANKSEL	_OPTION_REGbits
	BCF	_OPTION_REGbits,5
;	.line	22; "int-test.c"	PSA = 0;                /* clear to assign prescaller to TMRO */
	BCF	_OPTION_REGbits,3
;	.line	24; "int-test.c"	TRISB &= 0x00;           /* PORTB.0-3 Output, */
	CLRF	_TRISB
;	.line	25; "int-test.c"	PORTB = 0x00;           /* PORTB.0-3 to zero, */
	BANKSEL	_PORTB
	CLRF	_PORTB
;	.line	27; "int-test.c"	PS2 = 1;                /* 001 @ 4Mhz = 1.024 mS 1:4 1khz */
	BANKSEL	_OPTION_REGbits
	BSF	_OPTION_REGbits,2
;	.line	28; "int-test.c"	PS1 = 1;  
	BSF	_OPTION_REGbits,1
;	.line	29; "int-test.c"	PS0 = 1;  
	BSF	_OPTION_REGbits,0
;	.line	31; "int-test.c"	INTCON = 0;             /* clear interrupt flag bits */
	BANKSEL	_INTCON
	CLRF	_INTCON
;	.line	32; "int-test.c"	GIE = 1;                /* global interrupt enable */
	BSF	_INTCONbits,7
;	.line	33; "int-test.c"	T0IE = 1;               /* TMR0 overflow interrupt enable */
	BSF	_INTCONbits,5
;	.line	35; "int-test.c"	TMR0 = 0;               /* clear the value in TMR0 cout to overfollow */
	CLRF	_TMR0
_00110_DS_
;	.line	36; "int-test.c"	while(1)
	GOTO	_00110_DS_
	RETURN	
; exit point of _main


;	code size estimation:
;	   35+    8 =    43 instructions (  102 byte)

	end
