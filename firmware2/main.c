/*********************************************************************
 *               analog example for Versa2.0
 *	Analog capture on connectors K1, K2, K3 and K5. 
 *********************************************************************/

#define BOARD Versa2

#include <fruit.h>
#include <FSLP.h>
#include <analog.h>
#include <switch.h>

t_delay mainDelay;

void setup(void) {	
//----------- Setup ----------------
	fruitInit();
			
	pinModeDigitalOut(LED); 	// set the LED pin mode to digital out
	digitalClear(LED);		// clear the LED
	delayStart(mainDelay, 5000); 	// init the mainDelay to 5 ms

	pinModeDigitalOut(K11); 	
	digitalClear(K11);

	
	analogInit();
	switchInit();

	
	
	analogSelect(6, K6); //filter resonnance
	analogSelect(7, K7); //filter cutoff
	analogSelect(8, K8); //Master 1
	analogSelect(9, K9); //Master 2
	analogSelect(10, K10); //filter type

	switchSelect(0, K12); //filter type
//----------- FSLP setup ----------------
	
	FSLP_Init();
}

void loop() {
// ---------- Main loop ------------
	fraiseService();	// listen to Fraise events
	switchService();  analogService();	// analog management routine

	if(delayFinished(mainDelay)) // when mainDelay triggers :
	{
		delayStart(mainDelay, 5000); 	// re-init mainDelay
		if(!switchSend()) analogSend();		// send analog channels that changed
		
	}
}

// Receiving

void fraiseReceiveChar() // receive text
{
	unsigned char c;
	
	c=fraiseGetChar();
	if(c=='L'){		//switch LED on/off 
		c=fraiseGetChar();
		digitalWrite(LED, c!='0');		
	}
	else if (c == 'O') {		//switch LED on/off 
		c = fraiseGetChar();
		digitalWrite(K11, c != '0');
	}
	else if(c=='E') { 	// echo text (send it back to host)
		printf("C");
		c = fraiseGetLen(); 			// get length of current packet
		while(c--) printf("%c",fraiseGetChar());// send each received byte
		putchar('\n');				// end of line
	}	
}

