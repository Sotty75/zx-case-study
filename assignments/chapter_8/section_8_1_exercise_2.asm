    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; Write  instructions  to  load  47h  into  register  B  and  F2h  into  register  C  using  one  instruction. 
    ; Store  the  contents  of  C  in  memory  location  2080h  
    ; and  display  the  contents of  B at  PORTl.  
    ; Assemble  the  Hex  code  and  store  the  code  in  memory  locations starting  from 2000h.

PORT1 EQU $FE

START

    LD BC, $44F2
    LD A, C
    LD ($E080), A
    LD A, B
    AND $07
    OUT (PORT1), A
    
LOOP:
    jp LOOP        ; Loop infinito

END

; Creazione automatica del file TAP
    SAVESNA "sna/snapshot.sna", START