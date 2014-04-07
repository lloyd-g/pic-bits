rem sdcc -V --use-non-free --debug -mpic14 -p16f876 int-serial.c
rem gpsim -pp16f876 -s int-serial.cod int-serial.asm
gpsim -c env.conf -s 3-uart_tx.cod 
rem gpsim -pp16f876 -s 3-uart_tx.cod -c suart.stc > scope.ch0 = "portc6"
cmd