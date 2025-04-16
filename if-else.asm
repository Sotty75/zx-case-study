    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ORG 0x5CBB

START

INIT_VARIABLES:
    LD A, 25        ; Inizializzazione della variabile contatore
    LD B, 10        ; Massimo numero di iterazioni

LOOP:
    jp LOOP        ; Loop infinito

END

; Creazione automatica del file TAP
    SAVESNA "sna/if-else.sna", START