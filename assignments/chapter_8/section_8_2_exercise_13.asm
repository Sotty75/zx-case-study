    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; Write  instructions  to  load  40FFh  into  register  HL  and  increment  HL.  
    ; Specify  the contents  of  register  HL.

START

    LD HL, $40FF
    INC HL    

LOOP:
    jp LOOP        ; Loop infinito

END

; Creazione automatica del file TAP
    SAVESNA "sna/snapshot.sna", START
