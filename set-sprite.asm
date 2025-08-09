; SET PIXEL FUNCTION FOR THE ZX SPECTRUM WRITTEN BY PAOLO SOTGIU AKA SOT
; APRIL 9, 2025

    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ORG $8000

START

; nel prossimo esercizio vogliamo visualizzare uno sprite sullo schermo in una posizione qualsiasi.
; il nostro sprite ha dimensione 16x16 pixel. per definire la posizione indichiamo le coordinate dello sprite come quelle dell'angolo
; in alto a sinistra.
; lo sprite e' definito in memoria in indirizzi successivi, ogni due indirizzi si passa alla linea successiva.
; algoritmo:
; scrivo posx e posy in due indirizzi, rappresentano la posizione dello sprite
; itero tra i bit del primo indirizzo.
; per capire se il primo pixel lo devo disegnare faccio or 1000000 e cmp con 10000000. se e' zero allora setto il pixel.
; incremento xpos e vado avanti con la stessa operazione, ma cmp con 01000000 e cosi via...
; completato il primo indirizzo, incremento il contatore che traccia quanti indirizzi ho processato.
; riprendo
; incremento il contatore degli indirizzi, se e' pari resetto la xpos e incremento la ypos, se e' dispari incremento xpos senza modificare ypos.
; mi servono:
;
; - contatore dei bit di ogni registro
; - contatore righe >> registro E
; - xpos / ypos (registri B e C)
; - indirizzo frame 0

; Inizializzo le coordinate in cui stampare lo sprite
    LD HL, FRAME_0  ; load in HL (my address pointer) the start position of where i defined my sprite
    LD BC, (XY_POS)
    LD E, 0
    

; Copio il primo registro in D
RENDER_SPR_ROW:
    LD D,%10000000
    LD A, (HL)          ; metto primo array di bit in D
    AND D               ; estraggo il primo bit
    CP D                ; confronto con la maschera del primo bit, se sono uguali dovrei avere 1 nel flag
    CALL Z, SET_PIXEL
    
    INC B
    LD D, %01000000
    LD A, (HL)          ; metto primo array di bit in D
    AND D               ; estraggo il primo bit
    CP D                ; confronto con la maschera del primo bit, se sono uguali dovrei avere 1 nel flag
    CALL Z, SET_PIXEL
    
    INC B
    LD D, %00100000
    LD A, (HL)          ; metto primo array di bit in D
    AND D               ; estraggo il primo bit
    CP D                ; confronto con la maschera del primo bit, se sono uguali dovrei avere 1 nel flag
    CALL Z, SET_PIXEL
    
    INC B
    LD D, %00010000
    LD A, (HL)          ; metto primo array di bit in D
    AND D               ; estraggo il primo bit
    CP D                ; confronto con la maschera del primo bit, se sono uguali dovrei avere 1 nel flag
    CALL Z, SET_PIXEL
    
    INC B
    LD D, %00001000
    LD A, (HL)          ; metto primo array di bit in D
    AND D               ; estraggo il primo bit
    CP D                ; confronto con la maschera del primo bit, se sono uguali dovrei avere 1 nel flag
    CALL Z, SET_PIXEL
    
    INC B
    LD D, %00000100
    LD A, (HL)          ; metto primo array di bit in D
    AND D               ; estraggo il primo bit
    CP D                ; confronto con la maschera del primo bit, se sono uguali dovrei avere 1 nel flag
    CALL Z, SET_PIXEL
    
    INC B
    LD D, %00000010
    LD A, (HL)          ; metto primo array di bit in D
    AND D               ; estraggo il primo bit
    CP D                ; confronto con la maschera del primo bit, se sono uguali dovrei avere 1 nel flag
    CALL Z, SET_PIXEL

    INC B
    LD D, %00000001
    LD A, (HL)          ; metto primo array di bit in D
    AND D               ; estraggo il primo bit
    CP D                ; confronto con la maschera del primo bit, se sono uguali dovrei avere 1 nel flag
    CALL Z, SET_PIXEL

    INC HL              ; go to next address bits 8..15

    LD D,%10000000
    LD A, (HL)          ; metto primo array di bit in D
    AND D               ; estraggo il primo bit
    CP D                ; confronto con la maschera del primo bit, se sono uguali dovrei avere 1 nel flag
    CALL Z, SET_PIXEL
    
    INC B
    LD D, %01000000
    LD A, (HL)          ; metto primo array di bit in D
    AND D               ; estraggo il primo bit
    CP D                ; confronto con la maschera del primo bit, se sono uguali dovrei avere 1 nel flag
    CALL Z, SET_PIXEL
    
    INC B
    LD D, %00100000
    LD A, (HL)          ; metto primo array di bit in D
    AND D               ; estraggo il primo bit
    CP D                ; confronto con la maschera del primo bit, se sono uguali dovrei avere 1 nel flag
    CALL Z, SET_PIXEL
    
    INC B
    LD D, %00010000
    LD A, (HL)          ; metto primo array di bit in D
    AND D               ; estraggo il primo bit
    CP D                ; confronto con la maschera del primo bit, se sono uguali dovrei avere 1 nel flag
    CALL Z, SET_PIXEL
    
    INC B
    LD D, %00001000
    LD A, (HL)          ; metto primo array di bit in D
    AND D               ; estraggo il primo bit
    CP D                ; confronto con la maschera del primo bit, se sono uguali dovrei avere 1 nel flag
    CALL Z, SET_PIXEL
    
    INC B
    LD D, %00000100
    LD A, (HL)          ; metto primo array di bit in D
    AND D               ; estraggo il primo bit
    CP D                ; confronto con la maschera del primo bit, se sono uguali dovrei avere 1 nel flag
    CALL Z, SET_PIXEL
    
    INC B
    LD D, %00000010
    LD A, (HL)          ; metto primo array di bit in D
    AND D               ; estraggo il primo bit
    CP D                ; confronto con la maschera del primo bit, se sono uguali dovrei avere 1 nel flag
    CALL Z, SET_PIXEL

    INC B
    LD D, %00000001
    LD A, (HL)          ; metto primo array di bit in D
    AND D               ; estraggo il primo bit
    CP D                ; confronto con la maschera del primo bit, se sono uguali dovrei avere 1 nel flag
    CALL Z, SET_PIXEL

    ; Upgrade VPOS
    LD A, (VPOS)
    INC A
    LD (VPOS), A
    ; Reset BC to process the next row
    LD BC, (XY_POS)     ; reset B to X_POS
    LD A, (VPOS)        
    LD C, A             ; reset C to VPOS
    ; check if we are done with all the rows (VPOS = 15)
    CP 15
    JP NZ, RENDER_SPR_ROW
        

