;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.3.0 #8604 (May 11 2013) (MINGW32)
; This file was generated Fri Mar 14 16:25:57 2014
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
	.file	"simple.c"
	list	p=16f876
	radix dec
	include "p16f876.inc"
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
; code
;--------------------------------------------------------
code_simple	code
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
;; ***	genFunction  2342 curr label offset=0previous max_key=0 
_main	;Function start
; 2 exit points
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6910:genAssign *{*
;; ***	genAssign  6911
;; ***	aopForSym 315
;;	327 sym->rname = _PORTA, size = 1
;; 	line = 6920 result AOP_DIR=_PORTA, size=1, left -=-, size=0, right AOP_LIT=0x00, size=1
;; ***	genAssign  7006
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:7018:genAssign
;;	1009
;;	1024  _PORTA   offset=0 - had to alloc by reg name
	.line	11; "simple.c"	PORTA = 0;
	BANKSEL	_PORTA
	CLRF	_PORTA
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
	.line	12; "simple.c"	PORTB = 0;
	CLRF	_PORTB
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:4220:genOr *{*
;; ***	genOr  4221
;; ***	aopForSym 315
;;	327 sym->rname = _TRISA, size = 1
;;	575
;; 	line = 4227 result AOP_DIR=_TRISA, size=1, left AOP_DIR=_TRISA, size=1, right AOP_LIT=0x10, size=1
;; 	line = 4253 result AOP_DIR=_TRISA, size=1, left AOP_DIR=_TRISA, size=1, right AOP_LIT=0x10, size=1
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:4404:genOr
	.line	15; "simple.c"	TRISA |= 0x10;
	BANKSEL	_TRISA
	BSF	_TRISA,4
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:3919:genAnd *{*
;; ***	genAnd  3920
;; ***	aopForSym 315
;;	327 sym->rname = _TRISB, size = 1
;;	575
;; 	line = 3955 result AOP_DIR=_TRISB, size=1, left AOP_DIR=_TRISB, size=1, right AOP_LIT=0xf0, size=1
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:4128:genAnd
	.line	16; "simple.c"	TRISB &= 0xF0;
	MOVLW	0xf0
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:4130:genAnd
;;	1009
;;	1028  _TRISB   offset=0
	ANDWF	_TRISB,F
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6910:genAssign *{*
;; ***	genAssign  6911
;; ***	aopForSym 315
;;	327 sym->rname = _PORTB, size = 1
;; 	line = 6920 result AOP_DIR=_PORTB, size=1, left -=-, size=0, right AOP_LIT=0x0a, size=1
;; ***	genAssign  7006
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:7013:genAssign
	.line	19; "simple.c"	PORTB = 0x0A;
	MOVLW	0x0a
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:7015:genAssign
;;	1009
;;	1028  _PORTB   offset=0
	BANKSEL	_PORTB
	MOVWF	_PORTB
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2760:genLabel *{*
;; ***	genLabel  2763
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6145:genPointerGet *{*
;; ***	genPointerGet  6146
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:5927:genNearPointerGet *{*
;; ***	genNearPointerGet  5928
;;	613
;;	aopForRemat 392
;;	418: rname _PORTAbits, val 0, const = 0
;; ***	genNearPointerGet  5944
;;	694 register type nRegs=1
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:5743:genUnpackBits *{*
;; ***	genUnpackBits  5744
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTAbits
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:5766:genUnpackBits
_00108_DS_
	.line	23; "simple.c"	if(RA4 != 0)
	BANKSEL	_PORTAbits
	BTFSS	_PORTAbits,4
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:5767:genUnpackBits
;; ***	popGetLabel  key=4, label offset 4
	GOTO	_00108_DS_
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:1609:genCpl *{*
;; ***	genCpl  1611
;; ***	aopForSym 315
;;	327 sym->rname = _PORTB, size = 1
;;	575
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:1631:genCpl
;;	1009
;;	1028  _PORTB   offset=0
	.line	24; "simple.c"	PORTB = ~PORTB;
	COMF	_PORTB,W
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:1632:genCpl
;;	1009
;;	1028  _PORTB   offset=0
	MOVWF	_PORTB
;; ***	addSign  861
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/genarith.c:862:addSign *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2778:genGoto *{*
;; >>> /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2780:genGoto
;; ***	popGetLabel  key=4, label offset 4
	GOTO	_00108_DS_
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2760:genLabel *{*
;; ***	genLabel  2763
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2316:resultRemat *{*
;;; /home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:2528:genEndFunction *{*
;; ***	genEndFunction  2530
	RETURN	
; exit point of _main


;	code size estimation:
;	   13+    4 =    17 instructions (   42 byte)

	end
