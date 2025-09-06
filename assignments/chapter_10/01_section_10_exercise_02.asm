    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; Specify  the  contents  of  the  BC  registers  and  the  stack  pointer  after  the  execution 
    ; of  the  following  instructions. 
    ; ld sp, $ffff   
    ; ld hl, $ff55  
    ; push hl 
    ; pop bc


INBUF DB $67, $89, $7F, $F5, $C8, $9A, $4B, $00, $F8, $F8
OUTBUF EQU $E000


START

    ld sp, $ffff   ; --> imposta lo stack pointer all'indirizzo $ffff
    ld hl, $ff55   ; --> carica nell'registro hl i byte h->$ff e l->$55
    push hl        ; --> sposta nello stack il valore $ff55 e aggiorna il valore dello SP a $fffd ($ffff-2)
    pop bc         ; --> sposta nel registro bc i byt $ffgg dallo stack e rimetto lo SP a $ffff 
    
.loop:
    jr .loop        ; Loop infinito

    SAVESNA "sna/snapshot.sna", START     ; Creazione automatica del file SNA 

END

