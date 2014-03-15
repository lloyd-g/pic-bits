;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.3.0 #8604 (May 11 2013) (MINGW32)
; This file was generated Sat Mar 15 18:06:46 2014
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"simple.c"
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
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_main
	global	_delayCount

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
UDL_simple_0	udata
r0x1002	res	1
r0x1003	res	1
r0x1004	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

ID_simple_0	idata
_delayCount
	db	0x00, 0x00

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
; code
;--------------------------------------------------------
code_simple	code
;***
;  pBlock Stats: dbName = M
;***
;entry:  _main	;Function start
; 2 exit points
;has an exit
;4 compiler assigned registers:
;   r0x1002
;   r0x1003
;   r0x1004
;   r0x1005
;; Starting pCode block
_main	;Function start
; 2 exit points
;	.line	17; "simple.c"	PORTA = 0;
	BANKSEL	_PORTA
	CLRF	_PORTA
;	.line	18; "simple.c"	PORTB = 0;
	CLRF	_PORTB
;	.line	21; "simple.c"	TRISA |= 0x10;
	BANKSEL	_TRISA
	BSF	_TRISA,4
;	.line	22; "simple.c"	TRISB &= 0xF0;
	MOVLW	0xf0
	ANDWF	_TRISB,F
;	.line	25; "simple.c"	PORTB = 0x0A;
	MOVLW	0x0a
	BANKSEL	_PORTB
	MOVWF	_PORTB
_00105_DS_
;	.line	29; "simple.c"	while ( delayCount < 40000 ) // Delay Loop
	BANKSEL	_delayCount
	MOVF	_delayCount,W
	BANKSEL	r0x1002
	MOVWF	r0x1002
	BANKSEL	_delayCount
	MOVF	(_delayCount + 1),W
	BANKSEL	r0x1003
	MOVWF	r0x1003
	CLRF	r0x1004
;;1	CLRF	r0x1005
;;signed compare: left < lit(0x9C40=40000), size=4, mask=ffffffff
	MOVLW	0x00
	ADDLW	0x80
	ADDLW	0x80
	BTFSS	STATUS,2
	GOTO	_00119_DS_
	MOVLW	0x00
	SUBWF	r0x1004,W
	BTFSS	STATUS,2
	GOTO	_00119_DS_
	MOVLW	0x9c
	SUBWF	r0x1003,W
	BTFSS	STATUS,2
	GOTO	_00119_DS_
	MOVLW	0x40
	SUBWF	r0x1002,W
_00119_DS_
	BTFSC	STATUS,0
	GOTO	_00107_DS_
;;genSkipc:3247: created from rifx:02755F24
;	.line	31; "simple.c"	delayCount++;
	BANKSEL	_delayCount
	INCF	_delayCount,F
	BTFSC	STATUS,2
	INCF	(_delayCount + 1),F
	GOTO	_00105_DS_
_00107_DS_
;	.line	34; "simple.c"	PORTB = ~PORTB;
	BANKSEL	_PORTB
	COMF	_PORTB,W
	MOVWF	_PORTB
	GOTO	_00105_DS_
	RETURN	
; exit point of _main


;	code size estimation:
;	   37+    9 =    46 instructions (  110 byte)

	end
