;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.3.0 #8604 (May 11 2013) (MINGW32)
; This file was generated Sun Mar 23 12:14:31 2014
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
	.file	"int-serial.c"
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
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2760:genLabel *{*
;; ***	genLabel  2763
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2340:genFunction *{*
;; ***	genFunction  2342 curr label offset=0previous max_key=0 
_Intr	;Function start
; 0 exit points
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2407:genFunction
	.line	8; "int-serial.c"	void Intr(void) __interrupt 0 
	MOVWF	WSAVE
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2408:genFunction
	SWAPF	STATUS,W
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2413:genFunction
	CLRF	STATUS
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2414:genFunction
	MOVWF	SSAVE
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2416:genFunction
	MOVF	PCLATH,W
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2418:genFunction
	CLRF	PCLATH
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2419:genFunction
	MOVWF	PSAVE
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2421:genFunction
	MOVF	FSR,W
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2422:genFunction
	BANKSEL	___sdcc_saved_fsr
	MOVWF	___sdcc_saved_fsr
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6669:genPointerSet *{*
;; ***	genPointerSet  6670
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6488:genNearPointerSet *{*
;; ***	genNearPointerSet  6489
;;	613
;;	aopForRemat 392
;;	418: rname _INTCONbits, val 0, const = 0
;; ***	genNearPointerSet  6504
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_INTCONbits
;; 	line = 6506 result AOP_PCODE=_INTCONbits, size=2, left -=-, size=0, right AOP_LIT=0x00, size=1
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6232:genPackBits *{*
;; ***	genPackBits  6233
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_INTCONbits
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6258:genPackBits
	.line	10; "int-serial.c"	T0IF = 0; /* Clear timer interrupt flag */ 
	BANKSEL	_INTCONbits
	BCF	_INTCONbits,2
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:1609:genCpl *{*
;; ***	genCpl  1611
;; ***	aopForSym 315
;;	327 sym->rname = _PORTB, size = 1
;;	575
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:1631:genCpl
;;	1009
;;	1028  _PORTB   offset=0
	.line	11; "int-serial.c"	PORTB = ~PORTB; /* toggals PORTB think its all bits */	
	COMF	_PORTB,W
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:1632:genCpl
;;	1009
;;	1028  _PORTB   offset=0
	MOVWF	_PORTB
;; ***	addSign  861
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/genarith.c:862:addSign *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6145:genPointerGet *{*
;; ***	genPointerGet  6146
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:5927:genNearPointerGet *{*
;; ***	genNearPointerGet  5928
;;	613
;;	aopForRemat 392
;;	418: rname _PIR1bits, val 0, const = 0
;; ***	genNearPointerGet  5944
;;	694 register type nRegs=1
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:5743:genUnpackBits *{*
;; ***	genUnpackBits  5744
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PIR1bits
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:5766:genUnpackBits
	.line	12; "int-serial.c"	if(TXIF) { // serial interrupt
	BTFSS	_PIR1bits,4
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:5767:genUnpackBits
;; ***	popGetLabel  key=3, label offset 4
	GOTO	_00107_DS_
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6669:genPointerSet *{*
;; ***	genPointerSet  6670
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6488:genNearPointerSet *{*
;; ***	genNearPointerSet  6489
;;	613
;;	aopForRemat 392
;;	418: rname _PIR1bits, val 0, const = 0
;; ***	genNearPointerSet  6504
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PIR1bits
;; 	line = 6506 result AOP_PCODE=_PIR1bits, size=2, left -=-, size=0, right AOP_LIT=0x00, size=1
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6232:genPackBits *{*
;; ***	genPackBits  6233
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PIR1bits
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6258:genPackBits
	.line	14; "int-serial.c"	TXIF = 0; // not doable :)
	BCF	_PIR1bits,4
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6910:genAssign *{*
;; ***	genAssign  6911
;; ***	aopForSym 315
;;	327 sym->rname = _TXREG, size = 1
;; 	line = 6920 result AOP_DIR=_TXREG, size=1, left -=-, size=0, right AOP_LIT=0x6e, size=1
;; ***	genAssign  7006
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:7013:genAssign
	.line	15; "int-serial.c"	TXREG = 'n';
	MOVLW	0x6e
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:7015:genAssign
;;	1009
;;	1028  _TXREG   offset=0
	MOVWF	_TXREG
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6669:genPointerSet *{*
;; ***	genPointerSet  6670
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6488:genNearPointerSet *{*
;; ***	genNearPointerSet  6489
;;	613
;;	aopForRemat 392
;;	418: rname _PIE1bits, val 0, const = 0
;; ***	genNearPointerSet  6504
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PIE1bits
;; 	line = 6506 result AOP_PCODE=_PIE1bits, size=2, left -=-, size=0, right AOP_LIT=0x00, size=1
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6232:genPackBits *{*
;; ***	genPackBits  6233
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PIE1bits
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6258:genPackBits
	.line	16; "int-serial.c"	TXIE = 0;
	BANKSEL	_PIE1bits
	BCF	_PIE1bits,4
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2760:genLabel *{*
;; ***	genLabel  2763
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2528:genEndFunction *{*
;; ***	genEndFunction  2530
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2622:genEndFunction
_00107_DS_
	BANKSEL	___sdcc_saved_fsr
	MOVF	___sdcc_saved_fsr,W
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2623:genEndFunction
	BANKSEL	FSR
	MOVWF	FSR
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2625:genEndFunction
	MOVF	PSAVE,W
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2626:genEndFunction
	MOVWF	PCLATH
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2627:genEndFunction
	CLRF	STATUS
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2629:genEndFunction
	SWAPF	SSAVE,W
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2630:genEndFunction
	MOVWF	STATUS
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2631:genEndFunction
	SWAPF	WSAVE,F
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2632:genEndFunction
	SWAPF	WSAVE,W
END_OF_INTERRUPT
	RETFIE	
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:7409:genpic14Code *{*

;--------------------------------------------------------
; code
;--------------------------------------------------------
code_int_serial	code
;***
;  pBlock Stats: dbName = M
;***
;entry:  _main	;Function start
; 2 exit points
;has an exit
;; Starting pCode block
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2760:genLabel *{*
;; ***	genLabel  2763
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2340:genFunction *{*
;; ***	genFunction  2342 curr label offset=4previous max_key=3 
_main	;Function start
; 2 exit points
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6669:genPointerSet *{*
;; ***	genPointerSet  6670
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6488:genNearPointerSet *{*
;; ***	genNearPointerSet  6489
;;	613
;;	aopForRemat 392
;;	418: rname _OPTION_REGbits, val 0, const = 0
;; ***	genNearPointerSet  6504
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_OPTION_REGbits
;; 	line = 6506 result AOP_PCODE=_OPTION_REGbits, size=2, left -=-, size=0, right AOP_LIT=0x00, size=1
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6232:genPackBits *{*
;; ***	genPackBits  6233
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_OPTION_REGbits
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6258:genPackBits
	.line	25; "int-serial.c"	NOT_RBPU=0;
	BANKSEL	_OPTION_REGbits
	BCF	_OPTION_REGbits,7
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6910:genAssign *{*
;; ***	genAssign  6911
;; ***	aopForSym 315
;;	327 sym->rname = _TRISC, size = 1
;; 	line = 6920 result AOP_DIR=_TRISC, size=1, left -=-, size=0, right AOP_LIT=0x00, size=1
;; ***	genAssign  7006
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:7018:genAssign
;;	1009
;;	1028  _TRISC   offset=0
	.line	28; "int-serial.c"	TRISC = 0; 
	CLRF	_TRISC
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6910:genAssign *{*
;; ***	genAssign  6911
;; ***	aopForSym 315
;;	327 sym->rname = _SPBRG, size = 1
;; 	line = 6920 result AOP_DIR=_SPBRG, size=1, left -=-, size=0, right AOP_LIT=0xc8, size=1
;; ***	genAssign  7006
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:7013:genAssign
	.line	29; "int-serial.c"	SPBRG = 200; // 16MHz => 9600 baud
	MOVLW	0xc8
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:7015:genAssign
;;	1009
;;	1028  _SPBRG   offset=0
	MOVWF	_SPBRG
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6669:genPointerSet *{*
;; ***	genPointerSet  6670
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6488:genNearPointerSet *{*
;; ***	genNearPointerSet  6489
;;	613
;;	aopForRemat 392
;;	418: rname _TXSTAbits, val 0, const = 0
;; ***	genNearPointerSet  6504
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_TXSTAbits
;; 	line = 6506 result AOP_PCODE=_TXSTAbits, size=2, left -=-, size=0, right AOP_LIT=0x00, size=1
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6232:genPackBits *{*
;; ***	genPackBits  6233
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_TXSTAbits
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6258:genPackBits
	.line	30; "int-serial.c"	BRGH = 0;
	BCF	_TXSTAbits,2
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6669:genPointerSet *{*
;; ***	genPointerSet  6670
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6488:genNearPointerSet *{*
;; ***	genNearPointerSet  6489
;;	613
;;	aopForRemat 392
;;	418: rname _TXSTAbits, val 0, const = 0
;; ***	genNearPointerSet  6504
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_TXSTAbits
;; 	line = 6506 result AOP_PCODE=_TXSTAbits, size=2, left -=-, size=0, right AOP_LIT=0x00, size=1
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6232:genPackBits *{*
;; ***	genPackBits  6233
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_TXSTAbits
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6258:genPackBits
	.line	31; "int-serial.c"	SYNC = 0;
	BCF	_TXSTAbits,4
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6669:genPointerSet *{*
;; ***	genPointerSet  6670
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6488:genNearPointerSet *{*
;; ***	genNearPointerSet  6489
;;	613
;;	aopForRemat 392
;;	418: rname _RCSTAbits, val 0, const = 0
;; ***	genNearPointerSet  6504
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_RCSTAbits
;; 	line = 6506 result AOP_PCODE=_RCSTAbits, size=2, left -=-, size=0, right AOP_LIT=0x01, size=1
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6232:genPackBits *{*
;; ***	genPackBits  6233
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_RCSTAbits
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6258:genPackBits
	.line	32; "int-serial.c"	SPEN = 1;
	BANKSEL	_RCSTAbits
	BSF	_RCSTAbits,7
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6669:genPointerSet *{*
;; ***	genPointerSet  6670
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6488:genNearPointerSet *{*
;; ***	genNearPointerSet  6489
;;	613
;;	aopForRemat 392
;;	418: rname _PIE1bits, val 0, const = 0
;; ***	genNearPointerSet  6504
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PIE1bits
;; 	line = 6506 result AOP_PCODE=_PIE1bits, size=2, left -=-, size=0, right AOP_LIT=0x01, size=1
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6232:genPackBits *{*
;; ***	genPackBits  6233
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PIE1bits
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6258:genPackBits
	.line	33; "int-serial.c"	RCIE = 1;
	BANKSEL	_PIE1bits
	BSF	_PIE1bits,5
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6669:genPointerSet *{*
;; ***	genPointerSet  6670
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6488:genNearPointerSet *{*
;; ***	genNearPointerSet  6489
;;	613
;;	aopForRemat 392
;;	418: rname _RCSTAbits, val 0, const = 0
;; ***	genNearPointerSet  6504
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_RCSTAbits
;; 	line = 6506 result AOP_PCODE=_RCSTAbits, size=2, left -=-, size=0, right AOP_LIT=0x01, size=1
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6232:genPackBits *{*
;; ***	genPackBits  6233
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_RCSTAbits
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6258:genPackBits
	.line	34; "int-serial.c"	CREN = 1;
	BANKSEL	_RCSTAbits
	BSF	_RCSTAbits,4
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6669:genPointerSet *{*
;; ***	genPointerSet  6670
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6488:genNearPointerSet *{*
;; ***	genNearPointerSet  6489
;;	613
;;	aopForRemat 392
;;	418: rname _INTCONbits, val 0, const = 0
;; ***	genNearPointerSet  6504
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_INTCONbits
;; 	line = 6506 result AOP_PCODE=_INTCONbits, size=2, left -=-, size=0, right AOP_LIT=0x01, size=1
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6232:genPackBits *{*
;; ***	genPackBits  6233
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_INTCONbits
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6258:genPackBits
	.line	36; "int-serial.c"	GIE = 1;
	BSF	_INTCONbits,7
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6669:genPointerSet *{*
;; ***	genPointerSet  6670
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6488:genNearPointerSet *{*
;; ***	genNearPointerSet  6489
;;	613
;;	aopForRemat 392
;;	418: rname _INTCONbits, val 0, const = 0
;; ***	genNearPointerSet  6504
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_INTCONbits
;; 	line = 6506 result AOP_PCODE=_INTCONbits, size=2, left -=-, size=0, right AOP_LIT=0x01, size=1
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6232:genPackBits *{*
;; ***	genPackBits  6233
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_INTCONbits
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6258:genPackBits
	.line	37; "int-serial.c"	PEIE = 1;
	BSF	_INTCONbits,6
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6669:genPointerSet *{*
;; ***	genPointerSet  6670
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6488:genNearPointerSet *{*
;; ***	genNearPointerSet  6489
;;	613
;;	aopForRemat 392
;;	418: rname _OPTION_REGbits, val 0, const = 0
;; ***	genNearPointerSet  6504
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_OPTION_REGbits
;; 	line = 6506 result AOP_PCODE=_OPTION_REGbits, size=2, left -=-, size=0, right AOP_LIT=0x00, size=1
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6232:genPackBits *{*
;; ***	genPackBits  6233
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_OPTION_REGbits
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6258:genPackBits
	.line	41; "int-serial.c"	T0CS = 0;               /* clear to enable timer mode */
	BANKSEL	_OPTION_REGbits
	BCF	_OPTION_REGbits,5
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6669:genPointerSet *{*
;; ***	genPointerSet  6670
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6488:genNearPointerSet *{*
;; ***	genNearPointerSet  6489
;;	613
;;	aopForRemat 392
;;	418: rname _OPTION_REGbits, val 0, const = 0
;; ***	genNearPointerSet  6504
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_OPTION_REGbits
;; 	line = 6506 result AOP_PCODE=_OPTION_REGbits, size=2, left -=-, size=0, right AOP_LIT=0x00, size=1
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6232:genPackBits *{*
;; ***	genPackBits  6233
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_OPTION_REGbits
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6258:genPackBits
	.line	42; "int-serial.c"	PSA = 0;                /* clear to assign prescaller to TMRO */
	BCF	_OPTION_REGbits,3
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:7383:genDummyRead *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6910:genAssign *{*
;; ***	genAssign  6911
;; ***	aopForSym 315
;;	327 sym->rname = _TRISB, size = 1
;; 	line = 6920 result AOP_DIR=_TRISB, size=1, left -=-, size=0, right AOP_LIT=0x00, size=1
;; ***	genAssign  7006
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:7018:genAssign
;;	1009
;;	1028  _TRISB   offset=0
	.line	44; "int-serial.c"	TRISB &= 0x00;           /* PORTB.0-3 Output, */
	CLRF	_TRISB
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6910:genAssign *{*
;; ***	genAssign  6911
;; ***	aopForSym 315
;;	327 sym->rname = _PORTB, size = 1
;; 	line = 6920 result AOP_DIR=_PORTB, size=1, left -=-, size=0, right AOP_LIT=0x00, size=1
;; ***	genAssign  7006
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:7018:genAssign
;;	1009
;;	1028  _PORTB   offset=0
	.line	45; "int-serial.c"	PORTB = 0x00;           /* PORTB.0-3 to zero, */
	BANKSEL	_PORTB
	CLRF	_PORTB
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6669:genPointerSet *{*
;; ***	genPointerSet  6670
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6488:genNearPointerSet *{*
;; ***	genNearPointerSet  6489
;;	613
;;	aopForRemat 392
;;	418: rname _OPTION_REGbits, val 0, const = 0
;; ***	genNearPointerSet  6504
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_OPTION_REGbits
;; 	line = 6506 result AOP_PCODE=_OPTION_REGbits, size=2, left -=-, size=0, right AOP_LIT=0x01, size=1
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6232:genPackBits *{*
;; ***	genPackBits  6233
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_OPTION_REGbits
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6258:genPackBits
	.line	47; "int-serial.c"	PS2 = 1;                /* 001 @ 4Mhz = 1.024 mS 1:4 1khz */
	BANKSEL	_OPTION_REGbits
	BSF	_OPTION_REGbits,2
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6669:genPointerSet *{*
;; ***	genPointerSet  6670
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6488:genNearPointerSet *{*
;; ***	genNearPointerSet  6489
;;	613
;;	aopForRemat 392
;;	418: rname _OPTION_REGbits, val 0, const = 0
;; ***	genNearPointerSet  6504
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_OPTION_REGbits
;; 	line = 6506 result AOP_PCODE=_OPTION_REGbits, size=2, left -=-, size=0, right AOP_LIT=0x01, size=1
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6232:genPackBits *{*
;; ***	genPackBits  6233
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_OPTION_REGbits
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6258:genPackBits
	.line	48; "int-serial.c"	PS1 = 1;  
	BSF	_OPTION_REGbits,1
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6669:genPointerSet *{*
;; ***	genPointerSet  6670
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6488:genNearPointerSet *{*
;; ***	genNearPointerSet  6489
;;	613
;;	aopForRemat 392
;;	418: rname _OPTION_REGbits, val 0, const = 0
;; ***	genNearPointerSet  6504
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_OPTION_REGbits
;; 	line = 6506 result AOP_PCODE=_OPTION_REGbits, size=2, left -=-, size=0, right AOP_LIT=0x01, size=1
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6232:genPackBits *{*
;; ***	genPackBits  6233
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_OPTION_REGbits
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6258:genPackBits
	.line	49; "int-serial.c"	PS0 = 1;  
	BSF	_OPTION_REGbits,0
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6910:genAssign *{*
;; ***	genAssign  6911
;; ***	aopForSym 315
;;	327 sym->rname = _INTCON, size = 1
;; 	line = 6920 result AOP_DIR=_INTCON, size=1, left -=-, size=0, right AOP_LIT=0x00, size=1
;; ***	genAssign  7006
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:7018:genAssign
;;	1009
;;	1024  _INTCON   offset=0 - had to alloc by reg name
	.line	51; "int-serial.c"	INTCON = 0;             /* clear interrupt flag bits */
	BANKSEL	_INTCON
	CLRF	_INTCON
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6669:genPointerSet *{*
;; ***	genPointerSet  6670
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6488:genNearPointerSet *{*
;; ***	genNearPointerSet  6489
;;	613
;;	aopForRemat 392
;;	418: rname _INTCONbits, val 0, const = 0
;; ***	genNearPointerSet  6504
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_INTCONbits
;; 	line = 6506 result AOP_PCODE=_INTCONbits, size=2, left -=-, size=0, right AOP_LIT=0x01, size=1
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6232:genPackBits *{*
;; ***	genPackBits  6233
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_INTCONbits
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6258:genPackBits
	.line	52; "int-serial.c"	GIE = 1;                /* global interrupt enable */
	BSF	_INTCONbits,7
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6669:genPointerSet *{*
;; ***	genPointerSet  6670
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6488:genNearPointerSet *{*
;; ***	genNearPointerSet  6489
;;	613
;;	aopForRemat 392
;;	418: rname _INTCONbits, val 0, const = 0
;; ***	genNearPointerSet  6504
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_INTCONbits
;; 	line = 6506 result AOP_PCODE=_INTCONbits, size=2, left -=-, size=0, right AOP_LIT=0x01, size=1
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6232:genPackBits *{*
;; ***	genPackBits  6233
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_INTCONbits
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6258:genPackBits
	.line	53; "int-serial.c"	T0IE = 1;               /* TMR0 overflow interrupt enable */
	BSF	_INTCONbits,5
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6910:genAssign *{*
;; ***	genAssign  6911
;; ***	aopForSym 315
;;	327 sym->rname = _TMR0, size = 1
;; 	line = 6920 result AOP_DIR=_TMR0, size=1, left -=-, size=0, right AOP_LIT=0x00, size=1
;; ***	genAssign  7006
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:7018:genAssign
;;	1009
;;	1028  _TMR0   offset=0
	.line	55; "int-serial.c"	TMR0 = 0;               /* clear the value in TMR0 cout to overfollow */
	CLRF	_TMR0
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2760:genLabel *{*
;; ***	genLabel  2763
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2778:genGoto *{*
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2780:genGoto
;; ***	popGetLabel  key=2, label offset 11
_00113_DS_
	.line	56; "int-serial.c"	while(1);
	GOTO	_00113_DS_
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2760:genLabel *{*
;; ***	genLabel  2763
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2528:genEndFunction *{*
;; ***	genEndFunction  2530
	RETURN	
; exit point of _main


;	code size estimation:
;	   52+   13 =    65 instructions (  156 byte)

	end
