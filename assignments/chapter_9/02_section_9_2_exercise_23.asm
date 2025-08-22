    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; Write  instructions  to  check  bits  D7  and  D0  in  the  acumulator,  and  if  both  bits 
    ; are  high,  jump  to  the  URGNCY  routine.

START
    LD A, $FB 
.exercise
    BIT 7, A
    JR Z, .continue
    BIT 0, A
    JR Z, .continue
    JP .urgency

.continue:
.loop:
    jp .loop        ; Loop infinito


.urgency:
    jp .urgency        ; Loop infinito


    SAVESNA "sna/snapshot.sna", START     ; Creazione automatica del file SNA 

END

