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
	global	_FraiseState
	global	_FrTXtries
	global	_fraiseSetID
	global	_fraiseInit
	global	_fraiseSetInterruptEnable
	global	_fraiseGetInterruptEnable
	global	_fraiseSend
	global	_fraiseSendBroadcast
	global	_fraiseISR
	global	_fraiseGetChar
	global	_fraisePeekChar
	global	_fraiseGetLen
	global	_fraiseGetIndex
	global	_fraiseGetAt
	global	_fraiseSendCopy
	global	_fraiseService
	global	_putchar
	global	_FrTXbuf
	global	_FrTXin
	global	_FrTXout
	global	_FrTXbufFree
	global	_FrTXpacket
	global	_FrTXpacket_i
	global	_FrTXpacket_len
	global	_FrTXchksum
	global	_FrRXbuf
	global	_FrRXchksum
	global	_FrRXin
	global	_FrRXin_tmp
	global	_FrRXin_end
	global	_FrRXout
	global	_FrRXout_end
	global	_FrRXout_len
	global	_FrRXout_first
	global	_FraiseStatus
	global	_FrInterruptEnabled
	global	_FrID
	global	_txbuf
	global	_txlen

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern	__gptrget1
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
	extern	_eeWriteByte
	extern	_eeReadByte
	extern	_fraiseReceiveChar
	extern	__modsint

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
POSTINC1	equ	0xfe6
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PLUSW2	equ	0xfdb
PRODL	equ	0xff3


	idata
_FrTXin	db	0x00
_FrTXout	db	0x00
_FrTXbufFree	db	0xff
_FrInterruptEnabled	db	0x00
_FrID	db	0x00
_txlen	db	0x00


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

udata_fraisedevice_0	udata
_FrTXtries	res	1

udata_fraisedevice_1	udata
_FraiseState	res	1

udata_fraisedevice_2	udata
_fraiseISR_c_1_112	res	1

udata_fraisedevice_3	udata
_fraiseISR_c2_1_112	res	1

udata_fraisedevice_4	udata
_FrRXin	res	1

udata_fraisedevice_5	udata
_FrRXout	res	1

udata_fraisedevice_6	udata
_FrTXpacket_len	res	1

udata_fraisedevice_7	udata
_FraiseStatus	res	1

udata_fraisedevice_8	udata
_FrTXbuf	res	256

udata_fraisedevice_9	udata
_FrTXchksum	res	1

udata_fraisedevice_10	udata
_FrTXpacket_i	res	1

udata_fraisedevice_11	udata
_fraiseDecodeNextTXPacket_ischar_1_92	res	1

udata_fraisedevice_12	udata
_FrTXpacket	res	35

udata_fraisedevice_13	udata
_FrRXchksum	res	1

udata_fraisedevice_14	udata
_FrRXin_tmp	res	1

udata_fraisedevice_15	udata
_FrRXin_end	res	1

udata_fraisedevice_16	udata
_FrRXbuf	res	128

udata_fraisedevice_17	udata
_FrRXout_end	res	1

udata_fraisedevice_18	udata
_FrRXout_len	res	1

udata_fraisedevice_19	udata
_FrRXout_first	res	1

udata_fraisedevice_20	udata
_txbuf	res	35

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_fraisedevice__putchar	code
_putchar:
;	.line	780; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	PUTCHAR (c) {
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVWF	r0x00
;	.line	781; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	txbuf[txlen] = c;
	MOVLW	LOW(_txbuf)
	BANKSEL	_txlen
	ADDWF	_txlen, W, B
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_txbuf)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	r0x00, INDF0
;	.line	782; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(txlen < (sizeof(txbuf) - 1)) txlen++;
	MOVLW	0x22
; #	SUBWF	_txlen, W, B
; #	BTFSC	STATUS, 0
; #	GOTO	_00807_DS_
; #	INCF	_txlen, F, B
; #	MOVF	r0x00, W
; removed redundant BANKSEL
;	.line	783; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(c == '\n') {
	SUBWF	_txlen, W, B
	BC	_10806_DS_
; removed redundant BANKSEL
	INCF	_txlen, F, B
_10806_DS_:
	MOVF	r0x00, W
	XORLW	0x0a
	BNZ	_00810_DS_
_00820_DS_:
	BANKSEL	_txlen
;	.line	784; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	fraiseSend(txbuf, txlen);
	MOVF	_txlen, W, B
	MOVWF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVLW	HIGH(_txbuf)
	MOVWF	POSTDEC1
	MOVLW	LOW(_txbuf)
	MOVWF	POSTDEC1
	CALL	_fraiseSend
	MOVLW	0x04
	ADDWF	FSR1L, F
	BANKSEL	_txlen
;	.line	785; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	txlen = 0;
	CLRF	_txlen, B
_00810_DS_:
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_fraisedevice__fraiseService	code
_fraiseService:
;	.line	696; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	void fraiseService(void)
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	BANKSEL	_FrRXout
;	.line	700; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(FrRXout != FrRXin) //FraiseStatus.RX_FULL
	MOVF	_FrRXout, W, B
	BANKSEL	_FrRXin
	XORWF	_FrRXin, W, B
	BNZ	_00784_DS_
	BRA	_00730_DS_
_00784_DS_:
;	.line	702; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	c = FrRXout;
	MOVFF	_FrRXout, r0x00
;	.line	703; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	c += 1;
	INCF	r0x00, F
;	.line	704; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	c %= sizeof(FrRXbuf);
	BCF	r0x00, 7
;	.line	705; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrRXout_len = FrRXbuf[c];
	MOVLW	LOW(_FrRXbuf)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_FrRXbuf)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	INDF0, _FrRXout_len
;	.line	706; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrRXout_len &= 31;
	MOVLW	0x1f
	BANKSEL	_FrRXout_len
	ANDWF	_FrRXout_len, F, B
;	.line	708; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrRXout_end = FrRXout;
	MOVFF	_FrRXout, _FrRXout_end
; removed redundant BANKSEL
;	.line	709; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrRXout_end += FrRXout_len;
	MOVF	_FrRXout_len, W, B
	BANKSEL	_FrRXout_end
	ADDWF	_FrRXout_end, F, B
;	.line	710; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrRXout_end += 2;
	INCF	_FrRXout_end, F, B
	INCF	_FrRXout_end, F, B
;	.line	711; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrRXout_end %= sizeof(FrRXbuf);
	BCF	_FrRXout_end, 7, B
;	.line	713; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	isbroadcast = (fraiseGetChar() == 0);
	CALL	_fraiseGetChar
	MOVWF	r0x01
	MOVF	r0x01, W
	BNZ	_00788_DS_
	CLRF	r0x01
	INCF	r0x01, F
	BRA	_00789_DS_
_00788_DS_:
	CLRF	r0x01
_00789_DS_:
;	.line	714; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrRXout_len = fraiseGetChar();
	CALL	_fraiseGetChar
	BANKSEL	_FrRXout_len
	MOVWF	_FrRXout_len, B
;	.line	715; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	ischar = FrRXout_len & 128;
	MOVLW	0x80
; removed redundant BANKSEL
	ANDWF	_FrRXout_len, W, B
	MOVWF	r0x02
