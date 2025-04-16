    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ORG 0x8000

START:
;    ld a,0x4         ; Colore verde
;   call 5633      ; BORDER (cambia colore del bordo)

INIT_LOOP_A:
    LD a, 0          ; Inizializzazione della variabile contatore
    LD b, 10         ; Massimo numero di iterazioni
FOR_LOOP_A:
    ; -----> Logica da eseguire 
    ; -----> fine logica da eseguire
    ; -----> se A == B-1 esci
    INC a
    CP a,b
    JR NZ, FOR_LOOP_A ;

INIT_LOOP_B:
    LD B, 0
FOR_LOOP_B:
    ; -----> Logica da eseguire 
    ; -----> fine logica da eseguire
    ; -----> se A == B-1 esci
    INC B
    CP B, 100
    JR NZ, FOR_LOOP_B

LOOP:
    jp LOOP        ; Loop infinito

END

; Creazione automatica del file TAP
    SAVESNA "sna/for-loop.sna", START