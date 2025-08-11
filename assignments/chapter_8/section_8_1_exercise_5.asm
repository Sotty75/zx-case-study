    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; The  memory  location  E040h  contains  98h  and  E070h  contains  F7h.  Write  instructions to  exchange  
    ; the  contents  of  these  memory  locations  and  assemble  the  Hex code. 

START

    ; Setup memory initial status
    
    LD HL, $E070
    LD (HL), $98
    LD HL, $E040
    LD (HL), $F7

    ; Backup memory address to swap into registers B, C
    LD A, ($E070)
    EX AF
    LD A, ($E040)
    LD ($E070), A
    EX AF
    LD ($E040), A
    
LOOP:
    jp LOOP        ; Loop infinito

END

; Creazione automatica del file TAP
    SAVESNA "sna/snapshot.sna", START
