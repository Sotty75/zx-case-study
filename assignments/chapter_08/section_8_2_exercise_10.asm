    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; Write  the  instructions  to  load  FFh  into  the  accumulator  and  increment  A.  Specify 
    ; the  status  of  the  S,  Z,  and  CY  flags  after  the  execution  of  the  increment  instruction. 

START

    LD A, $7F
    INC A
    
    

LOOP:
    jp LOOP        ; Loop infinito

END

; Creazione automatica del file TAP
    SAVESNA "sna/snapshot.sna", START
