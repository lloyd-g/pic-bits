rem sdcc -S -V -mpic14 -p16f876 -D__16f876 --use-non-free simple.c
sdcc.exe  -mpic14 -p16f876 -D__16f876 --opt-code-speed --debug  --out-fmt-ihx -mpic14  -I"C:\Program Files (x86)\SDCC\include" -I"C:\Program Files (x86)\SDCC\non-free\include" -I"C:\Program Files (x86)\gputils\bin" -c simple.c -o simple.hex
cmd