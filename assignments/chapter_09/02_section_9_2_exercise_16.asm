    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; What  is  in  the  accumulator  and  the  CY  flag  after  the  execution  of  the  following instructions? 


START

.exercise
    LD A, $F3
    OR A 
    RLA
    RRCA 


    ; Answer:
    ; $F3 >> 11110011
    ; OR A >> A = 11110011 > CY=0
    ; RLA: 11100110 > CY=1
    ; RRCA: 01110011 > CY=0

.loop:
    jp .loop        ; Loop infinito


    SAVESNA "sna/snapshot.sna", START     ; Creazione automatica del file TAP

END

