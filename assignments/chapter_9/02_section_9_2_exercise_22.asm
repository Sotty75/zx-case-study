    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; Mask  the  high-order  bits  D7-D4  of  the  accumulator  and  add  the  remaining  bits 
    ; D3-D0  four  times  using  the  instruction  ADD  A,  A.  Explain  the  result. 
    ; Can  you  achieve  the  same  result using  the  shift  instruction? 

START
    LD A, $5A ; using byte %01011010 as test data

.exercise_add
    AND $0F ; mask high order bits
    ADD A, A
    ADD A, A
    ADD A, A
    ADD A, A

.exercise_shift
    LD A, $5A ; reset test data
    AND $0F ; mask high order bits
    SLA A
    SLA A
    SLA A
    SLA A




; Ansdwer: YES

.loop:
    jp .loop        ; Loop infinito


    SAVESNA "sna/snapshot.sna", START     ; Creazione automatica del file SNA 

END

