    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; Rewrite  Illustrative  Program  1  (Section  8.6),  Block  Transfer  of  Data  Bytes,  using the  index  
    ; registers  as  memory  pointers. 

PORT1 EQU $FE
OUTBUF EQU $E000

SOURCE:
    DB $01,$02,$03,$04,$05,$06,$07,$08,$09,$0A
    DB $01,$02,$03,$04,$05,$06,$07,$08,$09,$0A
    DB $01,$02,$03,$04,$05,$06,$07,$08,$09,$0A
    DB $01,$02,$03,$04,$05,$06,$07,$08,$09,$0A
    DB $01,$02,$03,$04,$05,$06,$07,$08,$09,$0A
    DB $01,$02,$03,$04,$05,$06,$07,$08,$09,$0A
    DB $01,$02,$03,$04,$05,$06,$07,$08,$09,$0A
    DB $01,$02,$03,$04,$05,$06,$07,$08,$09,$0A
    DB $01,$02,$03,$04,$05,$06,$07,$08,$09,$0A
    DB $01,$02,$03,$04,$05,$06,$07,$08,$09,$0A

START
    LD B, $64

    LD IX, SOURCE
    LD IY, OUTBUF
    
NEXT:
    LD A, (IX)
    LD (IY), A
    INC IX
    INC IY
    DEC B
    JP NZ, NEXT
    
LOOP:
    jp LOOP        ; Loop infinito



END

; Creazione automatica del file TAP
    SAVESNA "sna/snapshot.sna", START
