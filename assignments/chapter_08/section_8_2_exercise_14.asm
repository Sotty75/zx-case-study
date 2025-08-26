    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; Register  HL  contains  20FFh.  What  are  the  contents  of  register  HL  if  the  byte  01  h 
    ; is  added  (not  incremented)  to  register  L?  What  are  the  statuses  of  the  S,  Z,  and CY  flags  after  the  addition? 

START

    LD HL, $20FF
    LD A, L
    ADD A, $01  
    LD L, A

LOOP:
    jp LOOP        ; Loop infinito

END

; Creazione automatica del file TAP
    SAVESNA "sna/snapshot.sna", START
