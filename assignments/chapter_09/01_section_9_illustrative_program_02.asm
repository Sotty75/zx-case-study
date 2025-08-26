    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; Write  a  program  to  generate  a  square  wave  with  period  of  .500us  if  the  system  frequency  is 
    ; 2 MHz.  Use  bit  Do  of  the  output  port  PORTl  to  display  the  waveform.

    ORG 0x8000

PORT DB $01

START

.initialization
    LD C, %01010101

.rotate
    LD A, C
    RLCA 
    LD C, A
    AND $01
    LD (PORT), A
    LD B, 64$
.wait
    DJNZ .wait
    JP .rotate


.loop
    JP .loop    

    SAVESNA "sna/snapshot.sna", START     ; Creazione automatica del file TAP

END

