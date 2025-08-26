    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; this section covers the usage of the stack, push and pop instructions
    ; and the usage of subroutines

START

; in this block, i test the location of the address referenced by default
; in the zx spectrum by the SP by writing a byte on it directly with an LD instruction 
use_case_01:
    LD SP, $FFFF
    LD A, $FF
    PUSH AF

    LD B, $FF
    LD DE, $AA
use_case_02_push:
    PUSH DE
    DEC B
    JP NZ, use_case_02_push

    LD B, $FF
use_case_02_pop:
    POP DE
    DEC B
    JP NZ, use_case_02_pop

use_case_03_exchange:
    LD SP, $FFFF
    PUSH BC
    PUSH DE
    POP BC
    POP DE

loop:
    JP loop

    

    SAVESNA "sna/snapshot.sna", START     ; Creazione automatica del file TAP

END

