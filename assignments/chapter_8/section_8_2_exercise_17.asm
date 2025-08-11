    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; Find  the  results  of  the  following  operations  and  explain  the  difference  between  the 
    ; two  results.

START

    SUB A
    LD HL, $971F
    LD BC, $8F9C
    ADD A, L
    ADD A, C
    ADD A, B
    SUB H

    SUB A
    LD HL, $971F
    LD BC, $8F9C
    ADD A, L
    ADD A, C
    SUB H
    ADD A, B

LOOP:
    jp LOOP        ; Loop infinito

END

; Creazione automatica del file TAP
    SAVESNA "sna/snapshot.sna", START
