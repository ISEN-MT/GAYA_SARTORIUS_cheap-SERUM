;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.5 #9830 (MINGW32)
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f26k22
	radix	dec


;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global	_analogInit
	global	_analogInitTouch
	global	_analogSelectAdc
	global	_analogSelectAdcTouch
	global	_analogDeselect
	global	_analogService
	global	_analogSend
	global	_analogSetMode
	global	_analogSet
	global	_analogGet
	global	_analogGetDistance
	global	_analogScaling
	global	_analogDeclareEE

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern	_ANSELAbits
	extern	_ANSELBbits
	extern	_ANSELCbits
	extern	_PMD2bits
	extern	_PMD1bits
	extern	_PMD0bits
	extern	_DACCON1bits
	extern	_VREFCON2bits
	extern	_DACCON0bits
	extern	_VREFCON1bits
	extern	_FVRCONbits
	extern	_VREFCON0bits
	extern	_CTMUICONbits
	extern	_CTMUICONHbits
	extern	_CTMUCON1bits
	extern	_CTMUCONLbits
	extern	_CTMUCON0bits
	extern	_CTMUCONHbits
	extern	_SRCON1bits
	extern	_SRCON0bits
	extern	_CCPTMRS1bits
	extern	_CCPTMRS0bits
	extern	_T6CONbits
	extern	_T5GCONbits
	extern	_T5CONbits
	extern	_T4CONbits
	extern	_CCP5CONbits
	extern	_CCP4CONbits
	extern	_PSTR3CONbits
	extern	_CCP3ASbits
	extern	_ECCP3ASbits
	extern	_PWM3CONbits
	extern	_CCP3CONbits
	extern	_SLRCONbits
	extern	_WPUBbits
	extern	_IOCBbits
	extern	_PSTR2CONbits
	extern	_CCP2ASbits
	extern	_ECCP2ASbits
	extern	_PWM2CONbits
	extern	_CCP2CONbits
	extern	_SSP2CON3bits
	extern	_SSP2MSKbits
	extern	_SSP2CON2bits
	extern	_SSP2CON1bits
	extern	_SSP2STATbits
	extern	_BAUD2CONbits
	extern	_BAUDCON2bits
	extern	_RC2STAbits
	extern	_RCSTA2bits
	extern	_TX2STAbits
	extern	_TXSTA2bits
	extern	_CM12CONbits
	extern	_CM2CON1bits
	extern	_CM2CONbits
	extern	_CM2CON0bits
	extern	_CM1CONbits
	extern	_CM1CON0bits
	extern	_PIE4bits
	extern	_PIR4bits
	extern	_IPR4bits
	extern	_PIE5bits
	extern	_PIR5bits
	extern	_IPR5bits
	extern	_PORTAbits
	extern	_PORTBbits
	extern	_PORTCbits
	extern	_PORTEbits
	extern	_LATAbits
	extern	_LATBbits
	extern	_LATCbits
	extern	_DDRAbits
	extern	_TRISAbits
	extern	_DDRBbits
	extern	_TRISBbits
	extern	_DDRCbits
	extern	_TRISCbits
	extern	_TRISEbits
	extern	_OSCTUNEbits
	extern	_HLVDCONbits
	extern	_LVDCONbits
	extern	_PIE1bits
	extern	_PIR1bits
	extern	_IPR1bits
	extern	_PIE2bits
	extern	_PIR2bits
	extern	_IPR2bits
	extern	_PIE3bits
	extern	_PIR3bits
	extern	_IPR3bits
	extern	_EECON1bits
	extern	_EEADRbits
	extern	_EEADRHbits
	extern	_RC1STAbits
	extern	_RCSTAbits
	extern	_RCSTA1bits
	extern	_TX1STAbits
	extern	_TXSTAbits
	extern	_TXSTA1bits
	extern	_T3CONbits
	extern	_T3GCONbits
	extern	_ECCP1ASbits
	extern	_ECCPASbits
	extern	_PWM1CONbits
	extern	_PWMCONbits
	extern	_BAUD1CONbits
	extern	_BAUDCONbits
	extern	_BAUDCON1bits
	extern	_BAUDCTLbits
	extern	_PSTR1CONbits
	extern	_PSTRCONbits
	extern	_T2CONbits
	extern	_CCP1CONbits
	extern	_ADCON2bits
	extern	_ADCON1bits
	extern	_ADCON0bits
	extern	_SSP1CON2bits
	extern	_SSPCON2bits
	extern	_SSP1CON1bits
	extern	_SSPCON1bits
	extern	_SSP1STATbits
	extern	_SSPSTATbits
	extern	_SSP1MSKbits
	extern	_SSPMSKbits
	extern	_SSP1CON3bits
	extern	_SSPCON3bits
	extern	_T1GCONbits
	extern	_T1CONbits
	extern	_RCONbits
	extern	_WDTCONbits
	extern	_OSCCON2bits
	extern	_OSCCONbits
	extern	_T0CONbits
	extern	_STATUSbits
	extern	_INTCON3bits
	extern	_INTCON2bits
	extern	_INTCONbits
	extern	_STKPTRbits
	extern	_stdin
	extern	_stdout
	extern	_Now
	extern	_PORTZ
	extern	_PORTZbits
	extern	_LATZ
	extern	_LATZbits
	extern	_TRICZ
	extern	_TRISZbits
	extern	_ANSELZ
	extern	_ANSELZbits
	extern	_ANSELA
	extern	_ANSELB
	extern	_ANSELC
	extern	_PMD2
	extern	_PMD1
	extern	_PMD0
	extern	_DACCON1
	extern	_VREFCON2
	extern	_DACCON0
	extern	_VREFCON1
	extern	_FVRCON
	extern	_VREFCON0
	extern	_CTMUICON
	extern	_CTMUICONH
	extern	_CTMUCON1
	extern	_CTMUCONL
	extern	_CTMUCON0
	extern	_CTMUCONH
	extern	_SRCON1
	extern	_SRCON0
	extern	_CCPTMRS1
	extern	_CCPTMRS0
	extern	_T6CON
	extern	_PR6
	extern	_TMR6
	extern	_T5GCON
	extern	_T5CON
	extern	_TMR5
	extern	_TMR5L
	extern	_TMR5H
	extern	_T4CON
	extern	_PR4
	extern	_TMR4
	extern	_CCP5CON
	extern	_CCPR5
	extern	_CCPR5L
	extern	_CCPR5H
	extern	_CCP4CON
	extern	_CCPR4
	extern	_CCPR4L
	extern	_CCPR4H
	extern	_PSTR3CON
	extern	_CCP3AS
	extern	_ECCP3AS
	extern	_PWM3CON
	extern	_CCP3CON
	extern	_CCPR3
	extern	_CCPR3L
	extern	_CCPR3H
	extern	_SLRCON
	extern	_WPUB
	extern	_IOCB
	extern	_PSTR2CON
	extern	_CCP2AS
	extern	_ECCP2AS
	extern	_PWM2CON
	extern	_CCP2CON
	extern	_CCPR2
	extern	_CCPR2L
	extern	_CCPR2H
	extern	_SSP2CON3
	extern	_SSP2MSK
	extern	_SSP2CON2
	extern	_SSP2CON1
	extern	_SSP2STAT
	extern	_SSP2ADD
	extern	_SSP2BUF
	extern	_BAUD2CON
	extern	_BAUDCON2
	extern	_RC2STA
	extern	_RCSTA2
	extern	_TX2STA
	extern	_TXSTA2
	extern	_TX2REG
	extern	_TXREG2
	extern	_RC2REG
	extern	_RCREG2
	extern	_SP2BRG
	extern	_SPBRG2
	extern	_SP2BRGH
	extern	_SPBRGH2
	extern	_CM12CON
	extern	_CM2CON1
	extern	_CM2CON
	extern	_CM2CON0
	extern	_CM1CON
	extern	_CM1CON0
	extern	_PIE4
	extern	_PIR4
	extern	_IPR4
	extern	_PIE5
	extern	_PIR5
	extern	_IPR5
	extern	_PORTA
	extern	_PORTB
	extern	_PORTC
	extern	_PORTE
	extern	_LATA
	extern	_LATB
	extern	_LATC
	extern	_DDRA
	extern	_TRISA
	extern	_DDRB
	extern	_TRISB
	extern	_DDRC
	extern	_TRISC
	extern	_TRISE
	extern	_OSCTUNE
	extern	_HLVDCON
	extern	_LVDCON
	extern	_PIE1
	extern	_PIR1
	extern	_IPR1
	extern	_PIE2
	extern	_PIR2
	extern	_IPR2
	extern	_PIE3
	extern	_PIR3
	extern	_IPR3
	extern	_EECON1
	extern	_EECON2
	extern	_EEDATA
	extern	_EEADR
	extern	_EEADRH
	extern	_RC1STA
	extern	_RCSTA
	extern	_RCSTA1
	extern	_TX1STA
	extern	_TXSTA
	extern	_TXSTA1
	extern	_TX1REG
	extern	_TXREG
	extern	_TXREG1
	extern	_RC1REG
	extern	_RCREG
	extern	_RCREG1
	extern	_SP1BRG
	extern	_SPBRG
	extern	_SPBRG1
	extern	_SP1BRGH
	extern	_SPBRGH
	extern	_SPBRGH1
	extern	_T3CON
	extern	_TMR3
	extern	_TMR3L
	extern	_TMR3H
	extern	_T3GCON
	extern	_ECCP1AS
	extern	_ECCPAS
	extern	_PWM1CON
	extern	_PWMCON
	extern	_BAUD1CON
	extern	_BAUDCON
	extern	_BAUDCON1
	extern	_BAUDCTL
	extern	_PSTR1CON
	extern	_PSTRCON
	extern	_T2CON
	extern	_PR2
	extern	_TMR2
	extern	_CCP1CON
	extern	_CCPR1
	extern	_CCPR1L
	extern	_CCPR1H
	extern	_ADCON2
	extern	_ADCON1
	extern	_ADCON0
	extern	_ADRES
	extern	_ADRESL
	extern	_ADRESH
	extern	_SSP1CON2
	extern	_SSPCON2
	extern	_SSP1CON1
	extern	_SSPCON1
	extern	_SSP1STAT
	extern	_SSPSTAT
	extern	_SSP1ADD
	extern	_SSPADD
	extern	_SSP1BUF
	extern	_SSPBUF
	extern	_SSP1MSK
	extern	_SSPMSK
	extern	_SSP1CON3
	extern	_SSPCON3
	extern	_T1GCON
	extern	_T1CON
	extern	_TMR1
	extern	_TMR1L
	extern	_TMR1H
	extern	_RCON
	extern	_WDTCON
	extern	_OSCCON2
	extern	_OSCCON
	extern	_T0CON
	extern	_TMR0
	extern	_TMR0L
	extern	_TMR0H
	extern	_STATUS
	extern	_FSR2L
	extern	_FSR2H
	extern	_PLUSW2
	extern	_PREINC2
	extern	_POSTDEC2
	extern	_POSTINC2
	extern	_INDF2
	extern	_BSR
	extern	_FSR1L
	extern	_FSR1H
	extern	_PLUSW1
	extern	_PREINC1
	extern	_POSTDEC1
	extern	_POSTINC1
	extern	_INDF1
	extern	_WREG
	extern	_FSR0L
	extern	_FSR0H
	extern	_PLUSW0
	extern	_PREINC0
	extern	_POSTDEC0
	extern	_POSTINC0
	extern	_INDF0
	extern	_INTCON3
	extern	_INTCON2
	extern	_INTCON
	extern	_PROD
	extern	_PRODL
	extern	_PRODH
	extern	_TABLAT
	extern	_TBLPTR
	extern	_TBLPTRL
	extern	_TBLPTRH
	extern	_TBLPTRU
	extern	_PC
	extern	_PCL
	extern	_PCLATH
	extern	_PCLATU
	extern	_STKPTR
	extern	_TOS
	extern	_TOSL
	extern	_TOSH
	extern	_TOSU
	extern	_printf
	extern	_fraiseSend
	extern	_EEdeclareInt
	extern	_FSLP_analog_preconf
	extern	__mullong
	extern	__divulong