;	.line	717; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(!(FrRXout_len &= 31)){ //packet error
	MOVLW	0x1f
; removed redundant BANKSEL
	ANDWF	_FrRXout_len, W, B
	MOVWF	r0x03
	MOVFF	r0x03, r0x04
	MOVFF	r0x03, _FrRXout_len
	MOVF	r0x04, W
	BNZ	_00709_DS_
;	.line	718; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrRXout = FrRXin;
	MOVFF	_FrRXin, _FrRXout
;	.line	719; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	return;
	BRA	_00739_DS_
_00709_DS_:
;	.line	722; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(isbroadcast) //Broadcast packet
	MOVF	r0x01, W
	BZ	_00726_DS_
;	.line	724; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(ischar){
	MOVF	r0x02, W
	BZ	_00728_DS_
;	.line	725; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	c = fraiseGetChar();
	CALL	_fraiseGetChar
	MOVWF	r0x00
	BANKSEL	_FrRXout_len
;	.line	726; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrRXout_len -= 1;
	DECF	_FrRXout_len, F, B
;	.line	727; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if     (c == 'B') {
	MOVF	r0x00, W
	XORLW	0x42
	BZ	_00728_DS_
;	.line	732; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	else if(c == 'N') Assign();		/* assign to id if name matchs */
	MOVF	r0x00, W
	XORLW	0x4e
	BNZ	_00716_DS_
	CALL	_Assign
	BRA	_00728_DS_
_00716_DS_:
;	.line	733; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	else if(c == 'F') ResetToBld();	/* goto Fraisebootloader if name matchs */
	MOVF	r0x00, W
	XORLW	0x46
	BNZ	_00713_DS_
	CALL	_ResetToBld
	BRA	_00728_DS_
_00713_DS_:
;	.line	734; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	else if(c == 'I') __asm reset __endasm; //init
	MOVF	r0x00, W
	XORLW	0x49
	BNZ	_00728_DS_
_00799_DS_:
	reset	
	BRA	_00728_DS_
_00726_DS_:
;	.line	746; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrRXout_first = FrRXout;
	MOVFF	_FrRXout, _FrRXout_first
; #	MOVF	r0x02, W
; #	BTFSC	STATUS, 2
; #	GOTO	_00728_DS_
; #	CALL	_fraiseReceiveChar
; #	MOVFF	_FrRXout_end, _FrRXout
;	.line	747; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(ischar) {
	MOVF	r0x02, W
;	.line	749; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	fraiseReceiveChar();
	BTFSS	STATUS, 2
;	.line	760; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrRXout = FrRXout_end;
	CALL	_fraiseReceiveChar
_00728_DS_:
	MOVFF	_FrRXout_end, _FrRXout
_00730_DS_:
	BANKSEL	_FrTXin
;	.line	763; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if((!FrTXempty) && (!FrTXpacket_len)) { // if there is sth to send to master and nothing in TXpacket :
	MOVF	_FrTXin, W, B
	BANKSEL	_FrTXout
	XORWF	_FrTXout, W, B
	BZ	_00736_DS_
_00801_DS_:
	BANKSEL	_FrTXpacket_len
	MOVF	_FrTXpacket_len, W, B
	BNZ	_00736_DS_
;	.line	764; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	fraiseDecodeNextTXPacket();
	CALL	_fraiseDecodeNextTXPacket
	BRA	_00739_DS_
_00736_DS_:
;	.line	766; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	else if(Serial_Is_Driver() && (!FrTXpacket_len) && TXSTAxbits.TRMT)// security:
	BTFSC	_TRISCbits, 0
	BRA	_00739_DS_
	BANKSEL	_FrTXpacket_len
	MOVF	_FrTXpacket_len, W, B
;	.line	767; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	Serial_Init_Receiver();
	BNZ	_00739_DS_
; #	GOTO	_00739_DS_
; #	BTFSS	_TXSTAbits, 1
; #	GOTO	_00739_DS_
; #	CALL	_Serial_Init_Receiver
; #; info ==> [localregs] exit begin

; #	MOVFF	PREINC1, r0x04
;	.line	769; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	return;	
	BTFSC	_TXSTAbits, 1
	CALL	_Serial_Init_Receiver
_00739_DS_:
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_fraisedevice__ResetToBld	code
_ResetToBld:
;	.line	682; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	static void ResetToBld() //"F" command
	MOVFF	r0x00, POSTDEC1
;	.line	685; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(CompareName()) {
	CALL	_CompareName
	MOVWF	r0x00
	MOVF	r0x00, W
;	.line	687; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	return;
	BNZ	_00703_DS_
_00702_DS_:
	reset	
_00703_DS_:
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_fraisedevice__Assign	code
_Assign:
;	.line	664; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	static void Assign() //"N" command
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
;	.line	667; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	c = fraiseGetChar();
	CALL	_fraiseGetChar
	MOVWF	r0x00
;	.line	668; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	c2 = fraiseGetChar();
	CALL	_fraiseGetChar
	MOVWF	r0x01
;	.line	669; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	c -= '0'; if (c > 9) c -= 'A' - '9' - 1;
	MOVF	r0x00, W
	MOVWF	r0x02
	MOVLW	0xd0
	ADDWF	r0x02, W
	MOVWF	r0x00
	MOVLW	0x0a
	SUBWF	r0x00, W
	BNC	_00671_DS_
	MOVF	r0x00, W
	MOVWF	r0x02
	MOVLW	0xf9
	ADDWF	r0x02, W
	MOVWF	r0x00
_00671_DS_:
;	.line	670; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	c2 -= '0'; if (c2 > 9) c2 -= 'A' - '9' - 1;
	MOVF	r0x01, W
	MOVWF	r0x02
	MOVLW	0xd0
	ADDWF	r0x02, W
	MOVWF	r0x01
	MOVLW	0x0a
	SUBWF	r0x01, W
	BNC	_00673_DS_
	MOVF	r0x01, W
	MOVWF	r0x02
	MOVLW	0xf9
	ADDWF	r0x02, W
	MOVWF	r0x01
_00673_DS_:
;	.line	671; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if((c > 7) || (c2 > 15)) { // bad id... discard
	MOVLW	0x08
	SUBWF	r0x00, W
	BC	_00679_DS_
	MOVLW	0x10
; #	SUBWF	r0x01, W
; #	BTFSS	STATUS, 0
; #	GOTO	_00675_DS_
; #	GOTO	_00679_DS_
; #	SWAPF	r0x00, W
;	.line	672; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	return; 
	SUBWF	r0x01, W
;	.line	674; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	tmpid = c2 + (c << 4);
	BTFSC	STATUS, 0
_00674_DS_:
	BRA	_00679_DS_
	SWAPF	r0x00, W
	ANDLW	0xf0
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
	ADDWF	r0x01, W
	MOVWF	r0x00
;	.line	676; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(CompareName()) return;
	CALL	_CompareName
	MOVWF	r0x01
; #	MOVF	r0x01, W
; #	BTFSC	STATUS, 2
; #	GOTO	_00678_DS_
; #	GOTO	_00679_DS_
; #	MOVF	r0x00, W
;	.line	678; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	fraiseSetID(tmpid);
	MOVF	r0x01, W
	BNZ	_00679_DS_
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_fraiseSetID
	MOVF	POSTINC1, F
_00679_DS_:
;	.line	679; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	return;
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_fraisedevice__CompareName	code
_CompareName:
;	.line	632; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	static char CompareName() 
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
;	.line	636; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	eei = EE_PREFIX;
	MOVLW	0x01
	MOVWF	r0x00
_00636_DS_:
;	.line	637; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	while(c = fraiseGetChar()){
	CALL	_fraiseGetChar
	MOVWF	r0x01
	MOVFF	r0x01, r0x02
	MOVF	r0x01, W
	BZ	_00638_DS_
;	.line	638; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	c2 = eeReadByte(eei);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_eeReadByte
	MOVWF	r0x01
	MOVF	POSTINC1, F
;	.line	639; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(c2 == 0) { //end of string
	MOVF	r0x01, W
	BNZ	_00631_DS_
;	.line	640; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(eei < EE_NAME) { //end of prefix
	MOVLW	0x0a
	SUBWF	r0x00, W
	BC	_00628_DS_
; #	MOVLW	0x0a
; #	MOVWF	r0x00
; #	MOVLW	0x0a
;	.line	641; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	eei = EE_NAME; //goto to name first char
	MOVLW	0x0a
;	.line	642; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	c2 = eeReadByte(eei);
	MOVWF	r0x00
	MOVWF	POSTDEC1
	CALL	_eeReadByte
	MOVWF	r0x01
	MOVF	POSTINC1, F
;	.line	643; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(c2 == 0) { //no name?!
	MOVF	r0x01, W
	BNZ	_00631_DS_
;	.line	644; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	return -1; 
	SETF	WREG
	BRA	_00639_DS_
_00628_DS_:
;	.line	648; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	return -1; 
	SETF	WREG
	BRA	_00639_DS_
_00631_DS_:
;	.line	651; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(c2 != c) { //spelled name differs from device name; discard.
	MOVF	r0x01, W
	XORWF	r0x02, W
	BZ	_00633_DS_
;	.line	652; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	return -1; 
	SETF	WREG
	BRA	_00639_DS_
_00633_DS_:
;	.line	654; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	eei++;
	INCF	r0x00, F
;	.line	655; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(eei > EE_NAMEMAX) { //spelled name too long; discard.
	MOVLW	0x1b
	SUBWF	r0x00, W
	BNC	_00636_DS_
;	.line	656; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	return -1;
	SETF	WREG
	BRA	_00639_DS_
_00638_DS_:
;	.line	660; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	return 0;
	CLRF	WREG
_00639_DS_:
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_fraisedevice__fraiseSendCopy	code
_fraiseSendCopy:
;	.line	614; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	void fraiseSendCopy()
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
;	.line	618; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	l = (FrRXout - FrRXout_first)%sizeof(FrRXbuf);
	MOVFF	_FrRXout, r0x00
	CLRF	r0x01
	MOVFF	_FrRXout_first, r0x02
	CLRF	r0x03
	MOVF	r0x02, W
	SUBWF	r0x00, F
	MOVF	r0x03, W
	SUBWFB	r0x01, F
	CLRF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__modsint
	MOVWF	r0x00
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	619; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	l--;
	DECF	r0x00, F
;	.line	620; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	i = FrRXout_first;
	MOVFF	_FrRXout_first, r0x01
;	.line	621; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	putchar('C'); putchar(' '); 
	MOVLW	0x43
	CALL	_putchar
	MOVLW	0x20
	CALL	_putchar
_00604_DS_:
;	.line	623; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	while(l > 0) {
	MOVF	r0x00, W
	BZ	_00607_DS_
;	.line	624; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	printf("%d ", FrRXbuf[i]);
	MOVLW	LOW(_FrRXbuf)
	ADDWF	r0x01, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(_FrRXbuf)
	ADDWFC	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	INDF0, r0x02
	CLRF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	UPPER(___str_0)
	MOVWF	POSTDEC1
	MOVLW	HIGH(___str_0)
	MOVWF	POSTDEC1
	MOVLW	LOW(___str_0)
	MOVWF	POSTDEC1
	CALL	_printf
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	625; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	i++;
	INCF	r0x01, F
;	.line	626; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(i == sizeof(FrRXbuf)) i = 0;
	MOVF	r0x01, W
	XORLW	0x80
	BNZ	_00603_DS_
	CLRF	r0x01
_00603_DS_:
;	.line	627; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	l--;
	DECF	r0x00, F
	BRA	_00604_DS_
_00607_DS_:
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_fraisedevice__fraiseGetAt	code
_fraiseGetAt:
;	.line	609; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	unsigned char fraiseGetAt(unsigned char i)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	611; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	return FrRXbuf[(i + FrRXout_first)%sizeof(FrRXbuf)];
	CLRF	r0x01
	MOVFF	_FrRXout_first, r0x02
	CLRF	r0x03
	MOVF	r0x02, W
	ADDWF	r0x00, F
	MOVF	r0x03, W
	ADDWFC	r0x01, F
	CLRF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__modsint
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVLW	LOW(_FrRXbuf)
	ADDWF	r0x00, F
	MOVLW	HIGH(_FrRXbuf)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	INDF0, r0x00
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_fraisedevice__fraiseGetIndex	code
_fraiseGetIndex:
	BANKSEL	_FrRXout
;	.line	606; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	return FrRXout;
	MOVF	_FrRXout, W, B
	RETURN	

; ; Starting pCode block
S_fraisedevice__fraiseGetLen	code
_fraiseGetLen:
	BANKSEL	_FrRXout_len
;	.line	601; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	return FrRXout_len;
	MOVF	_FrRXout_len, W, B
	RETURN	

; ; Starting pCode block
S_fraisedevice__fraisePeekChar	code
_fraisePeekChar:
;	.line	594; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	unsigned char fraisePeekChar()
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
;	.line	596; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	return FrRXbuf[FrRXout];
	MOVLW	LOW(_FrRXbuf)
	BANKSEL	_FrRXout
	ADDWF	_FrRXout, W, B
	MOVWF	r0x00
	CLRF	r0x01
	MOVLW	HIGH(_FrRXbuf)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	INDF0, r0x00
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_fraisedevice__fraiseGetChar	code
_fraiseGetChar:
;	.line	584; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	unsigned char fraiseGetChar()
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	BANKSEL	_FrRXout
;	.line	588; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if((FrRXout == FrRXout_end) || (FrRXout == FrRXin)) return 0; //underflow error
	MOVF	_FrRXout, W, B
	BANKSEL	_FrRXout_end
	XORWF	_FrRXout_end, W, B
	BZ	_00559_DS_
_00573_DS_:
	BANKSEL	_FrRXout
	MOVF	_FrRXout, W, B
	BANKSEL	_FrRXin
	XORWF	_FrRXin, W, B
	BNZ	_00560_DS_
_00559_DS_:
	CLRF	WREG
	BRA	_00564_DS_
_00560_DS_:
;	.line	589; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	c = FrRXbuf[FrRXout++];
	MOVFF	_FrRXout, r0x00
	BANKSEL	_FrRXout
	INCF	_FrRXout, F, B
	CLRF	r0x01
	MOVLW	LOW(_FrRXbuf)
	ADDWF	r0x00, F
	MOVLW	HIGH(_FrRXbuf)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	INDF0, r0x00
; removed redundant BANKSEL
;	.line	590; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(FrRXout == sizeof(FrRXbuf)) FrRXout = 0;
	MOVF	_FrRXout, W, B
	XORLW	0x80
	BNZ	_00563_DS_
_00577_DS_:
	BANKSEL	_FrRXout
	CLRF	_FrRXout, B
_00563_DS_:
;	.line	591; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	return c;
	MOVF	r0x00, W
_00564_DS_:
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_fraisedevice__fraiseISR	code
_fraiseISR:
;	.line	467; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	void fraiseISR(void)
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
; #	MOVF	_FrInterruptEnabled, W, B
; #	BTFSS	STATUS, 2
; #	GOTO	_00391_DS_
; #	GOTO	_00457_DS_
; #	BTFSS	_PIE1bits, 4
	BANKSEL	_FrInterruptEnabled
;	.line	471; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(FrInterruptEnabled == 0) return;
	MOVF	_FrInterruptEnabled, W, B
;	.line	473; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(TXxIE && TXxIF) {
	BTFSC	STATUS, 2
	BRA	_00457_DS_
	BTFSS	_PIE1bits, 4
	BRA	_00395_DS_
	BTFSS	_PIR1bits, 4
	BRA	_00395_DS_
	BANKSEL	_FrTXpacket_i
;	.line	474; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(FrTXpacket_i == FrTXpacket_len) { //if end of the packet:
	MOVF	_FrTXpacket_i, W, B
	BANKSEL	_FrTXpacket_len
	XORWF	_FrTXpacket_len, W, B
	BNZ	_00393_DS_
;	.line	475; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	Serial_Init_Receiver();
	CALL	_Serial_Init_Receiver
	BANKSEL	_FrTXpacket_len
;	.line	476; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrTXpacket_len = 0;
	CLRF	_FrTXpacket_len, B
;	.line	477; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	return;
	BRA	_00457_DS_
_00393_DS_:
;	.line	479; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	c = FrTXpacket[FrTXpacket_i];
	MOVLW	LOW(_FrTXpacket)
	BANKSEL	_FrTXpacket_i
	ADDWF	_FrTXpacket_i, W, B
	MOVWF	r0x00
	CLRF	r0x01
	MOVLW	HIGH(_FrTXpacket)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	INDF0, _fraiseISR_c_1_112
; removed redundant BANKSEL
;	.line	480; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrTXpacket_i++;
	INCF	_FrTXpacket_i, F, B
;	.line	481; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	TXREGx = c; // send next byte
	MOVFF	_fraiseISR_c_1_112, _TXREG
;	.line	483; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	return;
	BRA	_00457_DS_
_00395_DS_:
;	.line	486; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(RCxIE && RCxIF) {
	BTFSS	_PIE1bits, 5
	BRA	_00457_DS_
	BTFSS	_PIR1bits, 5
	BRA	_00457_DS_
;	.line	487; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(RCSTAxbits.OERR){
	BTFSS	_RCSTAbits, 1
	BRA	_00398_DS_
	BANKSEL	_FraiseStatus
;	.line	488; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FraiseStatus.RX_OERR = 1;
	BSF	_FraiseStatus, 0, B
;	.line	489; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	Serial_Init_Receiver();
	CALL	_Serial_Init_Receiver
;	.line	490; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	return;
	BRA	_00457_DS_
_00398_DS_:
;	.line	492; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(RCSTAxbits.FERR){
	BTFSS	_RCSTAbits, 2
	BRA	_00400_DS_
	BANKSEL	_FraiseStatus
;	.line	493; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FraiseStatus.RX_FERR = 1;
	BSF	_FraiseStatus, 1, B
;	.line	494; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	Serial_Init_Receiver();
	CALL	_Serial_Init_Receiver
;	.line	495; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	return;
	BRA	_00457_DS_
_00400_DS_:
;	.line	498; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if (RCSTAxbits.RX9D) { // -------  address : 
	BTFSS	_RCSTAbits, 0
	BRA	_00412_DS_
;	.line	499; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	c = RCREGx; // get byte
	MOVFF	_RCREG, _fraiseISR_c_1_112
;	.line	500; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(c == (FrID | 128)) { // poll signal
	MOVLW	0x80
	BANKSEL	_FrID
	IORWF	_FrID, W, B
; #	MOVWF	r0x00
; #	MOVF	_fraiseISR_c_1_112, W, B
; #	XORWF	r0x00, W
	BANKSEL	_fraiseISR_c_1_112
	XORWF	_fraiseISR_c_1_112, W, B
	BNZ	_00402_DS_
_00535_DS_:
	BANKSEL	_FraiseStatus
;	.line	501; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FraiseStatus.RX_POLL = 1;
	BSF	_FraiseStatus, 4, B
;	.line	502; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	RCSTAxbits.ADDEN = 0;
	BCF	_RCSTAbits, 3
;	.line	503; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	return;
	BRA	_00457_DS_
_00402_DS_:
	BANKSEL	_fraiseISR_c_1_112
;	.line	505; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if ((c == 0) || (c == FrID)) {
	MOVF	_fraiseISR_c_1_112, W, B
	BZ	_00408_DS_
; removed redundant BANKSEL
	MOVF	_fraiseISR_c_1_112, W, B
	BANKSEL	_FrID
	XORWF	_FrID, W, B
	BNZ	_00409_DS_
_00408_DS_:
	BANKSEL	_FraiseStatus
;	.line	506; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FraiseStatus.RX_POLL = 0;
	BCF	_FraiseStatus, 4, B
;	.line	507; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	RCSTAxbits.ADDEN = 0;
	BCF	_RCSTAbits, 3
	BANKSEL	_fraiseISR_c_1_112
;	.line	508; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(c) FraiseStatus.RX_BRDCST = 0;
	MOVF	_fraiseISR_c_1_112, W, B
	BZ	_00404_DS_
	BANKSEL	_FraiseStatus
	BCF	_FraiseStatus, 3, B
	BRA	_00405_DS_
_00404_DS_:
	BANKSEL	_FraiseStatus
;	.line	509; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	else FraiseStatus.RX_BRDCST = 1;
	BSF	_FraiseStatus, 3, B
_00405_DS_:
;	.line	511; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrRXchksum = c;
	MOVFF	_fraiseISR_c_1_112, _FrRXchksum
;	.line	512; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrRXin_tmp = FrRXin;
	MOVFF	_FrRXin, _FrRXin_tmp
	BANKSEL	_FrRXin
;	.line	513; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrRXin_end = FrRXin - 1; // protect FrRXin_end
	DECF	_FrRXin, W, B
	BANKSEL	_FrRXin_end
	MOVWF	_FrRXin_end, B
;	.line	514; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrRXbuf[FrRXin_tmp] = c;
	MOVLW	LOW(_FrRXbuf)
	BANKSEL	_FrRXin_tmp
	ADDWF	_FrRXin_tmp, W, B
	MOVWF	r0x00
	CLRF	r0x01
	MOVLW	HIGH(_FrRXbuf)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	_fraiseISR_c_1_112, INDF0
; removed redundant BANKSEL
;	.line	515; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrRXin_tmp++;
	INCF	_FrRXin_tmp, F, B
;	.line	516; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(FrRXin_tmp == sizeof(FrRXbuf)) FrRXin_tmp = 0;
	MOVF	_FrRXin_tmp, W, B
	XORLW	0x80
	BNZ	_00407_DS_
_00539_DS_:
	BANKSEL	_FrRXin_tmp
	CLRF	_FrRXin_tmp, B
_00407_DS_:
;	.line	517; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	return;
	BRA	_00457_DS_
_00409_DS_:
	BANKSEL	_FraiseStatus
;	.line	519; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FraiseStatus.RX_POLL= 0;
	BCF	_FraiseStatus, 4, B
;	.line	520; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	RCSTAxbits.ADDEN = 1;
	BSF	_RCSTAbits, 3
;	.line	521; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	return;
	BRA	_00457_DS_
_00412_DS_:
;	.line	524; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	c = RCREGx; // get byte
	MOVFF	_RCREG, _fraiseISR_c_1_112
	BANKSEL	_FraiseStatus
;	.line	525; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(FraiseStatus.RX_POLL) { // had a poll signal
	BTFSS	_FraiseStatus, 4, B
	BRA	_00425_DS_
;	.line	526; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(c == (FrID | 128)){ 	// confirmation byte of poll signal:
	MOVLW	0x80
	BANKSEL	_FrID
	IORWF	_FrID, W, B
; #	MOVWF	r0x00
; #	MOVF	_fraiseISR_c_1_112, W, B
; #	XORWF	r0x00, W
	BANKSEL	_fraiseISR_c_1_112
	XORWF	_fraiseISR_c_1_112, W, B
	BNZ	_00423_DS_
;	.line	528; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	Serial_Init_Driver();
	BCF	_PIE1bits, 5
	BCF	_RCSTAbits, 4
	BCF	_TRISCbits, 0
	BANKSEL	_FrTXpacket_len
;	.line	529; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(FrTXpacket_len == 0) {
	MOVF	_FrTXpacket_len, W, B
	BNZ	_00420_DS_
;	.line	530; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	TXREGx = 0;
	CLRF	_TXREG
;	.line	531; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	Serial_Init_Receiver();
	CALL	_Serial_Init_Receiver
	BRA	_00423_DS_
_00420_DS_:
;	.line	533; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	fraiseSendLaunch();
	MOVFF	_FrTXpacket, _TXREG
	MOVLW	0x01
	BANKSEL	_FrTXpacket_i
	MOVWF	_FrTXpacket_i, B
	BSF	_PIE1bits, 4
;	.line	534; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	return;
	BRA	_00457_DS_
_00423_DS_:
;	.line	537; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	RCSTAxbits.ADDEN = 1;
	BSF	_RCSTAbits, 3
;	.line	538; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	return;
	BRA	_00457_DS_
_00425_DS_:
	BANKSEL	_fraiseISR_c_1_112
;	.line	541; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrRXchksum += c;
	MOVF	_fraiseISR_c_1_112, W, B
	BANKSEL	_FrRXchksum
	ADDWF	_FrRXchksum, F, B
	BANKSEL	_FrRXin_tmp
;	.line	543; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(FrRXin_tmp == FrRXin_end) {// RX packet complete
	MOVF	_FrRXin_tmp, W, B
	BANKSEL	_FrRXin_end
	XORWF	_FrRXin_end, W, B
	BNZ	_00446_DS_
_00544_DS_:
	BANKSEL	_FrRXchksum
;	.line	544; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(!FrRXchksum) { // RX packet checksum ok 
	MOVF	_FrRXchksum, W, B
	BNZ	_00443_DS_
;	.line	545; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrRXin = FrRXin_tmp; //validation of packet
	MOVFF	_FrRXin_tmp, _FrRXin
	BANKSEL	_FraiseStatus
;	.line	546; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(!FraiseStatus.RX_BRDCST){
	BTFSC	_FraiseStatus, 3, B
	BRA	_00444_DS_
;	.line	547; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	Serial_Init_Driver();
	BCF	_PIE1bits, 5
	BCF	_RCSTAbits, 4
	BCF	_TRISCbits, 0
;	.line	548; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	TXREGx = 0; //Acknowldge
	CLRF	_TXREG
;	.line	549; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	Serial_Init_Receiver();
	CALL	_Serial_Init_Receiver
	BRA	_00444_DS_
_00443_DS_:
	BANKSEL	_FraiseStatus
;	.line	553; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FraiseStatus.RX_SERR = 1;
	BSF	_FraiseStatus, 2, B
;	.line	554; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(!FraiseStatus.RX_BRDCST){
	BTFSC	_FraiseStatus, 3, B
	BRA	_00444_DS_
;	.line	555; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	Serial_Init_Driver();
	BCF	_PIE1bits, 5
	BCF	_RCSTAbits, 4
	BCF	_TRISCbits, 0
;	.line	556; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	TXREGx = 1; //Checksum nack
	MOVLW	0x01
	MOVWF	_TXREG
;	.line	557; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	Serial_Init_Receiver();
	CALL	_Serial_Init_Receiver
_00444_DS_:
;	.line	560; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	return;
	BRA	_00457_DS_
_00446_DS_:
	BANKSEL	_FrRXin_tmp
;	.line	563; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if((FrRXin_tmp == FrRXout)&&(FrRXout != FrRXin)) { //collision case : RX buffer full !
	MOVF	_FrRXin_tmp, W, B
	BANKSEL	_FrRXout
	XORWF	_FrRXout, W, B
	BNZ	_00448_DS_
_00546_DS_:
	BANKSEL	_FrRXout
	MOVF	_FrRXout, W, B
	BANKSEL	_FrRXin
	XORWF	_FrRXin, W, B
	BZ	_00448_DS_
;	.line	564; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	Serial_Init_Receiver(); // discard current packet... TODO:send an buffer full nack (2)
	CALL	_Serial_Init_Receiver
;	.line	565; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	return;
	BRA	_00457_DS_
_00448_DS_:
;	.line	568; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	c2 = (FrRXin + 1) % sizeof(FrRXbuf);
	MOVFF	_FrRXin, r0x00
	CLRF	r0x01
	INFSNZ	r0x00, F
	INCF	r0x01, F
	CLRF	POSTDEC1
	MOVLW	0x80
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__modsint
	MOVWF	r0x00
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVF	r0x00, W
; #	MOVWF	_fraiseISR_c2_1_112, B
; #	MOVF	_FrRXin_tmp, W, B
; #	XORWF	_fraiseISR_c2_1_112, W, B
	BANKSEL	_fraiseISR_c2_1_112
;	.line	569; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(FrRXin_tmp == c2) { //FrRXin_tmp == (FrRXin + 1): first byte following address = data length...
	MOVWF	_fraiseISR_c2_1_112, B
	BANKSEL	_FrRXin_tmp
	XORWF	_FrRXin_tmp, W, B
	BNZ	_00451_DS_
;	.line	570; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrRXin_end = (c & 31);
	MOVLW	0x1f
	BANKSEL	_fraiseISR_c_1_112
	ANDWF	_fraiseISR_c_1_112, W, B
	BANKSEL	_FrRXin_end
	MOVWF	_FrRXin_end, B
;	.line	571; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrRXin_end += 2;
	INCF	_FrRXin_end, F, B
	INCF	_FrRXin_end, F, B
	BANKSEL	_FrRXin
;	.line	572; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrRXin_end += FrRXin;
	MOVF	_FrRXin, W, B
	BANKSEL	_FrRXin_end
	ADDWF	_FrRXin_end, F, B
;	.line	573; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrRXin_end %= sizeof(FrRXbuf);
	BCF	_FrRXin_end, 7, B
_00451_DS_:
;	.line	576; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrRXbuf[FrRXin_tmp++] = c;
	MOVFF	_FrRXin_tmp, r0x00
	BANKSEL	_FrRXin_tmp
	INCF	_FrRXin_tmp, F, B
	CLRF	r0x01
	MOVLW	LOW(_FrRXbuf)
	ADDWF	r0x00, F
	MOVLW	HIGH(_FrRXbuf)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	_fraiseISR_c_1_112, INDF0
; removed redundant BANKSEL
;	.line	577; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(FrRXin_tmp == sizeof(FrRXbuf)) FrRXin_tmp = 0; //ring buffer index
	MOVF	_FrRXin_tmp, W, B
	XORLW	0x80
	BNZ	_00457_DS_
_00554_DS_:
	BANKSEL	_FrRXin_tmp
	CLRF	_FrRXin_tmp, B
_00457_DS_:
;	.line	578; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	return;
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_fraisedevice__fraiseSendBroadcast	code
_fraiseSendBroadcast:
;	.line	420; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	void fraiseSendBroadcast(const unsigned char *buf, unsigned char len)
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
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
;	.line	422; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	unsigned char i = len;
	MOVFF	r0x03, r0x04
;	.line	423; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	unsigned char ischar = 0;
	CLRF	r0x05
; #	MOVF	r0x03, W
; #	BTFSS	STATUS, 2
; #	GOTO	_00294_DS_
; #	GOTO	_00327_DS_
; #	MOVFF	r0x00, FSR0L
;	.line	426; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(!i) return;
	MOVF	r0x03, W
;	.line	427; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(*buf == 'C') {
	BTFSC	STATUS, 2
	BRA	_00327_DS_
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
; #	MOVWF	r0x06
; #	MOVF	r0x06, W
	MOVWF	r0x06
	XORLW	0x43
	BNZ	_00296_DS_
;	.line	428; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	ischar = 1;
	MOVLW	0x01
	MOVWF	r0x05
;	.line	429; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	len |= 128;
	BSF	r0x03, 7
_00296_DS_:
;	.line	432; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	i--;
	DECF	r0x04, F
;	.line	433; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	buf++;
	INCF	r0x00, F
	BNC	_00384_DS_
	INFSNZ	r0x01, F
	INCF	r0x02, F
_00384_DS_:
;	.line	434; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	Serial_Init_Driver();
	BCF	_PIE1bits, 5
	BCF	_RCSTAbits, 4
	BCF	_TRISCbits, 0
;	.line	435; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	TXxIE = 0;
	BCF	_PIE1bits, 4
_00303_DS_:
;	.line	437; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	while(TXxIF == 0);
	BTFSS	_PIR1bits, 4
	BRA	_00303_DS_
;	.line	439; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	TXSTAxbits.TX9D = 1; 	// address byte
	BSF	_TXSTAbits, 0
;	.line	440; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	chksum += (TXREGx = 0);	// adress is null = broadcast
	CLRF	_TXREG
	nop	
_00306_DS_:
	BTFSS	_PIR1bits, 4
	BRA	_00306_DS_
;	.line	443; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	TXSTAxbits.TX9D = 0;
	BCF	_TXSTAbits, 0
;	.line	445; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	chksum += (TXREGx = len);
	MOVFF	r0x03, _TXREG
	nop	
_00309_DS_:
	BTFSS	_PIR1bits, 4
	BRA	_00309_DS_
;	.line	448; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(ischar) chksum += (TXREGx = 'B');
	MOVF	r0x05, W
	BZ	_00313_DS_
; #	MOVLW	0x42
; #	MOVWF	_TXREG
; #	MOVLW	0x42
	MOVLW	0x42
	MOVWF	_TXREG
	ADDWF	r0x03, F
	BRA	_00318_DS_
_00313_DS_:
;	.line	449; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	else chksum += (TXREGx = 'b');
	MOVLW	0x62
	MOVWF	_TXREG
	MOVLW	0x62
	ADDWF	r0x03, F
_00318_DS_:
;	.line	451; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	while(i) {
	MOVF	r0x04, W
	BZ	_00320_DS_
	nop	
_00315_DS_:
	BTFSS	_PIR1bits, 4
	BRA	_00315_DS_
;	.line	453; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	chksum += (TXREGx = *buf);
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x05
	MOVFF	r0x05, _TXREG
	MOVF	r0x05, W
	ADDWF	r0x03, F
;	.line	454; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	i--;
	DECF	r0x04, F
;	.line	455; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	buf++;
	INCF	r0x00, F
	BNC	_00385_DS_
	INFSNZ	r0x01, F
	INCF	r0x02, F
_00385_DS_:
	BRA	_00318_DS_
_00320_DS_:
	nop	
_00321_DS_:
	BTFSS	_PIR1bits, 4
	BRA	_00321_DS_
;	.line	459; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	TXREGx = -chksum;
	COMF	r0x03, W
	MOVWF	_TXREG
	INCF	_TXREG, F
	nop	
_00324_DS_:
	BTFSS	_PIR1bits, 4
	BRA	_00324_DS_
;	.line	462; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	Serial_Init_Receiver();
	CALL	_Serial_Init_Receiver
_00327_DS_:
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
S_fraisedevice__fraiseDecodeNextTXPacket	code
_fraiseDecodeNextTXPacket:
;	.line	337; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	static void fraiseDecodeNextTXPacket()
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
; #	MOVFF	r0x03, POSTDEC1
; #; info ==> [localregs] entry end

; #	BTFSC	_TXSTAbits, 1
; #	GOTO	_00200_DS_
; #	GOTO	_00238_DS_
; #	CALL	_fraiseGetTXChar
;	.line	341; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(TXSTAxbits.TRMT == 0) return; //return if a serial transmission is in progress
	MOVFF	r0x03, POSTDEC1
;	.line	343; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	len = fraiseGetTXChar(); //1st byte = len
	BTFSS	_TXSTAbits, 1
	BRA	_00238_DS_
	CALL	_fraiseGetTXChar
	MOVWF	r0x00
;	.line	344; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(!len) {
	MOVF	r0x00, W
	BNZ	_00202_DS_
	BANKSEL	_FrTXout
;	.line	346; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrTXin = FrTXout=0;
	CLRF	_FrTXout, B
	BANKSEL	_FrTXin
	CLRF	_FrTXin, B
;	.line	347; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	return; //?
	BRA	_00238_DS_
_00202_DS_:
;	.line	350; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	txout_end = FrTXout;
	MOVFF	_FrTXout, r0x01
;	.line	351; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	txout_end += len;
	MOVF	r0x00, W
	ADDWF	r0x01, F
;	.line	353; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	c=fraiseGetTXChar(); //2nd byte = command (or hi nibble of address)
	CALL	_fraiseGetTXChar
	MOVWF	r0x02
;	.line	354; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	len -= 1;
	DECF	r0x00, F
;	.line	356; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(c == '#') {						
	MOVF	r0x02, W
	XORLW	0x23
	BNZ	_00217_DS_
;	.line	358; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(len < 1) goto discard;
	MOVLW	0x01
	SUBWF	r0x00, W
	BTFSS	STATUS, 0
	BRA	_00237_DS_
;	.line	359; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	c = fraiseGetTXChar(); //what is the command ?
	CALL	_fraiseGetTXChar
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
;	.line	360; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(c == 'i'){
	MOVWF	r0x02
	XORLW	0x69
	BNZ	_00214_DS_
;	.line	362; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	fraiseInit();
	CALL	_fraiseInit
;	.line	363; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	goto discard;
	BRA	_00237_DS_
_00214_DS_:
;	.line	370; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	else if(c == 'r'){
	MOVF	r0x02, W
	XORLW	0x72
	BNZ	_00211_DS_
;	.line	371; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	Serial_Init_Receiver();
	CALL	_Serial_Init_Receiver
;	.line	372; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	goto discard;
	BRA	_00237_DS_
_00211_DS_:
;	.line	374; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	else if(c == 's'){
	MOVF	r0x02, W
	XORLW	0x73
	BZ	_00281_DS_
	BRA	_00237_DS_
_00281_DS_:
;	.line	376; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	SerDrv_Off();
	BSF	_TRISCbits, 0
;	.line	377; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	RCSTAxbits.ADDEN = 1; 
	BSF	_RCSTAbits, 3
;	.line	378; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	RCxIE = 1;		
	BSF	_PIE1bits, 5
;	.line	379; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	TXxIE = 0;
	BCF	_PIE1bits, 4
	;	VOLATILE READ - BEGIN
	MOVF	_RCREG, W
	;	VOLATILE READ - END
	;	VOLATILE READ - BEGIN
	MOVF	_RCREG, W
	;	VOLATILE READ - END
;	.line	382; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	RCSTAxbits.CREN = 0;		
	BCF	_RCSTAbits, 4
;	.line	383; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	RCSTAxbits.CREN = 1;		
	BSF	_RCSTAbits, 4
;	.line	385; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	goto discard;
	BRA	_00237_DS_
_00217_DS_:
;	.line	391; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(c == 'C') { //"char" packet
	MOVF	r0x02, W
	XORLW	0x43
	BZ	_00222_DS_
;	.line	396; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(c == 'B') { //"bytes" packet
	MOVF	r0x02, W
	XORLW	0x42
	BZ	_00285_DS_
	BRA	_00237_DS_
_00285_DS_:
;	.line	404; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(ischar) len |= 128;
	BRA	_00225_DS_
_00222_DS_:
;	.line	404; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(ischar) len |= 128;
	BSF	r0x00, 7
_00225_DS_:
;	.line	406; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	fraiseSendInit(len);
	MOVFF	r0x00, _FrTXchksum
	MOVF	r0x00, W
	BANKSEL	_FrTXpacket
	MOVWF	_FrTXpacket, B
	MOVLW	0x01
	BANKSEL	_FrTXpacket_i
	MOVWF	_FrTXpacket_i, B
_00231_DS_:
	BANKSEL	_FrTXout
;	.line	408; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	while(FrTXout != txout_end) {
	MOVF	_FrTXout, W, B
	XORWF	r0x01, W
	BZ	_00234_DS_
;	.line	409; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	c = fraiseGetTXChar();
	CALL	_fraiseGetTXChar
; #	MOVWF	r0x02
; #	MOVF	r0x02, W
;	.line	410; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	fraiseSendData(c); 
	MOVWF	r0x02
	BANKSEL	_FrTXchksum
	ADDWF	_FrTXchksum, F, B
	MOVLW	LOW(_FrTXpacket)
	BANKSEL	_FrTXpacket_i
	ADDWF	_FrTXpacket_i, W, B
	MOVWF	r0x00
	CLRF	r0x03
	MOVLW	HIGH(_FrTXpacket)
	ADDWFC	r0x03, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	r0x02, INDF0
; removed redundant BANKSEL
	INCF	_FrTXpacket_i, F, B
	BRA	_00231_DS_
_00234_DS_:
;	.line	412; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	fraiseSendClose();	
	MOVLW	LOW(_FrTXpacket)
	BANKSEL	_FrTXpacket_i
	ADDWF	_FrTXpacket_i, W, B
	MOVWF	r0x00
	CLRF	r0x02
	MOVLW	HIGH(_FrTXpacket)
	ADDWFC	r0x02, F
	BANKSEL	_FrTXchksum
	COMF	_FrTXchksum, W, B
	MOVWF	r0x03
	INCF	r0x03, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	r0x03, INDF0
	BANKSEL	_FrTXpacket_i
	INCF	_FrTXpacket_i, F, B
	MOVFF	_FrTXpacket_i, _FrTXpacket_len
	BANKSEL	_FrTXtries
;	.line	413; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrTXtries = 0;
	CLRF	_FrTXtries, B
_00237_DS_:
;	.line	416; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrTXout = txout_end;
	MOVFF	r0x01, _FrTXout
_00238_DS_:
;	.line	417; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	return;
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_fraisedevice__fraiseSend	code
_fraiseSend:
;	.line	294; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	char fraiseSend(const unsigned char *buf,unsigned char len)
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
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
;	.line	298; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrTXbufFree = FrTXout;
	MOVFF	_FrTXout, _FrTXbufFree
	BANKSEL	_FrTXin
;	.line	299; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrTXbufFree -= FrTXin;
	MOVF	_FrTXin, W, B
	BANKSEL	_FrTXbufFree
	SUBWF	_FrTXbufFree, F, B
;	.line	300; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrTXbufFree -= 1;
	DECF	_FrTXbufFree, F, B
;	.line	302; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if ((len + 3) > FrTXbufFree) {
	MOVFF	r0x03, r0x04
	CLRF	r0x05
	MOVLW	0x03
	ADDWF	r0x04, F
	BTFSC	STATUS, 0
	INCF	r0x05, F
	MOVFF	_FrTXbufFree, r0x06
	CLRF	r0x07
	MOVF	r0x07, W
	ADDLW	0x80
	MOVWF	PRODL
	MOVF	r0x05, W
	ADDLW	0x80
	SUBWF	PRODL, W
	BNZ	_00192_DS_
	MOVF	r0x04, W
	SUBWF	r0x06, W
_00192_DS_:
	BC	_00171_DS_
;	.line	304; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	return -1;
	SETF	WREG
	BRA	_00177_DS_
_00171_DS_:
;	.line	306; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if (len < 2) {
	MOVLW	0x02
	SUBWF	r0x03, W
	BC	_00173_DS_
;	.line	308; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	return 0;
	CLRF	WREG
	BRA	_00177_DS_
_00173_DS_:
;	.line	310; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	len -= 1; //don't keep '\n' terminator
	DECF	r0x03, F
;	.line	311; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	fraisePutChar(len); //prefix tx packet buffer by its length
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_fraisePutChar
	MOVF	POSTINC1, F
;	.line	313; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	while(i < len) { //fill tx packet buffer
	CLRF	r0x04
_00174_DS_:
	MOVF	r0x03, W
	SUBWF	r0x04, W
	BC	_00176_DS_
;	.line	314; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	c = buf[i];
	MOVF	r0x04, W
	ADDWF	r0x00, W
	MOVWF	r0x05
	CLRF	WREG
	ADDWFC	r0x01, W
	MOVWF	r0x06
	CLRF	WREG
	ADDWFC	r0x02, W
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	CALL	__gptrget1
;	.line	315; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	i++;
	INCF	r0x04, F
;	.line	316; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	fraisePutChar(c);
	MOVWF	POSTDEC1
	CALL	_fraisePutChar
	MOVF	POSTINC1, F
	BRA	_00174_DS_
_00176_DS_:
;	.line	320; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrTXbufFree = FrTXout;
	MOVFF	_FrTXout, _FrTXbufFree
	BANKSEL	_FrTXin
;	.line	321; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrTXbufFree -= FrTXin;
	MOVF	_FrTXin, W, B
	BANKSEL	_FrTXbufFree
	SUBWF	_FrTXbufFree, F, B
;	.line	322; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrTXbufFree -= 1;
	DECF	_FrTXbufFree, F, B
;	.line	323; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	return 0;
	CLRF	WREG
_00177_DS_:
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
S_fraisedevice__fraiseGetTXChar	code
_fraiseGetTXChar:
;	.line	284; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	static unsigned char fraiseGetTXChar()
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	BANKSEL	_FrTXin
;	.line	288; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(FrTXin == FrTXout) return 0; //underflow check
	MOVF	_FrTXin, W, B
	BANKSEL	_FrTXout
	XORWF	_FrTXout, W, B
	BNZ	_00158_DS_
	CLRF	WREG
	BRA	_00159_DS_
_00158_DS_:
;	.line	289; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	c = FrTXbuf[FrTXout];
	MOVLW	LOW(_FrTXbuf)
	BANKSEL	_FrTXout
	ADDWF	_FrTXout, W, B
	MOVWF	r0x00
	CLRF	r0x01
	MOVLW	HIGH(_FrTXbuf)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVFF	INDF0, r0x00
; removed redundant BANKSEL
;	.line	290; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrTXout++;
	INCF	_FrTXout, F, B
;	.line	291; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	return c;
	MOVF	r0x00, W
_00159_DS_:
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_fraisedevice__fraisePutChar	code
_fraisePutChar:
;	.line	274; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	static void fraisePutChar(unsigned char c)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	276; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if((FrTXin + 1) == FrTXout) {
	MOVFF	_FrTXin, r0x01
	CLRF	r0x02
	INFSNZ	r0x01, F
	INCF	r0x02, F
	MOVFF	_FrTXout, r0x03
	CLRF	r0x04
	MOVF	r0x01, W
	XORWF	r0x03, W
	BNZ	_00151_DS_
	MOVF	r0x02, W
	XORWF	r0x04, W
	BZ	_00152_DS_
_00151_DS_:
	BRA	_00145_DS_
_00152_DS_:
;	.line	278; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	return; //overflow check done by fraiseSend, but...
	BRA	_00146_DS_
_00145_DS_:
;	.line	280; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrTXbuf[FrTXin] = c;
	MOVLW	LOW(_FrTXbuf)
	BANKSEL	_FrTXin
	ADDWF	_FrTXin, W, B
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_FrTXbuf)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	r0x00, INDF0
; removed redundant BANKSEL
;	.line	281; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrTXin++;
	INCF	_FrTXin, F, B
_00146_DS_:
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_fraisedevice__fraiseGetInterruptEnable	code
_fraiseGetInterruptEnable:
	BANKSEL	_FrInterruptEnabled
;	.line	268; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	return FrInterruptEnabled;
	MOVF	_FrInterruptEnabled, W, B
	RETURN	

; ; Starting pCode block
S_fraisedevice__fraiseSetInterruptEnable	code
_fraiseSetInterruptEnable:
;	.line	256; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	void fraiseSetInterruptEnable(char enable)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	258; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrInterruptEnabled = enable;
	MOVFF	r0x00, _FrInterruptEnabled
;	.line	259; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	if(enable == 0) {
	MOVF	r0x00, W
	BNZ	_00134_DS_
;	.line	260; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	Serial_Init_Receiver();
	CALL	_Serial_Init_Receiver
;	.line	261; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	RCxIE = 0;
	BCF	_PIE1bits, 5
;	.line	262; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	TXxIE = 0;
	BCF	_PIE1bits, 4
_00134_DS_:
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_fraisedevice__fraiseInit	code
_fraiseInit:
	BANKSEL	_FrTXin
;	.line	214; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrTXin = 0;
	CLRF	_FrTXin, B
	BANKSEL	_FrTXout
;	.line	215; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrTXout = 0;
	CLRF	_FrTXout, B
	BANKSEL	_FrTXbufFree
;	.line	216; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrTXbufFree = 255;
	SETF	_FrTXbufFree, B
;	.line	219; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	SerDrv_Off();
	BSF	_TRISCbits, 0
;	.line	220; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	InitSerDrv();
	BCF	_LATCbits, 0
	BSF	_TRISCbits, 0
;	.line	224; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	SPBRGHx = BRGHL/256;
	CLRF	_SPBRGH
;	.line	225; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	SPBRGx = BRGHL%256;
	MOVLW	0x3f
	MOVWF	_SPBRG
;	.line	227; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	BAUDCONxbits.BRG16 = 1;
	BSF	_BAUDCONbits, 3
;	.line	229; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	TXSTAxbits.TXEN = 1;
	BSF	_TXSTAbits, 5
;	.line	230; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	TXSTAxbits.BRGH = 1;
	BSF	_TXSTAbits, 2
;	.line	231; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	TXSTAxbits.TX9 = 1;
	BSF	_TXSTAbits, 6
;	.line	232; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	TXSTAxbits.TX9D = 0;
	BCF	_TXSTAbits, 0
;	.line	234; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	RCSTAxbits.RX9 = 1;
	BSF	_RCSTAbits, 6
;	.line	235; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	RCSTAxbits.SPEN = 1;
	BSF	_RCSTAbits, 7
	BANKSEL	_FraiseStatus
;	.line	237; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FraiseStatus.VAL = 0;
	CLRF	_FraiseStatus, B
	BANKSEL	_FraiseState
;	.line	238; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FraiseState = fIDLE;
	CLRF	_FraiseState, B
	BANKSEL	_FrRXin
;	.line	239; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrRXin = 0;
	CLRF	_FrRXin, B
	BANKSEL	_FrRXout
;	.line	240; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrRXout = 0;
	CLRF	_FrRXout, B
	BANKSEL	_FrTXpacket_len
;	.line	241; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrTXpacket_len = 0;
	CLRF	_FrTXpacket_len, B
;	.line	243; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrID = eeReadByte(EE_ID);
	MOVLW	0x00
	CLRF	POSTDEC1
	CALL	_eeReadByte
	BANKSEL	_FrID
	MOVWF	_FrID, B
	MOVF	POSTINC1, F
;	.line	246; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	TXxIP = 0;
	BCF	_IPR1bits, 4
;	.line	247; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	RCxIP = 0;
	BCF	_IPR1bits, 5
;	.line	248; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	FrInterruptEnabled = 1;
	MOVLW	0x01
	BANKSEL	_FrInterruptEnabled
	MOVWF	_FrInterruptEnabled, B
	BANKSEL	_stdout
;	.line	251; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	stdout = STREAM_USER;
	CLRF	_stdout, B
; removed redundant BANKSEL
	CLRF	(_stdout + 1), B
	MOVLW	0x2f
; removed redundant BANKSEL
	MOVWF	(_stdout + 2), B
;	.line	253; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	Serial_Init_Receiver();
	CALL	_Serial_Init_Receiver
	RETURN	

; ; Starting pCode block
S_fraisedevice__fraiseSetID	code
_fraiseSetID:
;	.line	207; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	void fraiseSetID(unsigned char id)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	209; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	eeWriteByte(EE_ID,FrID = id);
	MOVFF	r0x00, _FrID
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	CLRF	POSTDEC1
	CALL	_eeWriteByte
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_fraisedevice__Serial_Init_Receiver	code
_Serial_Init_Receiver:
_00105_DS_:
;	.line	110; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	while(TXSTAxbits.TRMT == 0);
	BTFSS	_TXSTAbits, 1
	BRA	_00105_DS_
;	.line	111; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	SerDrv_Off();
	BSF	_TRISCbits, 0
;	.line	112; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	WREG=RCREGx;
	MOVF	_RCREG, W
	nop	
;	.line	114; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	WREG=RCREGx;
	MOVF	_RCREG, W
;	.line	115; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	RCSTAxbits.CREN = 0;
	BCF	_RCSTAbits, 4
;	.line	116; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	RCSTAxbits.CREN = 1;
	BSF	_RCSTAbits, 4
;	.line	117; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	RCSTAxbits.ADDEN = 1;
	BSF	_RCSTAbits, 3
;	.line	118; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	RCxIE = 1;
	BSF	_PIE1bits, 5
;	.line	119; C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c	TXxIE = 0;
	BCF	_PIE1bits, 4
	RETURN	

; ; Starting pCode block
___str_0:
	DB	0x25, 0x64, 0x20, 0x00


; Statistics:
; code size:	 2784 (0x0ae0) bytes ( 2.12%)
;           	 1392 (0x0570) words
; udata size:	  471 (0x01d7) bytes (12.80%)
; access size:	    8 (0x0008) bytes


	end
