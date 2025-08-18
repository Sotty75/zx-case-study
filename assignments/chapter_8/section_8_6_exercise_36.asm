    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; The  following  block  of  data  is  stored  in  memory  locations  INBUF.  Transfer  the 
    ; data  to  the  locations  OUTBUF  in  the  reverse  order. 
    ; Data  (H):  47, 97, F2, 9C, A2, 98 

OUTBUF EQU $E000
INBUF:
    DB $47, $97, $F2, $FC, $A2, $98
DIS EQU $06

START:
    LD B, $06

    LD IX, INBUF + $05
    LD IY, OUTBUF

NEXT: 
    LD A, (IX + 0)
    LD (IY + 0), A
    DEC IX
    INC IY
    DEC B
    JP NZ, NEXT

LOOP:
    jp LOOP        ; Loop infinito





END

; Creazione automatica del file TAP
    SAVESNA "sna/snapshot.sna", START
