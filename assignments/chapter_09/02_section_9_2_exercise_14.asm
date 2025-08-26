    ; directives for the assembler

    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; The  accumulator  contains  the  data  byte  $C1,  and  the  CY  flag  is  0.  Specify  the 
    ; contents  of  the  accumulator  and  the  status  of  the  CY  flag  if  the  instruction RLCA  is  executed  twice.

START

.exercise
    LD A, $C1
    RLCA
    RLCA

; Answer:
; $C1 is 11000001
; The RLCA instruztion pushes bit A7 on the carry and on the A0
; A will be 10000011, CY will be 1 after the first execution
; A will be 00000111, CY will be 1 after the second execution

.loop:
    jp .loop        ; Loop infinito


    SAVESNA "sna/snapshot.sna", START     ; Creazione automatica del file TAP

END

