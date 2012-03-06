#include <avr/io.h>

int main(void) {
  DDRD = 0b01100000; /* LED Ports are in output mode */
  PORTD = 0b10000000; /* Enable pull-up on PD7 */
  while(1) {
    if(PIND & (1<<PD7)) {
        PORTD |= 1<<PD6; /* Red off */
        PORTD &= ~(1<<PD5); /* Blue on */
    } else {
        PORTD |= 1<<PD5; /* Blue off */
        PORTD &= ~(1<<PD6); /* Red on */
    }
  }
  return 0;
}
