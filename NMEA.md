#reading GPS.

# Introduction #

If you want to deal with GPS devices in micros your in luck. As most of them use a serial UART protocol. Known as Bad news it's big, they spew out tonnes of data and its a little obscure.
http://aprs.gids.nl/nmea/http://aprs.gids.nl/nmea/
http://en.wikipedia.org/wiki/NMEA_0183http://en.wikipedia.org/wiki/NMEA_0183


# Details #

it is split into message starting $GP and ending with CR.
the most useful one I've found is $GPGGA Global Positioning System Fix Data.
and it looks like
$GPGGA,hhmmss.ss,llll.ll,a,yyyyy.yy,a,x,xx,x.x,x.x,M,x.x,M,x.x,xxxx\*hh

> hhmmss.ss = UTC of position

> llll.ll = latitude of position

> a = N or S

> yyyyy.yy = Longitude of position

> a = E or W

> x = GPS Quality indicator (0=no fix, 1=GPS fix, 2=Dif. GPS fix)

> xx = number of satellites in use

> x.x = horizontal dilution of precision

> x.x = Antenna altitude above mean-sea-level

> M = units of antenna altitude, meters

> x.x = Geoidal separation

> M = units of geoidal separation, meters

> x.x = Age of Differential GPS data (seconds)

> xxxx = Differential reference station ID

the problems are removing the 18 other types of message and then extracting the comma separated fields on a small micro?


An example from wiki.
```
$GPGGA,092750.000,5321.6802,N,00630.3372,W,1,8,1.03,61.7,M,55.2,M,,*76
$GPGSA,A,3,10,07,05,02,29,04,08,13,,,,,1.72,1.03,1.38*0A
$GPGSV,3,1,11,10,63,137,17,07,61,098,15,05,59,290,20,08,54,157,30*70
$GPGSV,3,2,11,02,39,223,19,13,28,070,17,26,23,252,,04,14,186,14*79
$GPGSV,3,3,11,29,09,301,24,16,09,020,,36,,,*76
$GPRMC,092750.000,A,5321.6802,N,00630.3372,W,0.02,31.66,280511,,,A*43
$GPGGA,092751.000,5321.6802,N,00630.3371,W,1,8,1.03,61.7,M,55.3,M,,*75
$GPGSA,A,3,10,07,05,02,29,04,08,13,,,,,1.72,1.03,1.38*0A
$GPGSV,3,1,11,10,63,137,17,07,61,098,15,05,59,290,20,08,54,157,30*70
$GPGSV,3,2,11,02,39,223,16,13,28,070,17,26,23,252,,04,14,186,15*77
$GPGSV,3,3,11,29,09,301,24,16,09,020,,36,,,*76
$GPRMC,092751.000,A,5321.6802,N,00630.3371,W,0.06,31.66,280511,,,A*45
```

and some code to checksum from same wiki

```
#include <stdio.h>
#include <string.h>
 
int checksum(char *s) {
    int c = 0;
 
    while(*s)
        c ^= *s++;
  
int main()
{
    return c;
}

    char mystring[] = "GPRMC,092751.000,A,5321.6802,N,00630.3371,W,0.06,31.66,280511,,,A";
 
    printf("String: %s\nChecksum: 0x%02X\n", mystring, checksum(mystring));
 
    return 0;
}
```

# conclusion #
can't be that hard can it?