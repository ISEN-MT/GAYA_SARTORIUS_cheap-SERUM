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
	global	_switchInit
	global	_switchSelectHW
	global	_switchDeselect
	global	_switchService
	global	_switchSend
	global	_switchGet

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

;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
WREG	equ	0xfe8
FSR0L	equ	0xfe9
FSR0H	equ	0xfea
FSR1L	equ	0xfe1
FSR2L	equ	0xfd9
INDF0	equ	0xfef
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PLUSW2	equ	0xfdb


	idata
_switchSend_chan_1_94	db	0x00


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

udata_switch_0	udata
_oldStates	res	2

udata_switch_1	udata
_States	res	2

udata_switch_2	udata
_Pins	res	16

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_switch__switchGet	code
_switchGet:
;	.line	108; C:/Users/sarto/Documents/Pd/externals/Fraise/switch/switch.c	char switchGet(unsigned char chan)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	110; C:/Users/sarto/Documents/Pd/externals/Fraise/switch/switch.c	return CHANISSET(chan);
	SWAPF	r0x00, W
	RLNCF	WREG, W
	ANDLW	0x1f
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	LOW(_States)
	ADDWF	r0x01, F
	MOVLW	HIGH(_States)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	INDF0, r0x01
	MOVLW	0x07
	ANDWF	r0x00, F
	MOVLW	0x01
	MOVWF	r0x02
	MOVLW	0x00
	MOVWF	r0x03
	MOVF	r0x00, W
	BZ	_00237_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00238_DS_:
	RLCF	r0x02, F
	RLCF	r0x03, F
	ADDLW	0x01
	BNC	_00238_DS_
_00237_DS_:
	CLRF	r0x04
	MOVF	r0x01, W
	ANDWF	r0x02, F
	MOVF	r0x04, W
	ANDWF	r0x03, F
	MOVF	r0x02, W
	IORWF	r0x03, W
	BSF	STATUS, 0
	TSTFSZ	WREG
	BCF	STATUS, 0
	CLRF	r0x02
	RLCF	r0x02, F
	MOVF	r0x02, W
	BSF	STATUS, 0
	TSTFSZ	WREG
	BCF	STATUS, 0
	CLRF	r0x02
	RLCF	r0x02, F
	MOVF	r0x02, W
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_switch__switchSend	code
_switchSend:
;	.line	83; C:/Users/sarto/Documents/Pd/externals/Fraise/switch/switch.c	char switchSend(void)
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
;	.line	86; C:/Users/sarto/Documents/Pd/externals/Fraise/switch/switch.c	unsigned char count=0,pin,set;
	CLRF	r0x00