;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
INTCON	equ	0xff2
WREG	equ	0xfe8
FSR0L	equ	0xfe9
FSR0H	equ	0xfea
FSR1L	equ	0xfe1
FSR2L	equ	0xfd9
INDF0	equ	0xfef
POSTINC0	equ	0xfee
POSTINC1	equ	0xfe6
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PLUSW2	equ	0xfdb
PRODL	equ	0xff3
PRODH	equ	0xff4


	idata
_Scaling	db	0x00
_Threshold	db	0x0a, 0x00
_Mode	db	0x02
_analogService_chan_1_98	db	0x00
_analogService_conv_1_98	db	0x00
_analogSend_chan_1_105	db	0x00
_analogSend_buf_1_105	db	0x42, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	db	0x00


; Internal registers
.registers	udata_ovr	0x0000
r0x00	res	1
r0x01	res	1
r0x02	res	1
r0x03	res	1
r0x04	res	1
r0x05	res	1
r0x06	res	1
r0x07	res	1
r0x08	res	1
r0x09	res	1
r0x0a	res	1
r0x0b	res	1
r0x0c	res	1

udata_analog_0	udata
_Selected	res	2

udata_analog_1	udata
_Value	res	32

udata_analog_2	udata
_inValue	res	32

udata_analog_3	udata
_oldValue	res	32

udata_analog_4	udata
_Min	res	32

udata_analog_5	udata
_Max	res	32

udata_analog_6	udata
_Pins	res	16

udata_analog_7	udata
_HWChan	res	16

udata_analog_8	udata
_Dist	res	32

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_analog__analogDeclareEE	code
_analogDeclareEE:
;	.line	276; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	EEDECLARE(0);
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_Max)
	MOVWF	POSTDEC1
	MOVLW	LOW(_Max)
	MOVWF	POSTDEC1
	CALL	_EEdeclareInt
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_Min)
	MOVWF	POSTDEC1
	MOVLW	LOW(_Min)
	MOVWF	POSTDEC1
	CALL	_EEdeclareInt
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	277; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	EEDECLARE(1);
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_Max + 2)
	MOVWF	POSTDEC1
	MOVLW	LOW(_Max + 2)
	MOVWF	POSTDEC1
	CALL	_EEdeclareInt
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_Min + 2)
	MOVWF	POSTDEC1
	MOVLW	LOW(_Min + 2)
	MOVWF	POSTDEC1
	CALL	_EEdeclareInt
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	278; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	EEDECLARE(2);
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_Max + 4)
	MOVWF	POSTDEC1
	MOVLW	LOW(_Max + 4)
	MOVWF	POSTDEC1
	CALL	_EEdeclareInt
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_Min + 4)
	MOVWF	POSTDEC1
	MOVLW	LOW(_Min + 4)
	MOVWF	POSTDEC1
	CALL	_EEdeclareInt
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	279; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	EEDECLARE(3);
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_Max + 6)
	MOVWF	POSTDEC1
	MOVLW	LOW(_Max + 6)
	MOVWF	POSTDEC1
	CALL	_EEdeclareInt
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_Min + 6)
	MOVWF	POSTDEC1
	MOVLW	LOW(_Min + 6)
	MOVWF	POSTDEC1
	CALL	_EEdeclareInt
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	282; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	EEDECLARE(4);
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_Max + 8)
	MOVWF	POSTDEC1
	MOVLW	LOW(_Max + 8)
	MOVWF	POSTDEC1
	CALL	_EEdeclareInt
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_Min + 8)
	MOVWF	POSTDEC1
	MOVLW	LOW(_Min + 8)
	MOVWF	POSTDEC1
	CALL	_EEdeclareInt
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	283; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	EEDECLARE(5);
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_Max + 10)
	MOVWF	POSTDEC1
	MOVLW	LOW(_Max + 10)
	MOVWF	POSTDEC1
	CALL	_EEdeclareInt
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_Min + 10)
	MOVWF	POSTDEC1
	MOVLW	LOW(_Min + 10)
	MOVWF	POSTDEC1
	CALL	_EEdeclareInt
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	284; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	EEDECLARE(6);
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_Max + 12)
	MOVWF	POSTDEC1
	MOVLW	LOW(_Max + 12)
	MOVWF	POSTDEC1
	CALL	_EEdeclareInt
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_Min + 12)
	MOVWF	POSTDEC1
	MOVLW	LOW(_Min + 12)
	MOVWF	POSTDEC1
	CALL	_EEdeclareInt
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	285; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	EEDECLARE(7);
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_Max + 14)
	MOVWF	POSTDEC1
	MOVLW	LOW(_Max + 14)
	MOVWF	POSTDEC1
	CALL	_EEdeclareInt
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_Min + 14)
	MOVWF	POSTDEC1
	MOVLW	LOW(_Min + 14)
	MOVWF	POSTDEC1
	CALL	_EEdeclareInt
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	288; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	EEDECLARE(8);
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_Max + 16)
	MOVWF	POSTDEC1
	MOVLW	LOW(_Max + 16)
	MOVWF	POSTDEC1
	CALL	_EEdeclareInt
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_Min + 16)
	MOVWF	POSTDEC1
	MOVLW	LOW(_Min + 16)
	MOVWF	POSTDEC1
	CALL	_EEdeclareInt
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	289; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	EEDECLARE(9);
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_Max + 18)
	MOVWF	POSTDEC1
	MOVLW	LOW(_Max + 18)
	MOVWF	POSTDEC1
	CALL	_EEdeclareInt
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_Min + 18)
	MOVWF	POSTDEC1
	MOVLW	LOW(_Min + 18)
	MOVWF	POSTDEC1
	CALL	_EEdeclareInt
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	290; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	EEDECLARE(10);
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_Max + 20)
	MOVWF	POSTDEC1
	MOVLW	LOW(_Max + 20)
	MOVWF	POSTDEC1
	CALL	_EEdeclareInt
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_Min + 20)
	MOVWF	POSTDEC1
	MOVLW	LOW(_Min + 20)
	MOVWF	POSTDEC1
	CALL	_EEdeclareInt
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	291; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	EEDECLARE(11);
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_Max + 22)
	MOVWF	POSTDEC1
	MOVLW	LOW(_Max + 22)
	MOVWF	POSTDEC1
	CALL	_EEdeclareInt
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_Min + 22)
	MOVWF	POSTDEC1
	MOVLW	LOW(_Min + 22)
	MOVWF	POSTDEC1
	CALL	_EEdeclareInt
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	294; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	EEDECLARE(12);
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_Max + 24)
	MOVWF	POSTDEC1
	MOVLW	LOW(_Max + 24)
	MOVWF	POSTDEC1
	CALL	_EEdeclareInt
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_Min + 24)
	MOVWF	POSTDEC1
	MOVLW	LOW(_Min + 24)
	MOVWF	POSTDEC1
	CALL	_EEdeclareInt
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	295; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	EEDECLARE(13);
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_Max + 26)
	MOVWF	POSTDEC1
	MOVLW	LOW(_Max + 26)
	MOVWF	POSTDEC1
	CALL	_EEdeclareInt
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_Min + 26)
	MOVWF	POSTDEC1
	MOVLW	LOW(_Min + 26)
	MOVWF	POSTDEC1
	CALL	_EEdeclareInt
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	296; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	EEDECLARE(14);
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_Max + 28)
	MOVWF	POSTDEC1
	MOVLW	LOW(_Max + 28)
	MOVWF	POSTDEC1
	CALL	_EEdeclareInt
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_Min + 28)
	MOVWF	POSTDEC1
	MOVLW	LOW(_Min + 28)
	MOVWF	POSTDEC1
	CALL	_EEdeclareInt
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	297; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	EEDECLARE(15);
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_Max + 30)
	MOVWF	POSTDEC1
	MOVLW	LOW(_Max + 30)
	MOVWF	POSTDEC1
	CALL	_EEdeclareInt
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVLW	0x80
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	HIGH(_Min + 30)
	MOVWF	POSTDEC1
	MOVLW	LOW(_Min + 30)
	MOVWF	POSTDEC1
	CALL	_EEdeclareInt
	MOVLW	0x03
	ADDWF	FSR1L, F
	RETURN	

