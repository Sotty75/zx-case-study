    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; Specify  the  register  contents  and  the  flag  status  after  the  execution  of  the  following instructions.  
    ; What  is  being  displayed  at  PORTl? 

PORT1 EQU $FE

START

    ; Setup registers
    LD A, $FF
    LD B, $77
    LD C, $89

    SUB A
    LD B, A
    ADD A, $A9
    LD C, $57
    ADD A, C
    DEC A
    OUT (PORT1), A

LOOP:
    jp LOOP        ; Loop infinito

END

; Creazione automatica del file TAP
    SAVESNA "sna/snapshot.sna", START
