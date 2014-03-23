sdcc -V --use-non-free --debug -mpic14 -p16f876 int-serial.c
gpsim -pp16f876 -s int-serial.cod int-serial.asm
cmd