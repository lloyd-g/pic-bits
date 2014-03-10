;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Copyright (c) 2014 Lloyd Griffiths	               ;
;simple morse keying beacon                         ;
;Led or oscillator                                  ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	PROCESSOR '16F876'
	INCLUDE <P16F876.INC>


	__CONFIG _XT_OSC & _WDT_OFF & _PWRTE_OFF & _CP_OFF & _LVP_OFF & _BODEN_OFF


	CBLOCK 0x20
	CNT0
	CNT1
	CNT2
	ENDC


	ORG 0x00
INIT:
	BSF STATUS, RP0 ;SELECT BANK 01
	BCF TRISB, 0 ;PB0 IS AN OUTPUT 
	BCF STATUS, RP0 ;SELECT BANK 00
	BCF PORTB, 0 ;SET PB0 LOW
MAIN:
	BSF PORTB, 0 ;SET PB0 HIGH
	CALL DELAY
	BCF PORTB, 0 ;SET PB0 LOW
	CALL DELAY
	GOTO MAIN


DELAY:
	MOVLW 0xA0 ; set count to 0xA0
	MOVWF CNT2
D2:
	MOVLW 0xFA ; set count to 0xFA
	MOVWF CNT1
D1:
	MOVLW 0xFA ; set count to 0xFA
	MOVWF CNT0
D0:
	DECFSZ CNT0 ; inner loop
	GOTO D0


	DECFSZ CNT1 ; mid loop
	GOTO D1


	DECFSZ CNT2 ; outer loop
	GOTO D2


	RETURN


	END

