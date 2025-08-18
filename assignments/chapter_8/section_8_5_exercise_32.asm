    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; Modify  the  previous  program  to  count  and  display  the  number  of  bytes  added  (excluding the  last  one). 

PORT1 EQU $FE
OUTPUT EQU $E000
COUNTER EQU $E001

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
    DEC B
    LD (OUTPUT), A
    LD A, B
    LD (COUNTER), A
    
LOOP:
    jp LOOP        ; Loop infinito



END

; Creazione automatica del file TAP
    SAVESNA "sna/snapshot.sna", START
