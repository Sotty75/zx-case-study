    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ;  Write  instructions  to  shift  high-order  bits  D7-D4  of  the  byte  in  the  accumulator 
    ; into  low-order  position  D3-D0,  and  multiply  the  bits  by  eight. 

START
    LD A, $5A ; using byte %01011010 as test data

.exercise
    ; to shift to the right the accumulator we have dedicated instructions, in this case we want to rotate
    ; and put in the first position a 0. This means we need to go through the carry, so we use th RRA instruction, and set the carry to 0
    ; given our test byte, the output will be $05
    LD B, 4
.shift
    OR A
    RRA
    DJNZ .shift

; to mutiply the bits by eight i do a shift left two times, first times it multiplies by 2, second time by 4, third time by 8
; 5x8 sould be 40

    LD B, 3
.multiply 
    OR A
    RLA
    DJNZ .multiply 

.loop:
    jp .loop        ; Loop infinito


    SAVESNA "sna/snapshot.sna", START     ; Creazione automatica del file SNA

END

