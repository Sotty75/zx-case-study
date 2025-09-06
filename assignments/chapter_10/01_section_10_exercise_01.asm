    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; Specify  the  address  in  the  stack  pointer  and  the  contents  of  memory  locations 
    ; ff90h-ff99h  after  the  execution  of  the  following  instructions. 
    ;
    ;   ld sp, $ff9a
    ;   xor a
    ;   ld h, a
    ;   ld l, a
    ;   ld b, $05
    ; 
    ; loop:
    ;   push hl
    ;   dec b
    ;   jp nx, loop


INBUF DB $67, $89, $7F, $F5, $C8, $9A, $4B, $00, $F8, $F8
OUTBUF EQU $E000


START

    ld hl, $ff9a
    ld (hl), $ff
    ld sp, $ff9a ; inizializziamo lo SP a $ff9a
    xor a        ; azzeriamo il registro a   
    ld h, a      ; azzeriamo il registro h
    ld l, a      ; azzeriamo il registro l
    ld b, $05    ; inizializziamo b per contare 5 volte
    
loop:
    push hl      ; il ciclo azzera tutte le locazioni di memoria tra la $ff9a e $ff90 
    dec b        ; copiando effettivamente due byte alla volta per 5 volte il valore di hl che e' appunto $0000   
    jp nz, loop  ; lo stack pointer quindi sara settato a $ff90 che e' l'ultimo byte che e' stato scritto

.loop:
    jr .loop        ; Loop infinito

    SAVESNA "sna/snapshot.sna", START     ; Creazione automatica del file SNA 

END

