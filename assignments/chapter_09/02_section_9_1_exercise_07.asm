    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; Load  bit  pattern  97h  into  register  D  and  mask  high-order  bits  D7-D4.

START

.init:
    LD A, $0F   ; bit-mask to mask bits D7-D4
    LD D, $97   ; initialize the D register

.exercise
    AND D
    LD D, A

.loop:
    jp .loop        ; Loop infinito


    SAVESNA "sna/snapshot.sna", START     ; Creazione automatica del file TAP

END

