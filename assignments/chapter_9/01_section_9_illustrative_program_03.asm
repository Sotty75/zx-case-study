    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; A set  of  ten  readings  is  stored  in  memory  locations  starting  from  INBUF.  Write  a  program 
    ; to  find  the  highest  reading  in  the  set,  and  store  that  reading  in  memory  OUTBUF. 

    ORG 0x8000

INBUF DB $01, $AA, $F1, $53, $AF, $F5, $34, $56, $F5, $23
OUTBUF DB $00

START

.initialization
    LD A, $00
    LD BC, $000A
    LD HL, INBUF

.next_byte
    CPI
    JP P, .skip_byte
    LD IX, HL
    LD A, (IX-1)

.skip_byte
    JP PE, .next_byte

.publish
    LD (OUTBUF), A


.loop
    JP .loop    

    SAVESNA "sna/snapshot.sna", START     ; Creazione automatica del file TAP

END