; ; Starting pCode block
S_analog__analogScaling	code
_analogScaling:
;	.line	255; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	void analogScaling(unsigned char scaling) // when scaling, min and max are updated each sample
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	259; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	if(scaling==1) {
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00415_DS_
;	.line	260; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	for(i=0;i<ANALOG_MAX_CHANNELS;i++) {
	CLRF	r0x01
; ;multiply lit val:0x02 by variable r0x01 and store in r0x02
_00416_DS_:
;	.line	261; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	Min[i]=0x7FFF;
	MOVF	r0x01, W
	MULLW	0x02
	MOVF	PRODH, W
	MOVWF	r0x03
	MOVFF	PRODL, r0x02
	MOVLW	LOW(_Min)
	ADDWF	r0x02, W
	MOVWF	r0x04
	MOVLW	HIGH(_Min)
	ADDWFC	r0x03, W
	MOVWF	r0x05
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, FSR0H
	SETF	POSTINC0
	MOVLW	0x7f
	MOVWF	INDF0
;	.line	262; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	Max[i]=0;
	MOVLW	LOW(_Max)
	ADDWF	r0x02, F
	MOVLW	HIGH(_Max)
	ADDWFC	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	CLRF	POSTINC0
	CLRF	INDF0
;	.line	260; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	for(i=0;i<ANALOG_MAX_CHANNELS;i++) {
	INCF	r0x01, F
	MOVLW	0x10
	SUBWF	r0x01, W
	BNC	_00416_DS_
_00415_DS_:
;	.line	266; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	Scaling=scaling;
	MOVFF	r0x00, _Scaling
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_analog__analogGetDistance	code
_analogGetDistance:
;	.line	250; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	int analogGetDistance(unsigned char chan)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
; ;multiply lit val:0x02 by variable r0x00 and store in r0x00
;	.line	252; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	return Dist[chan];
	MOVF	r0x00, W
	MULLW	0x02
	MOVF	PRODH, W
	MOVWF	r0x01
	MOVFF	PRODL, r0x00
	MOVLW	LOW(_Dist)
	ADDWF	r0x00, F
	MOVLW	HIGH(_Dist)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	POSTINC0, r0x00
	MOVFF	INDF0, r0x01
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_analog__analogGet	code
_analogGet:
;	.line	245; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	int analogGet(unsigned char chan)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
; ;multiply lit val:0x02 by variable r0x00 and store in r0x00
;	.line	247; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	return Value[chan];
	MOVF	r0x00, W
	MULLW	0x02
	MOVF	PRODH, W
	MOVWF	r0x01
	MOVFF	PRODL, r0x00
	MOVLW	LOW(_Value)
	ADDWF	r0x00, F
	MOVLW	HIGH(_Value)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	POSTINC0, r0x00
	MOVFF	INDF0, r0x01
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_analog__analogSet	code
_analogSet:
;	.line	233; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	void analogSet(unsigned char chan, int val)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
; ;multiply lit val:0x02 by variable r0x00 and store in r0x00
;	.line	237; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	inValue[chan] = val;
	MOVF	r0x00, W
	MULLW	0x02
	MOVF	PRODH, W
	MOVWF	r0x03
	MOVFF	PRODL, r0x00
	MOVLW	LOW(_inValue)
	ADDWF	r0x00, W
	MOVWF	r0x04
	MOVLW	HIGH(_inValue)
	ADDWFC	r0x03, W
	MOVWF	r0x05
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, FSR0H
	MOVFF	r0x01, POSTINC0
	MOVFF	r0x02, INDF0
;	.line	238; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	d = oldValue[chan] - val;
	MOVLW	LOW(_oldValue)
	ADDWF	r0x00, W
	MOVWF	r0x04
	MOVLW	HIGH(_oldValue)
	ADDWFC	r0x03, W
	MOVWF	r0x05
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, FSR0H
	MOVFF	POSTINC0, r0x04
	MOVFF	INDF0, r0x05
	MOVF	r0x01, W
	SUBWF	r0x04, W
	MOVWF	r0x01
	MOVF	r0x02, W
	SUBWFB	r0x05, W
	MOVWF	r0x02
;	.line	239; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	Dist[chan] = d;
	MOVLW	LOW(_Dist)
	ADDWF	r0x00, F
	MOVLW	HIGH(_Dist)
	ADDWFC	r0x03, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	r0x01, POSTINC0
	MOVFF	r0x02, INDF0
;	.line	240; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	if(d < 0) d = -d;
	BSF	STATUS, 0
	BTFSS	r0x02, 7
	BCF	STATUS, 0
	BNC	_00381_DS_
	COMF	r0x02, F
	NEGF	r0x01
	BTFSC	STATUS, 2
	INCF	r0x02, F
_00381_DS_:
;	.line	241; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	if(d < 3) d = 0;
	MOVF	r0x02, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00398_DS_
	MOVLW	0x03
	SUBWF	r0x01, W
_00398_DS_:
	BC	_00383_DS_
	CLRF	r0x01
	CLRF	r0x02
_00383_DS_:
;	.line	242; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	if(d == 0) Dist[chan] = 0;
	MOVF	r0x01, W
	IORWF	r0x02, W
	BNZ	_00386_DS_
	MOVFF	r0x00, FSR0L
	MOVFF	r0x03, FSR0H
	MOVLW	0x00
	CLRF	POSTINC0
	CLRF	INDF0
_00386_DS_:
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_analog__analogSetMode	code
_analogSetMode:
;	.line	228; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	void analogSetMode(unsigned char mode) // scale : bit0 = scale_on ; bit1 = num_on(=text_off) ; bit2 = cross_inval
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVLW	0x02
	MOVFF	PLUSW2, _Mode
;	.line	230; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	Mode = mode;
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_analog__analogSend	code
_analogSend:
;	.line	165; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	char analogSend()
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
;	.line	168; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	unsigned char loop = 0, count = 0, len = 0;
	CLRF	r0x00
;	.line	172; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	while((count < 4) && (loop++ < ANALOG_MAX_CHANNELS)){
	CLRF	r0x01
	CLRF	r0x02
_00279_DS_:
	MOVLW	0x04
	SUBWF	r0x02, W
	BTFSC	STATUS, 0
	BRA	_00307_DS_
	MOVFF	r0x01, r0x03
	INCF	r0x01, F
	MOVLW	0x10
	SUBWF	r0x03, W
	BTFSC	STATUS, 0
	BRA	_00307_DS_
	BANKSEL	_analogSend_chan_1_105
;	.line	173; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	chan++;
	INCF	_analogSend_chan_1_105, F, B
;	.line	174; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	if(chan >= ANALOG_MAX_CHANNELS) {
	MOVLW	0x10
; #	SUBWF	_analogSend_chan_1_105, W, B
; #	BTFSS	STATUS, 0
; #	GOTO	_00245_DS_
; #	CLRF	_analogSend_chan_1_105, B
; #	SWAPF	_analogSend_chan_1_105, W, B
; removed redundant BANKSEL
;	.line	175; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	chan = 0;
	SUBWF	_analogSend_chan_1_105, W, B
;	.line	177; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	if(! isSelected(chan)) continue;
	BNC	_10434_DS_
; removed redundant BANKSEL
	CLRF	_analogSend_chan_1_105, B
_10434_DS_:
	BANKSEL	_analogSend_chan_1_105
	SWAPF	_analogSend_chan_1_105, W, B
	RLNCF	WREG, W
	ANDLW	0x1f
	MOVWF	r0x03
	CLRF	r0x04
	MOVLW	LOW(_Selected)
	ADDWF	r0x03, F
	MOVLW	HIGH(_Selected)
	ADDWFC	r0x04, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVFF	INDF0, r0x03
	MOVLW	0x07
; removed redundant BANKSEL
	ANDWF	_analogSend_chan_1_105, W, B
	MOVWF	r0x04
	MOVLW	0x01
	MOVWF	r0x05
	MOVLW	0x00
	MOVWF	r0x06
	MOVF	r0x04, W
	BZ	_00352_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00353_DS_:
	RLCF	r0x05, F
	RLCF	r0x06, F
	ADDLW	0x01
	BNC	_00353_DS_
_00352_DS_:
	CLRF	r0x07
	MOVF	r0x03, W
	ANDWF	r0x05, F
	MOVF	r0x07, W
	ANDWF	r0x06, F
	MOVF	r0x05, W
	IORWF	r0x06, W
	BSF	STATUS, 0
	TSTFSZ	WREG
	BCF	STATUS, 0
	CLRF	r0x05
	RLCF	r0x05, F
	MOVF	r0x05, W
	BTFSS	STATUS, 2
	BRA	_00279_DS_
; ;multiply lit val:0x02 by variable _analogSend_chan_1_105 and store in r0x03
	BANKSEL	_analogSend_chan_1_105
;	.line	179; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	v = Value[chan];
	MOVF	_analogSend_chan_1_105, W, B
	MULLW	0x02
	MOVF	PRODH, W
	MOVWF	r0x04
	MOVFF	PRODL, r0x03
	MOVLW	LOW(_Value)
	ADDWF	r0x03, W
	MOVWF	r0x05
	MOVLW	HIGH(_Value)
	ADDWFC	r0x04, W
	MOVWF	r0x06
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, FSR0H
	MOVFF	POSTINC0, r0x05
	MOVFF	INDF0, r0x06
	BANKSEL	_Mode
;	.line	180; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	if(Mode & AMODE_SCALE) { // scale :
	BTFSS	_Mode, 0, B
	BRA	_00260_DS_
;	.line	181; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	if(v < Min[chan]) v = 0;
	MOVLW	LOW(_Min)
	ADDWF	r0x03, W
	MOVWF	r0x07
	MOVLW	HIGH(_Min)
	ADDWFC	r0x04, W
	MOVWF	r0x08
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, FSR0H
	MOVFF	POSTINC0, r0x07
	MOVFF	INDF0, r0x08
	MOVF	r0x06, W
	ADDLW	0x80
	MOVWF	PRODL
	MOVF	r0x08, W
	ADDLW	0x80
	SUBWF	PRODL, W
	BNZ	_00356_DS_
	MOVF	r0x07, W
	SUBWF	r0x05, W
_00356_DS_:
	BC	_00252_DS_
	CLRF	r0x05
	CLRF	r0x06
	BRA	_00253_DS_
_00252_DS_:
;	.line	182; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	else if(v > Max[chan]) v = ANALOG_SCALED_MAX;
	MOVLW	LOW(_Max)
	ADDWF	r0x03, F
	MOVLW	HIGH(_Max)
	ADDWFC	r0x04, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVFF	POSTINC0, r0x03
	MOVFF	INDF0, r0x04
	MOVF	r0x04, W
	ADDLW	0x80
	MOVWF	PRODL
	MOVF	r0x06, W
	ADDLW	0x80
	SUBWF	PRODL, W
	BNZ	_00357_DS_
	MOVF	r0x05, W
	SUBWF	r0x03, W
_00357_DS_:
	BC	_00249_DS_
	SETF	r0x05
	MOVLW	0x3f
	MOVWF	r0x06
	BRA	_00253_DS_
_00249_DS_:
;	.line	184; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	((ANALOG_SCALED_MAX+1UL) * (v - Min[chan])) / 
	MOVF	r0x07, W
	SUBWF	r0x05, W
	MOVWF	r0x09
	MOVF	r0x08, W
	SUBWFB	r0x06, W
	MOVWF	r0x0a
	CLRF	WREG
	BTFSC	r0x0a, 7
	MOVLW	0xff
	MOVWF	r0x0b
; #	MOVWF	r0x0c
; #	MOVF	r0x0c, W
;	.line	185; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	(Max[chan] - Min[chan]) );
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	MOVLW	0x40
	MOVWF	POSTDEC1
	MOVLW	0x00
	CLRF	POSTDEC1
	CALL	__mullong
	MOVWF	r0x09
	MOVFF	PRODL, r0x0a
	MOVFF	PRODH, r0x0b
	MOVFF	FSR0L, r0x0c
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x07, W
	SUBWF	r0x03, W
	MOVWF	r0x07
	MOVF	r0x08, W
	SUBWFB	r0x04, W
	MOVWF	r0x08
	CLRF	WREG
	BTFSC	r0x08, 7
	MOVLW	0xff
	MOVWF	r0x03
; #	MOVWF	r0x04
; #	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	CALL	__divulong
	MOVWF	r0x03
	MOVFF	PRODL, r0x04
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x03, W
	MOVWF	r0x05
	MOVF	r0x04, W
	MOVWF	r0x06
_00253_DS_:
	BANKSEL	(_Threshold + 1)
;	.line	187; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	if(v <= Threshold ) v = 0;
	MOVF	(_Threshold + 1), W, B
	ADDLW	0x80
	MOVWF	PRODL
	MOVF	r0x06, W
	ADDLW	0x80
	SUBWF	PRODL, W
	BNZ	_00358_DS_
	MOVF	r0x05, W
; removed redundant BANKSEL
	SUBWF	_Threshold, W, B
_00358_DS_:
	BNC	_00257_DS_
	CLRF	r0x05
	CLRF	r0x06
	BRA	_00260_DS_
_00257_DS_:
	BANKSEL	_Threshold
;	.line	188; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	else if(v >= (ANALOG_SCALED_MAX - Threshold)) 
	MOVF	_Threshold, W, B
	SUBLW	0xff
	MOVWF	r0x03
	MOVLW	0x3f
; removed redundant BANKSEL
	SUBFWB	(_Threshold + 1), W, B
	MOVWF	r0x04
	MOVF	r0x06, W
	ADDLW	0x80
	MOVWF	PRODL
	MOVF	r0x04, W
	ADDLW	0x80
	SUBWF	PRODL, W
	BNZ	_00359_DS_
	MOVF	r0x03, W
	SUBWF	r0x05, W
_00359_DS_:
	BNC	_00260_DS_
;	.line	189; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	v = ANALOG_SCALED_MAX;
	SETF	r0x05
	MOVLW	0x3f
	MOVWF	r0x06
; ;multiply lit val:0x02 by variable _analogSend_chan_1_105 and store in r0x03
_00260_DS_:
	BANKSEL	_analogSend_chan_1_105
;	.line	191; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	d = v - oldValue[chan];
	MOVF	_analogSend_chan_1_105, W, B
	MULLW	0x02
	MOVF	PRODH, W
	MOVWF	r0x04
	MOVFF	PRODL, r0x03
	MOVLW	LOW(_oldValue)
	ADDWF	r0x03, F
	MOVLW	HIGH(_oldValue)
	ADDWFC	r0x04, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVFF	POSTINC0, r0x03
	MOVFF	INDF0, r0x04
	MOVF	r0x03, W
	SUBWF	r0x05, W
	MOVWF	r0x03
	MOVF	r0x04, W
	SUBWFB	r0x06, W
	MOVWF	r0x04
;	.line	192; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	if(d < 0) d = -d;
	BSF	STATUS, 0
	BTFSS	r0x04, 7
	BCF	STATUS, 0
	BNC	_00262_DS_
	COMF	r0x04, F
	NEGF	r0x03
	BTFSC	STATUS, 2
	INCF	r0x04, F
_00262_DS_:
;	.line	194; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	count++;
	INCF	r0x02, F
	BANKSEL	(_Threshold + 1)
;	.line	196; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	if(d <= Threshold) continue;
	MOVF	(_Threshold + 1), W, B
	ADDLW	0x80
	MOVWF	PRODL
	MOVF	r0x04, W
	ADDLW	0x80
	SUBWF	PRODL, W
	BNZ	_00361_DS_
	MOVF	r0x03, W
; removed redundant BANKSEL
	SUBWF	_Threshold, W, B
_00361_DS_:
	BTFSC	STATUS, 0
	BRA	_00279_DS_
; ;multiply lit val:0x02 by variable _analogSend_chan_1_105 and store in r0x07
	BANKSEL	_analogSend_chan_1_105
;	.line	198; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	oldValue[chan] = v;
	MOVF	_analogSend_chan_1_105, W, B
	MULLW	0x02
	MOVF	PRODH, W
	MOVWF	r0x08
	MOVFF	PRODL, r0x07
	MOVLW	LOW(_oldValue)
	ADDWF	r0x07, F
	MOVLW	HIGH(_oldValue)
	ADDWFC	r0x08, F
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, FSR0H
	MOVFF	r0x05, POSTINC0
	MOVFF	r0x06, INDF0
	BANKSEL	_Mode
;	.line	200; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	if(Mode & AMODE_CROSS) {
	BTFSS	_Mode, 2, B
	BRA	_00272_DS_
; ;multiply lit val:0x02 by variable _analogSend_chan_1_105 and store in r0x07
	BANKSEL	_analogSend_chan_1_105
;	.line	201; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	if(Dist[chan] != 0) {
	MOVF	_analogSend_chan_1_105, W, B
	MULLW	0x02
	MOVF	PRODH, W
	MOVWF	r0x08
	MOVFF	PRODL, r0x07
	MOVLW	LOW(_Dist)
	ADDWF	r0x07, W
	MOVWF	r0x09
	MOVLW	HIGH(_Dist)
	ADDWFC	r0x08, W
	MOVWF	r0x0a
	MOVFF	r0x09, FSR0L
	MOVFF	r0x0a, FSR0H
	MOVFF	POSTINC0, r0x0b
	MOVFF	INDF0, r0x0c
	MOVF	r0x0b, W
	IORWF	r0x0c, W
	BTFSC	STATUS, 2
	BRA	_00272_DS_
;	.line	202; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	d = v - inValue[chan];
	MOVLW	LOW(_inValue)
	ADDWF	r0x07, F
	MOVLW	HIGH(_inValue)
	ADDWFC	r0x08, F
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, FSR0H
	MOVFF	POSTINC0, r0x07
	MOVFF	INDF0, r0x08
	MOVF	r0x07, W
	SUBWF	r0x05, W
	MOVWF	r0x03
	MOVF	r0x08, W
	SUBWFB	r0x06, W
; #	MOVWF	r0x04
; #	MOVF	r0x03, W
; #	IORWF	r0x04, W
;	.line	203; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	if((d != 0) && ((d > 0) == (Dist[chan] > 0))) { 
	MOVWF	r0x04
	IORWF	r0x03, W
	BZ	_00266_DS_
	MOVF	r0x04, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00364_DS_
	MOVLW	0x01
	SUBWF	r0x03, W
_00364_DS_:
	CLRF	r0x07
	RLCF	r0x07, F
	MOVF	r0x0c, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00366_DS_
	MOVLW	0x01
	SUBWF	r0x0b, W
_00366_DS_:
	CLRF	r0x0b
	RLCF	r0x0b, F
	MOVF	r0x07, W
	XORWF	r0x0b, W
	BNZ	_00266_DS_
;	.line	204; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	Dist[chan] = d;
	MOVFF	r0x09, FSR0L
	MOVFF	r0x0a, FSR0H
	MOVFF	r0x03, POSTINC0
	MOVFF	r0x04, INDF0
;	.line	205; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	continue; 
	BRA	_00279_DS_
; ;multiply lit val:0x02 by variable _analogSend_chan_1_105 and store in r0x03
_00266_DS_:
	BANKSEL	_analogSend_chan_1_105
;	.line	207; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	else Dist[chan] = 0;
	MOVF	_analogSend_chan_1_105, W, B
	MULLW	0x02
	MOVF	PRODH, W
	MOVWF	r0x04
	MOVFF	PRODL, r0x03
	MOVLW	LOW(_Dist)
	ADDWF	r0x03, F
	MOVLW	HIGH(_Dist)
	ADDWFC	r0x04, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	CLRF	POSTINC0
	CLRF	INDF0
_00272_DS_:
	BANKSEL	_Mode
;	.line	211; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	if(Mode & AMODE_NUM) {
	BTFSS	_Mode, 1, B
	BRA	_00276_DS_
;	.line	212; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	if( !len ) buf[len++] = 'B';
	MOVF	r0x00, W
	BNZ	_00274_DS_
	MOVFF	r0x00, r0x03
	INCF	r0x00, F
	CLRF	r0x04
	MOVLW	LOW(_analogSend_buf_1_105)
	ADDWF	r0x03, F
	MOVLW	HIGH(_analogSend_buf_1_105)
	ADDWFC	r0x04, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVLW	0x42
	MOVWF	INDF0
_00274_DS_:
;	.line	213; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	buf[len++] = chan + 100;
	MOVFF	r0x00, r0x03
	INCF	r0x00, F
	CLRF	r0x04
	MOVLW	LOW(_analogSend_buf_1_105)
	ADDWF	r0x03, F
	MOVLW	HIGH(_analogSend_buf_1_105)
	ADDWFC	r0x04, F
	MOVLW	0x64
	BANKSEL	_analogSend_chan_1_105
	ADDWF	_analogSend_chan_1_105, W, B
	MOVWF	r0x07
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVFF	r0x07, INDF0
;	.line	214; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	buf[len++] = v >> 8;
	MOVFF	r0x00, r0x03
	INCF	r0x00, F
	CLRF	r0x04
	MOVLW	LOW(_analogSend_buf_1_105)
	ADDWF	r0x03, F
	MOVLW	HIGH(_analogSend_buf_1_105)
	ADDWFC	r0x04, F
	MOVF	r0x06, W
	MOVWF	r0x07
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVFF	r0x07, INDF0
;	.line	215; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	buf[len++] = v & 255;
	MOVFF	r0x00, r0x03
	INCF	r0x00, F
	CLRF	r0x04
	MOVLW	LOW(_analogSend_buf_1_105)
	ADDWF	r0x03, F
	MOVLW	HIGH(_analogSend_buf_1_105)
	ADDWFC	r0x04, F
	MOVF	r0x05, W
	MOVWF	r0x07
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVFF	r0x07, INDF0
	BRA	_00279_DS_
_00276_DS_:
;	.line	217; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	else printf("C A %d %d\n",chan,v);
	MOVFF	_analogSend_chan_1_105, r0x03
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(___str_0)
	MOVWF	POSTDEC1
	MOVLW	HIGH(___str_0)
	MOVWF	POSTDEC1
	MOVLW	LOW(___str_0)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x07
	ADDWF	FSR1L, F
	BRA	_00279_DS_
_00307_DS_:
	MOVFF	r0x02, r0x01
;	.line	220; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	if((len != 0) && (Mode & AMODE_NUM)) {
	MOVF	r0x00, W
	BZ	_00283_DS_
	BANKSEL	_Mode
	BTFSS	_Mode, 1, B
	BRA	_00283_DS_
;	.line	221; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	buf[len++] = '\n';
	MOVFF	r0x00, r0x02
	INCF	r0x00, F
	CLRF	r0x03
	MOVLW	LOW(_analogSend_buf_1_105)
	ADDWF	r0x02, F
	MOVLW	HIGH(_analogSend_buf_1_105)
	ADDWFC	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVLW	0x0a
	MOVWF	INDF0
;	.line	222; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	fraiseSend(buf,len);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVLW	HIGH(_analogSend_buf_1_105)
	MOVWF	POSTDEC1
	MOVLW	LOW(_analogSend_buf_1_105)
	MOVWF	POSTDEC1
	CALL	_fraiseSend
	MOVLW	0x04
	ADDWF	FSR1L, F
_00283_DS_:
;	.line	225; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	return count;		
	MOVF	r0x01, W
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_analog__analogService	code
_analogService:
;	.line	107; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	unsigned char analogService(void)
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
;	.line	113; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	if(ADCON0bits.GO) return chan;
	BTFSS	_ADCON0bits, 1
	BRA	_00166_DS_
	BANKSEL	_analogService_chan_1_98
	MOVF	_analogService_chan_1_98, W, B
	GOTO	_00183_DS_
_00166_DS_:
	BANKSEL	_analogService_conv_1_98
;	.line	115; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	if(conv) {
	MOVF	_analogService_conv_1_98, W, B
	BTFSC	STATUS, 2
	BRA	_00176_DS_
; ;multiply lit val:0x02 by variable _analogService_chan_1_98 and store in r0x00
	BANKSEL	_analogService_chan_1_98
;	.line	116; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	v = Value[chan];
	MOVF	_analogService_chan_1_98, W, B
	MULLW	0x02
	MOVF	PRODH, W
	MOVWF	r0x01
	MOVFF	PRODL, r0x00
	MOVLW	LOW(_Value)
	ADDWF	r0x00, F
	MOVLW	HIGH(_Value)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	POSTINC0, r0x00
	MOVFF	INDF0, r0x01
;	.line	118; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	pin = Pins[chan];
	MOVLW	LOW(_Pins)
; removed redundant BANKSEL
	ADDWF	_analogService_chan_1_98, W, B
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(_Pins)
	ADDWFC	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	INDF0, r0x02
;	.line	119; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	if(pin != 255) {
	MOVF	r0x02, W
	XORLW	0xff
	BNZ	_00213_DS_
	BRA	_00168_DS_
_00213_DS_:
;	.line	120; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	bitclr(*(&TRISA+(pin>>4)),pin&7);
	SWAPF	r0x02, W
	ANDLW	0x0f
	MOVWF	r0x03
	MOVLW	LOW(_TRISA)
	ADDWF	r0x03, W
	MOVWF	r0x04
	CLRF	r0x05
	MOVLW	HIGH(_TRISA)
	ADDWFC	r0x05, F
	CLRF	r0x06
	MOVLW	LOW(_TRISA)
	ADDWF	r0x03, F
	MOVLW	HIGH(_TRISA)
	ADDWFC	r0x06, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x06, FSR0H
	MOVFF	INDF0, r0x03
	MOVLW	0x07
	ANDWF	r0x02, W
	MOVWF	r0x06
	MOVLW	0x01
	MOVWF	r0x07
	MOVF	r0x06, W
	BZ	_00215_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00216_DS_:
	RLCF	r0x07, F
	ADDLW	0x01
	BNC	_00216_DS_
_00215_DS_:
	COMF	r0x07, W
; #	MOVWF	r0x06
; #	MOVF	r0x06, W
	MOVWF	r0x06
	ANDWF	r0x03, F
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, FSR0H
	MOVFF	r0x03, INDF0
;	.line	121; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	bitclr(*(&LATA+(pin>>4)),pin&7);
	SWAPF	r0x02, W
	ANDLW	0x0f
	MOVWF	r0x03
	MOVLW	LOW(_LATA)
	ADDWF	r0x03, W
	MOVWF	r0x04
	CLRF	r0x05
	MOVLW	HIGH(_LATA)
	ADDWFC	r0x05, F
	CLRF	r0x06
	MOVLW	LOW(_LATA)
	ADDWF	r0x03, F
	MOVLW	HIGH(_LATA)
	ADDWFC	r0x06, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x06, FSR0H
	MOVFF	INDF0, r0x03
	MOVLW	0x07
	ANDWF	r0x02, W
	MOVWF	r0x06
	MOVLW	0x01
	MOVWF	r0x07
	MOVF	r0x06, W
	BZ	_00219_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00220_DS_:
	RLCF	r0x07, F
	ADDLW	0x01
	BNC	_00220_DS_
_00219_DS_:
	COMF	r0x07, W
; #	MOVWF	r0x06
; #	MOVF	r0x06, W
	MOVWF	r0x06
	ANDWF	r0x03, F
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, FSR0H
	MOVFF	r0x03, INDF0
; ;multiply lit val:0x02 by variable _analogService_chan_1_98 and store in r0x03
_00168_DS_:
	BANKSEL	_analogService_chan_1_98
;	.line	123; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	Value[chan] = v - (v>>ANALOG_FILTER) + ADRESL+(ADRESH<<8); 
	MOVF	_analogService_chan_1_98, W, B
	MULLW	0x02
	MOVF	PRODH, W
	MOVWF	r0x04
	MOVFF	PRODL, r0x03
	MOVLW	LOW(_Value)
	ADDWF	r0x03, F
	MOVLW	HIGH(_Value)
	ADDWFC	r0x04, F
	RLCF	r0x01, W
	RRCF	r0x01, W
	MOVWF	r0x06
	RRCF	r0x00, W
	MOVWF	r0x05
	RLCF	r0x06, W
	RRCF	r0x06, F
	RRCF	r0x05, F
	RLCF	r0x06, W
	RRCF	r0x06, F
	RRCF	r0x05, F
	MOVF	r0x05, W
	SUBWF	r0x00, W
	MOVWF	r0x05
	MOVF	r0x06, W
	SUBWFB	r0x01, W
	MOVWF	r0x06
	MOVFF	_ADRESL, r0x07
	CLRF	r0x08
	MOVF	r0x07, W
	ADDWF	r0x05, F
	MOVF	r0x08, W
	ADDWFC	r0x06, F
	MOVFF	_ADRESH, r0x07
	CLRF	r0x08
	MOVF	r0x07, W
	MOVWF	r0x0a
	CLRF	r0x09
	MOVF	r0x09, W
	ADDWF	r0x05, F
	MOVF	r0x0a, W
	ADDWFC	r0x06, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVFF	r0x05, POSTINC0
	MOVFF	r0x06, INDF0
	BANKSEL	_Scaling
;	.line	124; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	if(Scaling == 1) {
	MOVF	_Scaling, W, B
	XORLW	0x01
	BZ	_00223_DS_
	BRA	_00174_DS_
; ;multiply lit val:0x02 by variable _analogService_chan_1_98 and store in r0x03
_00223_DS_:
	BANKSEL	_analogService_chan_1_98
;	.line	125; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	v = Value[chan];
	MOVF	_analogService_chan_1_98, W, B
	MULLW	0x02
	MOVF	PRODH, W
	MOVWF	r0x04
	MOVFF	PRODL, r0x03
	MOVLW	LOW(_Value)
	ADDWF	r0x03, W
	MOVWF	r0x05
	MOVLW	HIGH(_Value)
	ADDWFC	r0x04, W
	MOVWF	r0x06
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, FSR0H
	MOVFF	POSTINC0, r0x00
	MOVFF	INDF0, r0x01
;	.line	126; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	if(v < (Min[chan]-MINMAX_MARGIN)) Min[chan] = v+MINMAX_MARGIN;
	MOVLW	LOW(_Min)
	ADDWF	r0x03, F
	MOVLW	HIGH(_Min)
	ADDWFC	r0x04, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVFF	POSTINC0, r0x05
	MOVFF	INDF0, r0x06
	MOVLW	0x9c
	ADDWF	r0x05, F
	BTFSS	STATUS, 0
	DECF	r0x06, F
	MOVF	r0x01, W
	ADDLW	0x80
	MOVWF	PRODL
	MOVF	r0x06, W
	ADDLW	0x80
	SUBWF	PRODL, W
	BNZ	_00224_DS_
	MOVF	r0x05, W
	SUBWF	r0x00, W
_00224_DS_:
	BC	_00170_DS_
	MOVF	r0x00, W
	ADDLW	0x64
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x06
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVFF	r0x05, POSTINC0
	MOVFF	r0x06, INDF0
; ;multiply lit val:0x02 by variable _analogService_chan_1_98 and store in r0x03
_00170_DS_:
	BANKSEL	_analogService_chan_1_98
;	.line	127; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	if(v > (Max[chan]+MINMAX_MARGIN)) Max[chan] = v-MINMAX_MARGIN;
	MOVF	_analogService_chan_1_98, W, B
	MULLW	0x02
	MOVF	PRODH, W
	MOVWF	r0x04
	MOVFF	PRODL, r0x03
	MOVLW	LOW(_Max)
	ADDWF	r0x03, F
	MOVLW	HIGH(_Max)
	ADDWFC	r0x04, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVFF	POSTINC0, r0x05
	MOVFF	INDF0, r0x06
	MOVLW	0x64
	ADDWF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	MOVF	r0x06, W
	ADDLW	0x80
	MOVWF	PRODL
	MOVF	r0x01, W
	ADDLW	0x80
	SUBWF	PRODL, W
	BNZ	_00225_DS_
	MOVF	r0x00, W
	SUBWF	r0x05, W
_00225_DS_:
	BC	_00174_DS_
	MOVLW	0x9c
	ADDWF	r0x00, F
	BTFSS	STATUS, 0
	DECF	r0x01, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVFF	r0x00, POSTINC0
	MOVFF	r0x01, INDF0
_00174_DS_:
	BANKSEL	_analogService_conv_1_98
;	.line	129; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	conv=0;
	CLRF	_analogService_conv_1_98, B
_00176_DS_:
	BANKSEL	_analogService_chan_1_98
;	.line	132; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	chan++;
	INCF	_analogService_chan_1_98, F, B
;	.line	133; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	if(chan >= ANALOG_MAX_CHANNELS) chan = 0;
	MOVLW	0x10
; #	SUBWF	_analogService_chan_1_98, W, B
; #	BTFSS	STATUS, 0
; #	GOTO	_00178_DS_
; #	CLRF	_analogService_chan_1_98, B
; #	SWAPF	_analogService_chan_1_98, W, B
; removed redundant BANKSEL
;	.line	135; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	if(isSelected(chan))	{
	SUBWF	_analogService_chan_1_98, W, B
	BNC	_20435_DS_
; removed redundant BANKSEL
	CLRF	_analogService_chan_1_98, B
_20435_DS_:
	BANKSEL	_analogService_chan_1_98
	SWAPF	_analogService_chan_1_98, W, B
	RLNCF	WREG, W
	ANDLW	0x1f
	MOVWF	r0x00
	CLRF	r0x01
	MOVLW	LOW(_Selected)
	ADDWF	r0x00, F
	MOVLW	HIGH(_Selected)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	INDF0, r0x00
	MOVLW	0x07
; removed redundant BANKSEL
	ANDWF	_analogService_chan_1_98, W, B
	MOVWF	r0x01
	MOVLW	0x01
	MOVWF	r0x03
	MOVLW	0x00
	MOVWF	r0x04
	MOVF	r0x01, W
	BZ	_00228_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00229_DS_:
	RLCF	r0x03, F
	RLCF	r0x04, F
	ADDLW	0x01
	BNC	_00229_DS_
_00228_DS_:
	CLRF	r0x05
	MOVF	r0x00, W
	ANDWF	r0x03, F
	MOVF	r0x05, W
	ANDWF	r0x04, F
	MOVF	r0x03, W
	IORWF	r0x04, W
	BSF	STATUS, 0
	TSTFSZ	WREG
	BCF	STATUS, 0
	CLRF	r0x03
	RLCF	r0x03, F
	MOVF	r0x03, W
	BTFSS	STATUS, 2
	BRA	_00182_DS_
;	.line	136; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	ADCON0=(HWChan[chan] << 2) + 1;
	MOVLW	LOW(_HWChan)
	BANKSEL	_analogService_chan_1_98
	ADDWF	_analogService_chan_1_98, W, B
	MOVWF	r0x00
	CLRF	r0x01
	MOVLW	HIGH(_HWChan)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	INDF0, r0x00
	RLNCF	r0x00, W
	RLNCF	WREG, W
	ANDLW	0xfc
	MOVWF	r0x01
	INCF	r0x01, W
	MOVWF	_ADCON0
; removed redundant BANKSEL
;	.line	138; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	ANALOG_CHANNEL_PRECONF(chan);
	MOVF	_analogService_chan_1_98, W, B
	MOVWF	POSTDEC1
	CALL	_FSLP_analog_preconf
	MOVF	POSTINC1, F
;	.line	140; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	pin = Pins[chan];
	MOVLW	LOW(_Pins)
	BANKSEL	_analogService_chan_1_98
	ADDWF	_analogService_chan_1_98, W, B
	MOVWF	r0x00
	CLRF	r0x01
	MOVLW	HIGH(_Pins)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	INDF0, r0x02
;	.line	141; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	if(pin != 255) {
	MOVF	r0x02, W
	XORLW	0xff
	BNZ	_00232_DS_
	BRA	_00180_DS_
_00232_DS_:
;	.line	142; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	bitset(*(&TRISA+(pin>>4)),pin&7);// set channel to digital input
	SWAPF	r0x02, W
	ANDLW	0x0f
	MOVWF	r0x00
	MOVLW	LOW(_TRISA)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x03
	MOVLW	HIGH(_TRISA)
	ADDWFC	r0x03, F
	CLRF	r0x04
	MOVLW	LOW(_TRISA)
	ADDWF	r0x00, F
	MOVLW	HIGH(_TRISA)
	ADDWFC	r0x04, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x04, FSR0H
	MOVFF	INDF0, r0x00
	MOVLW	0x07
	ANDWF	r0x02, W
	MOVWF	r0x04
	MOVLW	0x01
	MOVWF	r0x05
	MOVF	r0x04, W
	BZ	_00234_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00235_DS_:
	RLCF	r0x05, F
	ADDLW	0x01
	BNC	_00235_DS_
_00234_DS_:
	MOVF	r0x05, W
	IORWF	r0x00, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	r0x00, INDF0
;	.line	143; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	bitset(*(__data unsigned char*)((int)&ANSELA + (pin>>4)),pin&7);// set channel to analog input
	MOVLW	LOW(_ANSELA)
	MOVWF	r0x00
	MOVLW	HIGH(_ANSELA)
	MOVWF	r0x01
	SWAPF	r0x02, W
	ANDLW	0x0f
	MOVWF	r0x03
	CLRF	r0x04
	MOVF	r0x03, W
	ADDWF	r0x00, F
	MOVF	r0x04, W
	ADDWFC	r0x01, F
	MOVLW	LOW(_ANSELA)
	MOVWF	r0x05
	MOVLW	HIGH(_ANSELA)
	MOVWF	r0x06
	MOVF	r0x05, W
	ADDWF	r0x03, F
	MOVF	r0x06, W
	ADDWFC	r0x04, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVFF	INDF0, r0x03
	MOVLW	0x07
	ANDWF	r0x02, F
	MOVLW	0x01
	MOVWF	r0x04
	MOVF	r0x02, W
	BZ	_00238_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00239_DS_:
	RLCF	r0x04, F
	ADDLW	0x01
	BNC	_00239_DS_
_00238_DS_:
	MOVF	r0x04, W
	IORWF	r0x03, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	r0x03, INDF0
	BANKSEL	_CTMUCONHbits
;	.line	144; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	CTMUCONHbits.IDISSEN = 1;		// Drain any charge on the A/D circuit
	BSF	_CTMUCONHbits, 1, B
	nop	
	nop	
;	.line	146; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	CTMUCONHbits.IDISSEN =  0;		// Stop discharge of A/D circuit
	BCF	_CTMUCONHbits, 1, B
	BANKSEL	_CTMUCONLbits
;	.line	147; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	CTMUCONLbits.EDG2STAT = 0;		// Make sure edge2 is 0
	BCF	_CTMUCONLbits, 1, B
;	.line	156; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	}			
	MOVFF	r0x0b, POSTDEC1
	MOVFF	INTCON, r0x0b
	BCF	INTCON, 7
; removed redundant BANKSEL
;	.line	149; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	CTMUCONLbits.EDG1STAT = 1;	// Set edge1 - Start Charge
	BSF	_CTMUCONLbits, 0, B
	nop	
	nop	
	nop	
	nop	
	nop	
	nop	
	nop	
	nop	
	nop	
	nop	
	nop	
	nop	
	nop	
	nop	
	nop	
	nop	
	nop	
	nop	
	nop	
	nop	
;	.line	155; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	CTMUCONLbits.EDG1STAT = 0;	//Clear edge1 - Stop Charge
	BCF	_CTMUCONLbits, 0, B
	BTFSC	r0x0b, 7
	BSF	INTCON, 7
	MOVFF	PREINC1, r0x0b
_00180_DS_:
;	.line	158; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	ADCON0bits.GO = 1;
	BSF	_ADCON0bits, 1
;	.line	159; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	conv = 1;
	MOVLW	0x01
	BANKSEL	_analogService_conv_1_98
	MOVWF	_analogService_conv_1_98, B
_00182_DS_:
	BANKSEL	_analogService_chan_1_98
;	.line	162; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	return chan;
	MOVF	_analogService_chan_1_98, W, B
_00183_DS_:
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_analog__analogDeselect	code
_analogDeselect:
;	.line	98; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	void analogDeselect(unsigned char chan)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	100; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	bitclr(Selected[chan>>3],chan&7);
	SWAPF	r0x00, W
	RLNCF	WREG, W
	ANDLW	0x1f
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	LOW(_Selected)
	ADDWF	r0x01, F
	MOVLW	HIGH(_Selected)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	INDF0, r0x03
	MOVLW	0x07
	ANDWF	r0x00, F
	MOVLW	0x01
	MOVWF	r0x04
	MOVF	r0x00, W
	BZ	_00159_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00160_DS_:
	RLCF	r0x04, F
	ADDLW	0x01
	BNC	_00160_DS_
_00159_DS_:
	COMF	r0x04, W
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
	ANDWF	r0x03, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	r0x03, INDF0
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_analog__analogSelectAdcTouch	code
_analogSelectAdcTouch:
;	.line	91; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	void analogSelectAdcTouch(unsigned char chan,unsigned char hwchan, unsigned char *port, unsigned char bit)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
;	.line	93; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	bitset(Selected[chan>>3],chan&7);
	SWAPF	r0x00, W
	RLNCF	WREG, W
	ANDLW	0x1f
	MOVWF	r0x06
	CLRF	r0x07
	MOVLW	LOW(_Selected)
	ADDWF	r0x06, F
	MOVLW	HIGH(_Selected)
	ADDWFC	r0x07, F
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, FSR0H
	MOVFF	INDF0, r0x08
	MOVLW	0x07
	ANDWF	r0x00, W
	MOVWF	r0x09
	MOVLW	0x01
	MOVWF	r0x0a
	MOVF	r0x09, W
	BZ	_00150_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00151_DS_:
	RLCF	r0x0a, F
	ADDLW	0x01
	BNC	_00151_DS_
_00150_DS_:
	MOVF	r0x0a, W
	IORWF	r0x08, F
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, FSR0H
	MOVFF	r0x08, INDF0
;	.line	94; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	HWChan[chan]=hwchan;
	MOVLW	LOW(_HWChan)
	ADDWF	r0x00, W
	MOVWF	r0x06
	CLRF	r0x07
	MOVLW	HIGH(_HWChan)
	ADDWFC	r0x07, F
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, FSR0H
	MOVFF	r0x01, INDF0
;	.line	95; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	Pins[chan]=(((unsigned int)(port-&PORTA)&7)<<4) + (bit&7);
	CLRF	r0x01
	MOVLW	LOW(_Pins)
	ADDWF	r0x00, F
	MOVLW	HIGH(_Pins)
	ADDWFC	r0x01, F
	MOVLW	LOW(_PORTA)
	SUBWF	r0x02, F
	MOVLW	0x07
	ANDWF	r0x02, F
	SWAPF	r0x02, W
	ANDLW	0xf0
	MOVWF	r0x03
	MOVLW	0x07
	ANDWF	r0x05, F
	MOVF	r0x05, W
	ADDWF	r0x03, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	r0x03, INDF0
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_analog__analogSelectAdc	code
_analogSelectAdc:
;	.line	84; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	void analogSelectAdc(unsigned char chan,unsigned char hwchan )
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
;	.line	86; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	bitset(Selected[chan>>3],chan&7);
	SWAPF	r0x00, W
	RLNCF	WREG, W
	ANDLW	0x1f
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	LOW(_Selected)
	ADDWF	r0x02, F
	MOVLW	HIGH(_Selected)
	ADDWFC	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	INDF0, r0x04
	MOVLW	0x07
	ANDWF	r0x00, W
	MOVWF	r0x05
	MOVLW	0x01
	MOVWF	r0x06
	MOVF	r0x05, W
	BZ	_00141_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00142_DS_:
	RLCF	r0x06, F
	ADDLW	0x01
	BNC	_00142_DS_
_00141_DS_:
	MOVF	r0x06, W
	IORWF	r0x04, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	r0x04, INDF0
;	.line	87; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	HWChan[chan]=hwchan;
	MOVLW	LOW(_HWChan)
	ADDWF	r0x00, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(_HWChan)
	ADDWFC	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	r0x01, INDF0
;	.line	88; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	Pins[chan]=255;
	CLRF	r0x01
	MOVLW	LOW(_Pins)
	ADDWF	r0x00, F
	MOVLW	HIGH(_Pins)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVLW	0xff
	SETF	INDF0
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_analog__analogInitTouch	code
_analogInitTouch:
	BANKSEL	_CTMUCONH
;	.line	78; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	CTMUCONH = 0x00;
	CLRF	_CTMUCONH, B
;	.line	79; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	CTMUCONL = 0x90;
	MOVLW	0x90
	BANKSEL	_CTMUCONL
	MOVWF	_CTMUCONL, B
;	.line	80; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	CTMUICON = 0x03;			//55uA
	MOVLW	0x03
	BANKSEL	_CTMUICON
	MOVWF	_CTMUICON, B
	BANKSEL	_CTMUCONHbits
;	.line	81; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	CTMUCONHbits.CTMUEN = 1;	//Enable CTMU
	BSF	_CTMUCONHbits, 7, B
	RETURN	

; ; Starting pCode block
S_analog__analogInit	code
_analogInit:
;	.line	52; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	void analogInit()
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
;	.line	56; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	for(i=0;i<CHANNELS_GROUPS;i++) {
	CLRF	r0x00
_00107_DS_:
;	.line	57; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	Selected[i]=0;
	MOVLW	LOW(_Selected)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_Selected)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	CLRF	INDF0
;	.line	56; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	for(i=0;i<CHANNELS_GROUPS;i++) {
	INCF	r0x00, F
	MOVLW	0x02
	SUBWF	r0x00, W
	BNC	_00107_DS_
;	.line	60; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	for(i=0;i<ANALOG_MAX_CHANNELS;i++) {
	CLRF	r0x00
; ;multiply lit val:0x02 by variable r0x00 and store in r0x01
_00109_DS_:
;	.line	61; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	Value[i]=0;
	MOVF	r0x00, W
	MULLW	0x02
	MOVF	PRODH, W
	MOVWF	r0x02
	MOVFF	PRODL, r0x01
	MOVLW	LOW(_Value)
	ADDWF	r0x01, W
	MOVWF	r0x03
	MOVLW	HIGH(_Value)
	ADDWFC	r0x02, W
	MOVWF	r0x04
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	CLRF	POSTINC0
	CLRF	INDF0
;	.line	62; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	inValue[i]=0;
	MOVLW	LOW(_inValue)
	ADDWF	r0x01, W
	MOVWF	r0x03
	MOVLW	HIGH(_inValue)
	ADDWFC	r0x02, W
	MOVWF	r0x04
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	CLRF	POSTINC0
	CLRF	INDF0
;	.line	63; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	oldValue[i]=0;
	MOVLW	LOW(_oldValue)
	ADDWF	r0x01, W
	MOVWF	r0x03
	MOVLW	HIGH(_oldValue)
	ADDWFC	r0x02, W
	MOVWF	r0x04
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	CLRF	POSTINC0
	CLRF	INDF0
;	.line	64; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	Min[i]=0;
	MOVLW	LOW(_Min)
	ADDWF	r0x01, W
	MOVWF	r0x03
	MOVLW	HIGH(_Min)
	ADDWFC	r0x02, W
	MOVWF	r0x04
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	CLRF	POSTINC0
	CLRF	INDF0
;	.line	65; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	Max[i]=0x7FFF;
	MOVLW	LOW(_Max)
	ADDWF	r0x01, F
	MOVLW	HIGH(_Max)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	SETF	POSTINC0
	MOVLW	0x7f
	MOVWF	INDF0
;	.line	66; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	Pins[i]=255;
	MOVLW	LOW(_Pins)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_Pins)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	SETF	INDF0
;	.line	60; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	for(i=0;i<ANALOG_MAX_CHANNELS;i++) {
	INCF	r0x00, F
	MOVLW	0x10
	SUBWF	r0x00, W
	BTFSS	STATUS, 0
	BRA	_00109_DS_
;	.line	69; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	ADCON2=0b10101111; //right justified, 12 AD, RC
	MOVLW	0xaf
	MOVWF	_ADCON2
;	.line	70; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	ADCON1=0; //0->Vdd
	CLRF	_ADCON1
;	.line	71; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	ADCON0=1; //on, channel 0
	MOVLW	0x01
	MOVWF	_ADCON0
;	.line	73; C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c	ADCON0bits.GO=1; // go !
	BSF	_ADCON0bits, 1
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
___str_0:
	DB	0x43, 0x20, 0x41, 0x20, 0x25, 0x64, 0x20, 0x25, 0x64, 0x0a, 0x00


; Statistics:
; code size:	 4362 (0x110a) bytes ( 3.33%)
;           	 2181 (0x0885) words
; udata size:	  226 (0x00e2) bytes ( 6.14%)
; access size:	   13 (0x000d) bytes


	end
