    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ORG $5cbb

START


SCREEN DW $4000
SCREEN_END DW $5800
VPOS DW $0000           ; used to backup the VPOS during a character fill

INIT_SCREEN_POINTER:
    LD HL, (SCREEN)         ; HL = inizio schermo
    LD DE, (SCREEN_END)     ; DE = fine schermo
    LD B, $20

FILL_CHECKERS:
    ; itera su tutte le righe
    CALL FILL_SQUARE
    
    ; Confronto 16 bit
    LD A, L
    CP $00         ; confronto parte bassa solo se H è uguale
    JP NZ, FILL_CHECKERS
    LD A, H
    CP $40
    JP Z, NEXT_BANK
    CP $48
    JP Z, NEXT_BANK

    JP END_LOOP
    ; per ogni riga itera su tutti i caratteri
    ; se la riga e' pari annerisci il carattere pari
    ; se la riga e' dispari annerisci il carattere dispari

NEXT_BANK:
    LD A, H
    ADD A, 8
    LD H, A
    LD L, $00
    JP FILL_CHECKERS

    ;   HL: $4026
    ;   H  --> Definisce il blocco con i bit 3,4
    ;   L  --> bbbbbbbb
    ;          |||---> Riga definita da 3 bit --> 8 righe per blocco
    ;             ||||| ---> Posizione del carattere (0-31) - servono 5 bit  
    ;
    ;
    ;
    ;



FILL_SQUARE:
    LD C, $FF                   ; pattern di riempimento
    LD (VPOS), HL               ; voglio testare il contenuto del registro L per capire se siamo in un
                                ; riga e' pari o dispari, mi serve il bit 6
    LD A, L                     ; lo copio in A per fare una serie di Shift-Right e spostare il bit
                                ; che mi interessa in posizione 0
    SRL A                       
    SRL A
    SRL A
    SRL A
    SRL A
    AND %00000001               ; faccio AND con 1, se viene 1 e' pari.
    LD D, A                     ; il risulatao lo copio in D
    LD A, L                     ; verifico se anche la riga e' pari
    AND $01
    CP D                        ; confronto la parita' del carattere con quella della riga, 
                                ; salvata in D, per decidere se stampare o no un quadrato
    JP NZ, CLEAR_SQUARE
FILL:
    LD (HL), C
    INC H
    LD (HL), C
    INC H
    LD (HL), C
    INC H
    LD (HL), C
    INC H
    LD (HL), C
    INC H
    LD (HL), C
    INC H
    LD (HL), C
    INC H
    LD (HL), C
    LD HL, (VPOS)
    INC L
    RET

CLEAR_SQUARE:
    LD C, $00              ; pattern di riempimento
    JP FILL

IS_FILLABLE:
    ; if even row
    ;   if even column
    ;       continue
    ;   else
    ;       go to next column


END_LOOP:
    JP END_LOOP

; Delay loop molto semplice
DELAY:
    LD B, $FF        ; puoi abbassare questo valore se vuoi un delay più breve
DELAY_LOOP:
    DEC B
    JP NZ, DELAY_LOOP
    RET

END


    ; Creazione automatica del file SNA
    SAVESNA "sna/fill-screen.sna", START