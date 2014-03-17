sdcc.exe  -mpic14 -p16f876 -D__16f876 -I"C:\Program Files (x86)\SDCC\include" -I"C:\Program Files (x86)\SDCC\non-free\include" -I"C:\Program Files (x86)\gputils\bin" -c simple.c 

rem sdcc -V --use-non-free -mpic14 -p16f877 -c simple.c


rem sdcc -S -V -mpic14 -p16f876 -D__16f876 --use-non-free simple.c
rem sdcc.exe  -mpic14 -p16f876 -D__16f876  --out-fmt-ihx -I"C:\Program Files (x86)\SDCC\include" -I"C:\Program Files (x86)\SDCC\non-free\include" -I"C:\Program Files (x86)\gputils\bin" -c simple.c -o simple.hex







cmd