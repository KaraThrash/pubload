#ifndef F_CPU
#define F_CPU 1000000UL
#endif

#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>

typedef enum { down=0, up } buttonstate;

#define LED_PIN0 (1 << PB0) //blue+green source red+yellow sink
#define LED_PIN1 (1 << PB1) //blue+yellow source red+green sink
#define LED_PIN2 (1 << PB2) //red source blue sink
#define KEY0     (1 << PB3)//left switch
#define KEY1     (1 << PB4)//rightswitch
volatile uint8_t  savedcombo = 0b0;
volatile uint8_t attemptedcombo = 0b0;
volatile uint8_t history = 0; //debounce logic
uint8_t numberofpresses = 0; //6 means combo is entered
uint8_t timecounter = 0; //counter for lockout interrupt cycle
uint8_t islocked = 0; // false == unlocked
uint8_t updown = 0; // to avoid button holding counting more than once
uint8_t whichbutton = 0; // left|right

ISR(TIMER0_COMPA_vect) {
  if(timecounter > 34 )//~10seconds
  {DDRB = 0;PORTB = 0;} //turn off leds to conserve power
  else{timecounter++;} //so it doesnt turn back on when the int wraps around

    if(timecounter > 11 && numberofpresses > 0)//~3seconds
    {
      //fewer than 6 bits were entered and should remain in the same state reseting the attempt to lock|unlock
        if(islocked == 0){savedcombo = 0;}
          attemptedcombo = 0;
          numberofpresses = 0;
          timecounter = 0;
          FlashYellow();
    }

}

int main(void) {


  buttonstate keystate = down;

  DDRB = LED_PIN0|LED_PIN1; // set to output
  PORTB = 0;

  OCR0A = 0xff;
  TCCR0B = 0b101;
  // Enable the timer0 comparator a interrupt
  TIMSK = (1 << OCIE0A);
  sei();


  while (1) {
      if(timecounter < 34){ledlogic(islocked);} //check for power consumption timeout


      history = history << 1; // shift debounce to listen/compare for key presses

      //update history based on keystate
      if ((PINB & KEY0) == 0 ) // 0 when up //left button
        {history = history | 0x1; whichbutton = 0;}
      if ( (PINB & KEY1) == 0) // 0 when up //right button
        {history = history | 0x1; whichbutton = 1;}

      // compare key with debounce history
      if ((history & 0b111111) == 0b111111){  keystate = up;}
      if ((history & 0b111111) == 0){keystate = down;}


        if (keystate == up && numberofpresses < 7){
            if(updown == 0)
            {
            updown = 1;// to prevent holding the button downing causing a 1<>0 loop
            islocked = presslogic(islocked,whichbutton);
            }

      }
      else{
        updown = 0; // to prevent holding the button downing causing a 1<>0 loop
      }
  }
}
int ledlogic(int lockstate)
{
    if(lockstate == 0  )
    {
        DDRB = LED_PIN0|LED_PIN1; // set 0 and 1 pins to output, default is input
        PORTB = LED_PIN0;//green
        _delay_ms(1); //change quickly to have Green+Yellow on at the same time

        PORTB = LED_PIN1; //yellow
        _delay_ms(1);
        }
        else
        {
        DDRB = LED_PIN2|LED_PIN1; // set 0 and 1 pins to output, default is input
        PORTB = LED_PIN2;//red
    }

}
int presslogic(int lockstate,int whichbutton)
{
  timecounter = 0; //reset lockout counter
  PORTB = LED_PIN1; //blue
  DDRB = LED_PIN1|LED_PIN2;
  _delay_ms(20); //delay to have blue flash and leave red || G+yellow on
    if(numberofpresses < 6){ // to prevent logic collisons on successive presses after 6th press
      numberofpresses++;

      if(lockstate == 0 )
      {
        savedcombo = savedcombo << 1;
        savedcombo += whichbutton; //update combo to lock safe
        DDRB = LED_PIN1|LED_PIN2; // display G+Y in unlocked/programming mode
        PORTB = LED_PIN0;
          if(numberofpresses == 6) //combo must be length 6
          {
            PORTB = LED_PIN2; //led red in lock mode
            lockstate = 1; //lock safe
             numberofpresses = 0;
             attemptedcombo = 0;
           }

      }
      else
      { //when safe is locked
        attemptedcombo = attemptedcombo << 1;
        attemptedcombo += whichbutton;
        PORTB = LED_PIN2;
          if(numberofpresses == 6) //at 6 the attempted combo is either right or wrong and should check against saved combo
          {

            if(attemptedcombo == savedcombo)
            {
              // correct combo entered, unlock safe and reset combinations
              numberofpresses = 0;
               attemptedcombo = 0;
               savedcombo = 0;
               lockstate = 0;

               PORTB = LED_PIN0;
             }else
             {
               //incorrect combo
               numberofpresses = 0;
               attemptedcombo = 0;
               FlashYellow();
             }



          }

      }
    }
  return lockstate;
}
int FlashYellow()
{
  uint8_t count = 5;
  DDRB = LED_PIN1|LED_PIN0;

      while (count > 0 )
      {
        PORTB = LED_PIN1;//yellow
        _delay_ms(50);
        PORTB = 0; // delay and rotate portb to flash yellow
        _delay_ms(50);
        count--;
      }


}
