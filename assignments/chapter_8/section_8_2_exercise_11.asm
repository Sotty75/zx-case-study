    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; In the previous  assignment  (#10),  replace  the  increment  instruction  with  the  instruction ADD  A, 01H.
    ; Explain how the flags are affected during the addition the  addition. 

START

    LD A, $FF
    ADD A, $01

LOOP:
    jp LOOP        ; Loop infinito

END

; Creazione automatica del file TAP
    SAVESNA "sna/snapshot.sna", START