END_LOOP:
    JP END_LOOP

; Functions

SET_PIXEL:
    LD A, B                 ; ci mettiamo la coordinata x in A 
    SRL A                   ; mi interessa spostare i primi 5 pixel in L
    SRL A                   ; li sposto nella posizione giusta e quindi
    SRL A                   ; copio A in L
    LD L, A
    LD A, C                 
    AND %00111000           
    SLA A
    SLA A
    OR A, L
    LD L, A
    LD A, C
    AND %00000111
    OR %01000000
    LD H, A
    LD A, C
    AND %11000000
    SRL A
    SRL A
    SRL A
    OR A, H
    LD H, A
    ;;; HL Registry is correctly set

    LD A, B
    AND %00000111
    LD D, %10000000         ; we store in D the byte for first position %10000000
                            ; any time we decrement A we shift D by 1 until A is 0
    CP 0
    JP Z, FOUND
FIND_PIXEL:
    RRC D
    DEC A
    CP 0
    JP NZ, FIND_PIXEL
FOUND:
    LD (HL), D
    RET





; Delay loop molto semplice
DELAY:
    LD B, $FF        ; puoi abbassare questo valore se vuoi un delay più breve
DELAY_LOOP:
    DEC B
    JP NZ, DELAY_LOOP
    RET

; DATA SECTION

VPOS:
    DB 00

XY_POS: 
    DB 55
    DB 89

FRAME_0 
    DW $00C0
    DW $01E0
    DW $01E0
    DW $01C0
    DW $0080
    DW $0180
    DW $03C0
    DW $03C0
    DW $02E0
    DW $02E0
    DW $02C0
    DW $02A0
    DW $00A0
    DW $0120
    DW $0120
    DW $01B0

END

    SAVESNA "sna/snapshot.sna", START ; Creazione automatica del file SNA
