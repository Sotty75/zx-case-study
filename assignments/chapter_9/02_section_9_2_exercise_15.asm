    ; directives for the assembler

    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; The  accumulator  contains  the  data  byte  $C1,  and  the  CY  flag  is  0.  Specify  the 
    ; contents  of  the  accumulator  and  the  status  of  the  CY  flag  if  the  instruction RLA  is  executed  twice.

START

.exercise
    LD A, $C1
    RLA
    RLA

; Answer:
; $C1 is 11000001 - CY 0
; The RLCA instruztion pushes bit D7 on the carry and the previous carry inside of  D0
; A will be 10000010, CY will be 1 after the first execution
; A will be 00000101, CY will be 1 after the second execution

.loop:
    jp .loop        ; Loop infinito


    SAVESNA "sna/snapshot.sna", START     ; Creazione automatica del file SNA

END

