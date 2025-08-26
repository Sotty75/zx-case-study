    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; If  the  bytes  in  1  are  ORed  instead  of  ANDed,  specify  the  contents  of  the  accumulator and  the  
    ; flag  statuses  (S,  Z,  CY). 

INBUF DB $00

START

.init:
    LD A, $00   ; initialize the accumulator
    LD B, $80   ; initialize the byte counter to 10
    LD C, $7F   ; initialize d to store the current remainders sum

.exercise
    LD A, B
    OR C
    LD (INBUF), A
.loop:
    jp .loop        ; Loop infinito


    SAVESNA "sna/snapshot.sna", START     ; Creazione automatica del file SNA

END

