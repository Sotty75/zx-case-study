    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; Mask  the  high-order  bits  D7-D4  of  the  accumulator  and  add  the  remaining  bits 
    ; D3-D0  four  times  using  the  instruction  ADD  A,  A.  Explain  the  result. 

START
    LD A, $5A ; using byte %01011010 as test data

.exercise
    AND $0F ; mask high order bits
    ADD A, A
    ADD A, A
    ADD A, A
    ADD A, A


; Ansdwer: looks like ADD operation is actually the eqauivalent of an SLA command.

.loop:
    jp .loop        ; Loop infinito


    SAVESNA "sna/snapshot.sna", START     ; Creazione automatica del file SNA 

END

