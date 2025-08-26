    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ;  Rewrite  the  instructions  in  Figures  8.2  (a),  (b),  and  (c)  using  the  index  registers 
    ;  IX and  lY  as  memory  pointers. 

PORT1 EQU $FE

START

    ; Example (a)
    ; LD HL, $2050
    ; LD A, (HL)
    LD A, $01
    LD IX, $2050
    LD A, (IX)

    ; Example (b)
    ; LD BC; $2050
    ; LD A, (BC)
    LD A, $01
    LD IY, $2050
    LD A, (IY)

    ; Example (c)
    ; LD A, ($2050)
    LD A, $01
    LD IX, $2050
    LD A, (IX)

   
LOOP:
    jp LOOP        ; Loop infinito

END

; Creazione automatica del file TAP
    SAVESNA "sna/snapshot.sna", START
