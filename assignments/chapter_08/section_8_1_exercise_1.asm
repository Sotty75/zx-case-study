    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ;   Exersice 8.1.1
    ;   Write  mnemonics  to  load  39h  into  register  B  and  92h  into  register  D.  Save  the 
    ;   contents  of  B  in  register  L  and  display  the  contents  of  D  at  PORTl. 

PORT1 EQU $FE

START

    LD B, $39
    LD D, $FF
    LD L, B
    LD A, D
    AND %11111000
    OUT (PORT1), A

LOOP:
    jp LOOP        ; Loop infinito

END

; Creazione automatica del file TAP
    SAVESNA "sna/snapshot.sna", START