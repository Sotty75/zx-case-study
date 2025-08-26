    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; Draw  a  flowchart  to  add  the  numbers  stored  in  memory  location  INBUF  (Input 
    ; Buffer).  When  the  result  generates  a  carry,  subtract  the  last  byte  and  display  the 
    ; sum. 

PORT1 EQU $FE
OUTPUT EQU $E000

SOURCE:
    DB $0E,$02,$03,$04,$05,$06,$07,$08,$09,$0A
    DB $0E,$02,$03,$04,$05,$06,$07,$08,$09,$0A
    DB $0E,$02,$03,$04,$05,$06,$07,$08,$09,$0A
    DB $0E,$02,$03,$04,$05,$06,$07,$08,$09,$0A
    DB $0E,$02,$03,$04,$05,$06,$07,$08,$09,$0A
    DB $0E,$02,$03,$04,$05,$06,$07,$08,$09,$0A
    DB $0E,$02,$03,$04,$05,$06,$07,$08,$09,$0A
    DB $0E,$02,$03,$04,$05,$06,$07,$08,$09,$0A
    DB $0E,$02,$03,$04,$05,$06,$07,$08,$09,$0A
    DB $0E,$02,$03,$04,$05,$06,$07,$08,$09,$0A
    DB $0E,$02,$03,$04,$05,$06,$07,$08,$09,$0A

START
    LD A, $00
    LD B, $00
    LD HL, SOURCE
    DEC HL

NEXT:
    INC HL
    INC B
    ADD A, (HL)
    JP NC, NEXT
    SUB (HL)
    LD (OUTPUT), A
    
LOOP:
    jp LOOP        ; Loop infinito



END

; Creazione automatica del file TAP
    SAVESNA "sna/snapshot.sna", START