;	.line	88; C:/Users/sarto/Documents/Pd/externals/Fraise/switch/switch.c	while(count<4) {
	CLRF	r0x01
_00188_DS_:
	MOVLW	0x04
	SUBWF	r0x01, W
	BTFSC	STATUS, 0
	BRA	_00190_DS_
;	.line	89; C:/Users/sarto/Documents/Pd/externals/Fraise/switch/switch.c	pin=Pins[chan];
	MOVLW	LOW(_Pins)
	BANKSEL	_switchSend_chan_1_94
	ADDWF	_switchSend_chan_1_94, W, B
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(_Pins)
	ADDWFC	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	INDF0, r0x02
;	.line	90; C:/Users/sarto/Documents/Pd/externals/Fraise/switch/switch.c	if(pin != 255) {
	MOVF	r0x02, W
	XORLW	0xff
	BNZ	_00213_DS_
	BRA	_00185_DS_
_00213_DS_:
	BANKSEL	_switchSend_chan_1_94
;	.line	91; C:/Users/sarto/Documents/Pd/externals/Fraise/switch/switch.c	set=CHANISSET(chan);
	SWAPF	_switchSend_chan_1_94, W, B
	RLNCF	WREG, W
	ANDLW	0x1f
	MOVWF	r0x02
	MOVLW	LOW(_States)
	ADDWF	r0x02, W
	MOVWF	r0x03
	CLRF	r0x04
	MOVLW	HIGH(_States)
	ADDWFC	r0x04, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVFF	INDF0, r0x03
	MOVLW	0x07
; removed redundant BANKSEL
	ANDWF	_switchSend_chan_1_94, W, B
	MOVWF	r0x04
	MOVLW	0x01
	MOVWF	r0x05
	MOVLW	0x00
	MOVWF	r0x06
	MOVF	r0x04, W
	BZ	_00215_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00216_DS_:
	RLCF	r0x05, F
	RLCF	r0x06, F
	ADDLW	0x01
	BNC	_00216_DS_
_00215_DS_:
	CLRF	r0x07
	MOVF	r0x05, W
	ANDWF	r0x03, F
	MOVF	r0x06, W
	ANDWF	r0x07, F
	MOVF	r0x03, W
	IORWF	r0x07, W
	BSF	STATUS, 0
	TSTFSZ	WREG
	BCF	STATUS, 0
	CLRF	r0x03
	RLCF	r0x03, F
	MOVF	r0x03, W
	BSF	STATUS, 0
	TSTFSZ	WREG
	BCF	STATUS, 0
	CLRF	r0x03
	RLCF	r0x03, F
;	.line	92; C:/Users/sarto/Documents/Pd/externals/Fraise/switch/switch.c	if(set!=OLDCHANISSET(chan)) {
	CLRF	r0x07
	MOVLW	LOW(_oldStates)
	ADDWF	r0x02, F
	MOVLW	HIGH(_oldStates)
	ADDWFC	r0x07, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x07, FSR0H
	MOVFF	INDF0, r0x08
	MOVFF	r0x08, r0x09
	CLRF	r0x0a
	MOVF	r0x09, W
	ANDWF	r0x05, F
	MOVF	r0x0a, W
	ANDWF	r0x06, F
	MOVF	r0x05, W
	IORWF	r0x06, W
	BSF	STATUS, 0
	TSTFSZ	WREG
	BCF	STATUS, 0
	CLRF	r0x05
	RLCF	r0x05, F
	MOVF	r0x05, W
	BSF	STATUS, 0
	TSTFSZ	WREG
	BCF	STATUS, 0
	CLRF	r0x05
	RLCF	r0x05, F
	MOVF	r0x03, W
	XORWF	r0x05, W
	BNZ	_00220_DS_
	BRA	_00185_DS_
_00220_DS_:
;	.line	93; C:/Users/sarto/Documents/Pd/externals/Fraise/switch/switch.c	if(set) OLDCHANSET(chan);
	MOVF	r0x03, W
	BZ	_00180_DS_
	MOVLW	0x01
	MOVWF	r0x05
	MOVF	r0x04, W
	BZ	_00221_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00222_DS_:
	RLCF	r0x05, F
	ADDLW	0x01
	BNC	_00222_DS_
_00221_DS_:
	MOVF	r0x05, W
	IORWF	r0x08, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x07, FSR0H
	MOVFF	r0x08, INDF0
	BRA	_00181_DS_
_00180_DS_:
;	.line	94; C:/Users/sarto/Documents/Pd/externals/Fraise/switch/switch.c	else OLDCHANCLR(chan);
	MOVFF	r0x02, FSR0L
	MOVFF	r0x07, FSR0H
	MOVFF	INDF0, r0x05
	MOVLW	0x01
	MOVWF	r0x06
	MOVF	r0x04, W
	BZ	_00224_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00225_DS_:
	RLCF	r0x06, F
	ADDLW	0x01
	BNC	_00225_DS_
_00224_DS_:
	COMF	r0x06, W
; #	MOVWF	r0x04
; #	MOVF	r0x04, W
	ANDWF	r0x05, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x07, FSR0H
	MOVFF	r0x05, INDF0
_00181_DS_:
;	.line	95; C:/Users/sarto/Documents/Pd/externals/Fraise/switch/switch.c	printf("C s %d %d\n",chan,set==0);
	MOVF	r0x03, W
	BNZ	_00227_DS_
	CLRF	r0x03
	INCF	r0x03, F
	BRA	_00228_DS_
_00227_DS_:
	CLRF	r0x03
_00228_DS_:
	MOVFF	_switchSend_chan_1_94, r0x04
	CLRF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CLRF	POSTDEC1
	MOVF	r0x04, W
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
;	.line	96; C:/Users/sarto/Documents/Pd/externals/Fraise/switch/switch.c	count++;
	INCF	r0x01, F
	MOVFF	r0x01, r0x00
_00185_DS_:
	BANKSEL	_switchSend_chan_1_94
;	.line	99; C:/Users/sarto/Documents/Pd/externals/Fraise/switch/switch.c	chan++;
	INCF	_switchSend_chan_1_94, F, B
;	.line	100; C:/Users/sarto/Documents/Pd/externals/Fraise/switch/switch.c	if(chan>=MAX_CHANNELS) {
	MOVLW	0x10
; removed redundant BANKSEL
	SUBWF	_switchSend_chan_1_94, W, B
	BTFSS	STATUS, 0
	BRA	_00188_DS_
; removed redundant BANKSEL
;	.line	101; C:/Users/sarto/Documents/Pd/externals/Fraise/switch/switch.c	chan=0;
	CLRF	_switchSend_chan_1_94, B
_00190_DS_:
;	.line	105; C:/Users/sarto/Documents/Pd/externals/Fraise/switch/switch.c	return count;
	MOVF	r0x00, W
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
S_switch__switchService	code
_switchService:
;	.line	70; C:/Users/sarto/Documents/Pd/externals/Fraise/switch/switch.c	void switchService(void)
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
;	.line	74; C:/Users/sarto/Documents/Pd/externals/Fraise/switch/switch.c	for(i=0;i<MAX_CHANNELS;i++) {
	CLRF	r0x00
_00146_DS_:
;	.line	75; C:/Users/sarto/Documents/Pd/externals/Fraise/switch/switch.c	pin=Pins[i];
	MOVLW	LOW(_Pins)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_Pins)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	INDF0, r0x01
;	.line	76; C:/Users/sarto/Documents/Pd/externals/Fraise/switch/switch.c	if(pin != 255) {
	MOVF	r0x01, W
	XORLW	0xff
	BNZ	_00161_DS_
	BRA	_00147_DS_
_00161_DS_:
;	.line	77; C:/Users/sarto/Documents/Pd/externals/Fraise/switch/switch.c	if(bittst(*(&PORTA+(pin>>4)),pin&7)) CHANSET(i);
	SWAPF	r0x01, W
	ANDLW	0x0f
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	LOW(_PORTA)
	ADDWF	r0x02, F
	MOVLW	HIGH(_PORTA)
	ADDWFC	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	INDF0, r0x02
	MOVLW	0x07
	ANDWF	r0x01, F
	MOVLW	0x01
	MOVWF	r0x03
	MOVLW	0x00
	MOVWF	r0x04
	MOVF	r0x01, W
	BZ	_00163_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00164_DS_:
	RLCF	r0x03, F
	RLCF	r0x04, F
	ADDLW	0x01
	BNC	_00164_DS_
_00163_DS_:
	CLRF	r0x05
	MOVF	r0x02, W
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
	BNZ	_00141_DS_
	SWAPF	r0x00, W
	RLNCF	WREG, W
	ANDLW	0x1f
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	LOW(_States)
	ADDWF	r0x01, F
	MOVLW	HIGH(_States)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	INDF0, r0x03
	MOVLW	0x07
	ANDWF	r0x00, W
	MOVWF	r0x04
	MOVLW	0x01
	MOVWF	r0x05
	MOVF	r0x04, W
	BZ	_00167_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00168_DS_:
	RLCF	r0x05, F
	ADDLW	0x01
	BNC	_00168_DS_
_00167_DS_:
	MOVF	r0x05, W
	IORWF	r0x03, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	r0x03, INDF0
	BRA	_00147_DS_
_00141_DS_:
;	.line	78; C:/Users/sarto/Documents/Pd/externals/Fraise/switch/switch.c	else CHANCLR(i);
	SWAPF	r0x00, W
	RLNCF	WREG, W
	ANDLW	0x1f
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	LOW(_States)
	ADDWF	r0x01, F
	MOVLW	HIGH(_States)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	INDF0, r0x03
	MOVLW	0x07
	ANDWF	r0x00, W
	MOVWF	r0x04
	MOVLW	0x01
	MOVWF	r0x05
	MOVF	r0x04, W
	BZ	_00171_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00172_DS_:
	RLCF	r0x05, F
	ADDLW	0x01
	BNC	_00172_DS_
_00171_DS_:
	COMF	r0x05, W
; #	MOVWF	r0x04
; #	MOVF	r0x04, W
	ANDWF	r0x03, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	r0x03, INDF0
_00147_DS_:
;	.line	74; C:/Users/sarto/Documents/Pd/externals/Fraise/switch/switch.c	for(i=0;i<MAX_CHANNELS;i++) {
	INCF	r0x00, F
	MOVLW	0x10
	SUBWF	r0x00, W
	BTFSS	STATUS, 0
	BRA	_00146_DS_
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_switch__switchDeselect	code
_switchDeselect:
;	.line	65; C:/Users/sarto/Documents/Pd/externals/Fraise/switch/switch.c	void switchDeselect(unsigned char channel)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	67; C:/Users/sarto/Documents/Pd/externals/Fraise/switch/switch.c	Pins[channel] = 255;
	CLRF	r0x01
	MOVLW	LOW(_Pins)
	ADDWF	r0x00, F
	MOVLW	HIGH(_Pins)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVLW	0xff
	SETF	INDF0
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_switch__switchSelectHW	code
_switchSelectHW:
;	.line	60; C:/Users/sarto/Documents/Pd/externals/Fraise/switch/switch.c	void switchSelectHW(unsigned char channel, unsigned char *port, unsigned char bit)
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
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
;	.line	62; C:/Users/sarto/Documents/Pd/externals/Fraise/switch/switch.c	Pins[channel] = (((unsigned int)(port-&PORTA)&7)<<4) + (bit&7);
	CLRF	r0x05
	MOVLW	LOW(_Pins)
	ADDWF	r0x00, F
	MOVLW	HIGH(_Pins)
	ADDWFC	r0x05, F
	MOVLW	LOW(_PORTA)
	SUBWF	r0x01, F
	MOVLW	0x07
	ANDWF	r0x01, F
	SWAPF	r0x01, W
	ANDLW	0xf0
	MOVWF	r0x02
	MOVLW	0x07
	ANDWF	r0x04, F
	MOVF	r0x04, W
	ADDWF	r0x02, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x05, FSR0H
	MOVFF	r0x02, INDF0
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_switch__switchInit	code
_switchInit:
;	.line	47; C:/Users/sarto/Documents/Pd/externals/Fraise/switch/switch.c	void switchInit()
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
;	.line	51; C:/Users/sarto/Documents/Pd/externals/Fraise/switch/switch.c	for(i=0;i<CHANNELS_GROUPS;i++) {
	CLRF	r0x00
_00107_DS_:
;	.line	52; C:/Users/sarto/Documents/Pd/externals/Fraise/switch/switch.c	oldStates[i] = States[i] = 1;
	MOVLW	LOW(_oldStates)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_oldStates)
	ADDWFC	r0x02, F
	MOVLW	LOW(_States)
	ADDWF	r0x00, W
	MOVWF	r0x03
	CLRF	r0x04
	MOVLW	HIGH(_States)
	ADDWFC	r0x04, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVLW	0x01
	MOVWF	INDF0
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVWF	INDF0
;	.line	51; C:/Users/sarto/Documents/Pd/externals/Fraise/switch/switch.c	for(i=0;i<CHANNELS_GROUPS;i++) {
	INCF	r0x00, F
	MOVLW	0x02
	SUBWF	r0x00, W
	BNC	_00107_DS_
;	.line	55; C:/Users/sarto/Documents/Pd/externals/Fraise/switch/switch.c	for(i=0;i<MAX_CHANNELS;i++) {
	CLRF	r0x00
_00109_DS_:
;	.line	56; C:/Users/sarto/Documents/Pd/externals/Fraise/switch/switch.c	Pins[i] = 255;
	MOVLW	LOW(_Pins)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_Pins)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	SETF	INDF0
;	.line	55; C:/Users/sarto/Documents/Pd/externals/Fraise/switch/switch.c	for(i=0;i<MAX_CHANNELS;i++) {
	INCF	r0x00, F
	MOVLW	0x10
	SUBWF	r0x00, W
	BNC	_00109_DS_
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
___str_0:
	DB	0x43, 0x20, 0x73, 0x20, 0x25, 0x64, 0x20, 0x25, 0x64, 0x0a, 0x00


; Statistics:
; code size:	 1264 (0x04f0) bytes ( 0.96%)
;           	  632 (0x0278) words
; udata size:	   20 (0x0014) bytes ( 0.54%)
; access size:	   11 (0x000b) bytes


	end
