    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; Calculate  the  value  of  the  memory  pointer  if  register  IX  contains  2000h  with  the 
    ; displacement  byte  80h.

PORT1 EQU $FE

START

    LD IY, $E000
    LD (IY-$80), $A2 ; il displacemente deve essere tra -128 e +127, quindi +80h non funziona, mentre funziona -80h
   
LOOP:
    jp LOOP        ; Loop infinito

END

; Creazione automatica del file TAP
    SAVESNA "sna/snapshot.sna", START
