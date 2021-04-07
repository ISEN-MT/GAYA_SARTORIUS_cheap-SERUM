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
	global	_setup
	global	_loop
	global	_fraiseReceiveChar
	global	_mainDelay

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
	extern	_putchar
	extern	_time
	extern	_fraiseService
	extern	_fraiseGetChar
	extern	_fraiseGetLen
	extern	_fruitInit
	extern	_analogSelectAdc
	extern	_analogInit
	extern	_analogService
	extern	_analogSend

;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
FSR0L	equ	0xfe9
FSR0H	equ	0xfea
FSR1L	equ	0xfe1
INDF0	equ	0xfef
POSTINC1	equ	0xfe6
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PRODL	equ	0xff3
PRODH	equ	0xff4


; Internal registers
.registers	udata_ovr	0x0000
r0x00	res	1
r0x01	res	1
r0x02	res	1
r0x03	res	1
r0x05	res	1

udata_main_0	udata
_mainDelay	res	4

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_main__fraiseReceiveChar	code
_fraiseReceiveChar:
;	.line	51; C:/Users/sarto/Documents/Travail/M1/M&T/GAYA_SARTORIUS_cheap-SERUM/firmware1/main.c	void fraiseReceiveChar() // receive text
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
;	.line	55; C:/Users/sarto/Documents/Travail/M1/M&T/GAYA_SARTORIUS_cheap-SERUM/firmware1/main.c	c=fraiseGetChar();
	CALL	_fraiseGetChar
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
;	.line	56; C:/Users/sarto/Documents/Travail/M1/M&T/GAYA_SARTORIUS_cheap-SERUM/firmware1/main.c	if(c=='L'){		//switch LED on/off 
	MOVWF	r0x00
	XORLW	0x4c
	BNZ	_00183_DS_
;	.line	57; C:/Users/sarto/Documents/Travail/M1/M&T/GAYA_SARTORIUS_cheap-SERUM/firmware1/main.c	c=fraiseGetChar();
	CALL	_fraiseGetChar
; #	MOVWF	r0x00
; #	MOVF	r0x00, W
;	.line	58; C:/Users/sarto/Documents/Travail/M1/M&T/GAYA_SARTORIUS_cheap-SERUM/firmware1/main.c	digitalWrite(LED, c!='0');		
	XORLW	0x30
	BZ	_00172_DS_
	BSF	_LATCbits, 1
	BRA	_00185_DS_
_00172_DS_:
	BCF	_LATCbits, 1
	BRA	_00185_DS_
_00183_DS_:
;	.line	60; C:/Users/sarto/Documents/Travail/M1/M&T/GAYA_SARTORIUS_cheap-SERUM/firmware1/main.c	else if(c=='E') { 	// echo text (send it back to host)
	MOVF	r0x00, W
	XORLW	0x45
	BNZ	_00185_DS_
;	.line	61; C:/Users/sarto/Documents/Travail/M1/M&T/GAYA_SARTORIUS_cheap-SERUM/firmware1/main.c	printf("C");
	MOVLW	UPPER(___str_0)
	MOVWF	POSTDEC1
	MOVLW	HIGH(___str_0)
	MOVWF	POSTDEC1
	MOVLW	LOW(___str_0)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	62; C:/Users/sarto/Documents/Travail/M1/M&T/GAYA_SARTORIUS_cheap-SERUM/firmware1/main.c	c = fraiseGetLen(); 			// get length of current packet
	CALL	_fraiseGetLen
	MOVWF	r0x00
_00177_DS_:
;	.line	63; C:/Users/sarto/Documents/Travail/M1/M&T/GAYA_SARTORIUS_cheap-SERUM/firmware1/main.c	while(c--) printf("%c",fraiseGetChar());// send each received byte
	MOVFF	r0x00, r0x01
	DECF	r0x00, F
	MOVF	r0x01, W
	BZ	_00179_DS_
	CALL	_fraiseGetChar
	CLRF	POSTDEC1
	MOVWF	POSTDEC1
	MOVLW	UPPER(___str_1)
	MOVWF	POSTDEC1
	MOVLW	HIGH(___str_1)
	MOVWF	POSTDEC1
	MOVLW	LOW(___str_1)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x05
	ADDWF	FSR1L, F
	BRA	_00177_DS_
_00179_DS_:
;	.line	64; C:/Users/sarto/Documents/Travail/M1/M&T/GAYA_SARTORIUS_cheap-SERUM/firmware1/main.c	putchar('\n');				// end of line
	MOVLW	0x0a
	CALL	_putchar
_00185_DS_:
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__loop	code
_loop:
;	.line	37; C:/Users/sarto/Documents/Travail/M1/M&T/GAYA_SARTORIUS_cheap-SERUM/firmware1/main.c	void loop() {
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
;	.line	39; C:/Users/sarto/Documents/Travail/M1/M&T/GAYA_SARTORIUS_cheap-SERUM/firmware1/main.c	fraiseService();	// listen to Fraise events
	CALL	_fraiseService
;	.line	40; C:/Users/sarto/Documents/Travail/M1/M&T/GAYA_SARTORIUS_cheap-SERUM/firmware1/main.c	analogService();	// analog management routine
	CALL	_analogService
;	.line	42; C:/Users/sarto/Documents/Travail/M1/M&T/GAYA_SARTORIUS_cheap-SERUM/firmware1/main.c	if(delayFinished(mainDelay)) // when mainDelay triggers :
	CALL	_time
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	FSR0L, r0x03
	BANKSEL	_mainDelay
	MOVF	_mainDelay, W, B
	SUBWF	r0x00, F
; removed redundant BANKSEL
	MOVF	(_mainDelay + 1), W, B
	SUBWFB	r0x01, F
; removed redundant BANKSEL
	MOVF	(_mainDelay + 2), W, B
	SUBWFB	r0x02, F
; removed redundant BANKSEL
	MOVF	(_mainDelay + 3), W, B
	SUBWFB	r0x03, F
	BCF	r0x03, 7
	MOVLW	0x3f
	SUBWF	r0x03, W
	BNZ	_00166_DS_
	MOVLW	0xff
	SUBWF	r0x02, W
	BNZ	_00166_DS_
	MOVLW	0xff
	SUBWF	r0x01, W
	BNZ	_00166_DS_
	MOVLW	0xff
	SUBWF	r0x00, W
_00166_DS_:
	BC	_00160_DS_
;	.line	44; C:/Users/sarto/Documents/Travail/M1/M&T/GAYA_SARTORIUS_cheap-SERUM/firmware1/main.c	delayStart(mainDelay, 5000); 	// re-init mainDelay
	CALL	_time
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	FSR0L, r0x03
	ADDLW	0x88
	BANKSEL	_mainDelay
	MOVWF	_mainDelay, B
	MOVLW	0x13
	ADDWFC	r0x01, W
; removed redundant BANKSEL
	MOVWF	(_mainDelay + 1), B
	MOVLW	0x00
	ADDWFC	r0x02, W
; removed redundant BANKSEL
	MOVWF	(_mainDelay + 2), B
	MOVLW	0x00
	ADDWFC	r0x03, W
; removed redundant BANKSEL
	MOVWF	(_mainDelay + 3), B
;	.line	45; C:/Users/sarto/Documents/Travail/M1/M&T/GAYA_SARTORIUS_cheap-SERUM/firmware1/main.c	analogSend();		// send analog channels that changed
	CALL	_analogSend
_00160_DS_:
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__setup	code
_setup:
;	.line	13; C:/Users/sarto/Documents/Travail/M1/M&T/GAYA_SARTORIUS_cheap-SERUM/firmware1/main.c	void setup(void) {	
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x05, POSTDEC1
;	.line	15; C:/Users/sarto/Documents/Travail/M1/M&T/GAYA_SARTORIUS_cheap-SERUM/firmware1/main.c	fruitInit();
	CALL	_fruitInit
;	.line	17; C:/Users/sarto/Documents/Travail/M1/M&T/GAYA_SARTORIUS_cheap-SERUM/firmware1/main.c	pinModeDigitalOut(LED); 	// set the LED pin mode to digital out
	BCF	_TRISCbits, 1
;	.line	18; C:/Users/sarto/Documents/Travail/M1/M&T/GAYA_SARTORIUS_cheap-SERUM/firmware1/main.c	digitalClear(LED);		// clear the LED
	BCF	_LATCbits, 1
;	.line	19; C:/Users/sarto/Documents/Travail/M1/M&T/GAYA_SARTORIUS_cheap-SERUM/firmware1/main.c	delayStart(mainDelay, 5000); 	// init the mainDelay to 5 ms
	CALL	_time
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	FSR0L, r0x03
	ADDLW	0x88
	BANKSEL	_mainDelay
	MOVWF	_mainDelay, B
	MOVLW	0x13
	ADDWFC	r0x01, W
; removed redundant BANKSEL
	MOVWF	(_mainDelay + 1), B
	MOVLW	0x00
	ADDWFC	r0x02, W
; removed redundant BANKSEL
	MOVWF	(_mainDelay + 2), B
	MOVLW	0x00
	ADDWFC	r0x03, W
; removed redundant BANKSEL
	MOVWF	(_mainDelay + 3), B
;	.line	22; C:/Users/sarto/Documents/Travail/M1/M&T/GAYA_SARTORIUS_cheap-SERUM/firmware1/main.c	analogInit();		// init analog module
	CALL	_analogInit
;	.line	26; C:/Users/sarto/Documents/Travail/M1/M&T/GAYA_SARTORIUS_cheap-SERUM/firmware1/main.c	analogSelect(0,K1); //A
	BSF	_TRISAbits, 0
	MOVLW	LOW(_PORTA)
	MOVWF	r0x00
	MOVLW	HIGH(_PORTA)
	MOVWF	r0x01
	MOVLW	HIGH(_ANSELA)
	MOVWF	r0x03
	MOVLW	LOW(_ANSELA)
	ADDWF	r0x00, F
	MOVF	r0x03, W
	ADDWFC	r0x01, F
	MOVLW	LOW(_PORTA)
	MOVWF	r0x02
	MOVLW	HIGH(_PORTA)
	MOVWF	r0x03
	MOVLW	LOW(_PORTA)
	SUBWF	r0x00, F
	MOVF	r0x03, W
	SUBWFB	r0x01, F
	MOVLW	HIGH(_ANSELA)
	MOVWF	r0x05
	MOVLW	LOW(_ANSELA)
	ADDWF	r0x02, F
	MOVF	r0x05, W
	ADDWFC	r0x03, F
	MOVLW	HIGH(_PORTA)
	MOVWF	r0x05
	MOVLW	LOW(_PORTA)
	SUBWF	r0x02, F
	MOVF	r0x05, W
	SUBWFB	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	INDF0, r0x02
	BSF	r0x02, 0
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	r0x02, INDF0
	MOVLW	0x00
	CLRF	POSTDEC1
	CLRF	POSTDEC1
	CALL	_analogSelectAdc
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	27; C:/Users/sarto/Documents/Travail/M1/M&T/GAYA_SARTORIUS_cheap-SERUM/firmware1/main.c	analogSelect(1,K2); //D
	BSF	_TRISAbits, 1
	MOVLW	LOW(_PORTA)
	MOVWF	r0x00
	MOVLW	HIGH(_PORTA)
	MOVWF	r0x01
	MOVLW	HIGH(_ANSELA)
	MOVWF	r0x03
	MOVLW	LOW(_ANSELA)
	ADDWF	r0x00, F
	MOVF	r0x03, W
	ADDWFC	r0x01, F
	MOVLW	LOW(_PORTA)
	MOVWF	r0x02
	MOVLW	HIGH(_PORTA)
	MOVWF	r0x03
	MOVLW	LOW(_PORTA)
	SUBWF	r0x00, F
	MOVF	r0x03, W
	SUBWFB	r0x01, F
	MOVLW	HIGH(_ANSELA)
	MOVWF	r0x05
	MOVLW	LOW(_ANSELA)
	ADDWF	r0x02, F
	MOVF	r0x05, W
	ADDWFC	r0x03, F
	MOVLW	HIGH(_PORTA)
	MOVWF	r0x05
	MOVLW	LOW(_PORTA)
	SUBWF	r0x02, F
	MOVF	r0x05, W
	SUBWFB	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	INDF0, r0x02
	BSF	r0x02, 1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	r0x02, INDF0
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVWF	POSTDEC1
	CALL	_analogSelectAdc
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	28; C:/Users/sarto/Documents/Travail/M1/M&T/GAYA_SARTORIUS_cheap-SERUM/firmware1/main.c	analogSelect(2,K3); //S
	BSF	_TRISAbits, 2
	MOVLW	LOW(_PORTA)
	MOVWF	r0x00
	MOVLW	HIGH(_PORTA)
	MOVWF	r0x01
	MOVLW	HIGH(_ANSELA)
	MOVWF	r0x03
	MOVLW	LOW(_ANSELA)
	ADDWF	r0x00, F
	MOVF	r0x03, W
	ADDWFC	r0x01, F
	MOVLW	LOW(_PORTA)
	MOVWF	r0x02
	MOVLW	HIGH(_PORTA)
	MOVWF	r0x03
	MOVLW	LOW(_PORTA)
	SUBWF	r0x00, F
	MOVF	r0x03, W
	SUBWFB	r0x01, F
	MOVLW	HIGH(_ANSELA)
	MOVWF	r0x05
	MOVLW	LOW(_ANSELA)
	ADDWF	r0x02, F
	MOVF	r0x05, W
	ADDWFC	r0x03, F
	MOVLW	HIGH(_PORTA)
	MOVWF	r0x05
	MOVLW	LOW(_PORTA)
	SUBWF	r0x02, F
	MOVF	r0x05, W
	SUBWFB	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	INDF0, r0x02
	BSF	r0x02, 2
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	r0x02, INDF0
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVWF	POSTDEC1
	CALL	_analogSelectAdc
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	29; C:/Users/sarto/Documents/Travail/M1/M&T/GAYA_SARTORIUS_cheap-SERUM/firmware1/main.c	analogSelect(3,K4); //R
	BSF	_TRISAbits, 3
	MOVLW	LOW(_PORTA)
	MOVWF	r0x00
	MOVLW	HIGH(_PORTA)
	MOVWF	r0x01
	MOVLW	HIGH(_ANSELA)
	MOVWF	r0x03
	MOVLW	LOW(_ANSELA)
	ADDWF	r0x00, F
	MOVF	r0x03, W
	ADDWFC	r0x01, F
	MOVLW	LOW(_PORTA)
	MOVWF	r0x02
	MOVLW	HIGH(_PORTA)
	MOVWF	r0x03
	MOVLW	LOW(_PORTA)
	SUBWF	r0x00, F
	MOVF	r0x03, W
	SUBWFB	r0x01, F
	MOVLW	HIGH(_ANSELA)
	MOVWF	r0x05
	MOVLW	LOW(_ANSELA)
	ADDWF	r0x02, F
	MOVF	r0x05, W
	ADDWFC	r0x03, F
	MOVLW	HIGH(_PORTA)
	MOVWF	r0x05
	MOVLW	LOW(_PORTA)
	SUBWF	r0x02, F
	MOVF	r0x05, W
	SUBWFB	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	INDF0, r0x02
	BSF	r0x02, 3
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	r0x02, INDF0
	MOVLW	0x03
	MOVWF	POSTDEC1
	MOVWF	POSTDEC1
	CALL	_analogSelectAdc
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	31; C:/Users/sarto/Documents/Travail/M1/M&T/GAYA_SARTORIUS_cheap-SERUM/firmware1/main.c	analogSelect(4, K5); //WaveForm 1
	BSF	_TRISCbits, 3
	MOVLW	LOW(_PORTC)
	MOVWF	r0x00
	MOVLW	HIGH(_PORTC)
	MOVWF	r0x01
	MOVLW	HIGH(_ANSELA)
	MOVWF	r0x03
	MOVLW	LOW(_ANSELA)
	ADDWF	r0x00, F
	MOVF	r0x03, W
	ADDWFC	r0x01, F
	MOVLW	HIGH(_PORTA)
	MOVWF	r0x03
	MOVLW	LOW(_PORTA)
	SUBWF	r0x00, F
	MOVF	r0x03, W
	SUBWFB	r0x01, F
	MOVLW	LOW(_PORTC)
	MOVWF	r0x02
	MOVLW	HIGH(_PORTC)
	MOVWF	r0x03
	MOVLW	HIGH(_ANSELA)
	MOVWF	r0x05
	MOVLW	LOW(_ANSELA)
	ADDWF	r0x02, F
	MOVF	r0x05, W
	ADDWFC	r0x03, F
	MOVLW	HIGH(_PORTA)
	MOVWF	r0x05
	MOVLW	LOW(_PORTA)
	SUBWF	r0x02, F
	MOVF	r0x05, W
	SUBWFB	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	INDF0, r0x02
	BSF	r0x02, 3
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	r0x02, INDF0
	MOVLW	0x0f
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_analogSelectAdc
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	32; C:/Users/sarto/Documents/Travail/M1/M&T/GAYA_SARTORIUS_cheap-SERUM/firmware1/main.c	analogSelect(5, K6); //WaveForm 2
	BSF	_TRISCbits, 2
	MOVLW	LOW(_PORTC)
	MOVWF	r0x00
	MOVLW	HIGH(_PORTC)
	MOVWF	r0x01
	MOVLW	HIGH(_ANSELA)
	MOVWF	r0x03
	MOVLW	LOW(_ANSELA)
	ADDWF	r0x00, F
	MOVF	r0x03, W
	ADDWFC	r0x01, F
	MOVLW	HIGH(_PORTA)
	MOVWF	r0x03
	MOVLW	LOW(_PORTA)
	SUBWF	r0x00, F
	MOVF	r0x03, W
	SUBWFB	r0x01, F
	MOVLW	LOW(_PORTC)
	MOVWF	r0x02
	MOVLW	HIGH(_PORTC)
	MOVWF	r0x03
	MOVLW	HIGH(_ANSELA)
	MOVWF	r0x05
	MOVLW	LOW(_ANSELA)
	ADDWF	r0x02, F
	MOVF	r0x05, W
	ADDWFC	r0x03, F
	MOVLW	HIGH(_PORTA)
	MOVWF	r0x05
	MOVLW	LOW(_PORTA)
	SUBWF	r0x02, F
	MOVF	r0x05, W
	SUBWFB	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	INDF0, r0x02
	BSF	r0x02, 2
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	r0x02, INDF0
	MOVLW	0x0e
	MOVWF	POSTDEC1
	MOVLW	0x05
	MOVWF	POSTDEC1
	CALL	_analogSelectAdc
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	34; C:/Users/sarto/Documents/Travail/M1/M&T/GAYA_SARTORIUS_cheap-SERUM/firmware1/main.c	analogSelect(8,K8); //main volume
	BSF	_TRISCbits, 5
	MOVLW	LOW(_PORTC)
	MOVWF	r0x00
	MOVLW	HIGH(_PORTC)
	MOVWF	r0x01
	MOVLW	HIGH(_ANSELA)
	MOVWF	r0x03
	MOVLW	LOW(_ANSELA)
	ADDWF	r0x00, F
	MOVF	r0x03, W
	ADDWFC	r0x01, F
	MOVLW	HIGH(_PORTA)
	MOVWF	r0x03
	MOVLW	LOW(_PORTA)
	SUBWF	r0x00, F
	MOVF	r0x03, W
	SUBWFB	r0x01, F
	MOVLW	LOW(_PORTC)
	MOVWF	r0x02
	MOVLW	HIGH(_PORTC)
	MOVWF	r0x03
	MOVLW	HIGH(_ANSELA)
	MOVWF	r0x05
	MOVLW	LOW(_ANSELA)
	ADDWF	r0x02, F
	MOVF	r0x05, W
	ADDWFC	r0x03, F
	MOVLW	HIGH(_PORTA)
	MOVWF	r0x05
	MOVLW	LOW(_PORTA)
	SUBWF	r0x02, F
	MOVF	r0x05, W
	SUBWFB	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	INDF0, r0x02
	BSF	r0x02, 5
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	r0x02, INDF0
	MOVLW	0x11
	MOVWF	POSTDEC1
	MOVLW	0x08
	MOVWF	POSTDEC1
	CALL	_analogSelectAdc
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
___str_0:
	DB	0x43, 0x00
; ; Starting pCode block
___str_1:
	DB	0x25, 0x63, 0x00


; Statistics:
; code size:	 1100 (0x044c) bytes ( 0.84%)
;           	  550 (0x0226) words
; udata size:	    4 (0x0004) bytes ( 0.11%)
; access size:	    5 (0x0005) bytes


	end
