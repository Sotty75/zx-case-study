    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; Ten  16-bit  readings  are  stored  in  memory  locations  SOURCE;  the  low-order  byte 
    ; first,  followed  by  the  high-order  byte.  Write  a  program  to  add  the  low-order 
    ; bytes.  Display  the  sum  at  two  different  ports  and  store  the  sum  in  two  memory 
    ; locations  OUTBUF  and  OUTBUF  +  

SOURCE DW $3201, $7A01, $6801, $FF01, $3201, $3201, $AA01, $2301, $FF01, $2201
OUTBUF EQU $E000

START

.init:
    XOR A   ; initialize the accumulator
    LD B, $0A
    LD HL, SOURCE

.next_byte
    ADD A, (HL)
    INC HL
    INC HL
    DEC B
    JP NZ, .next_byte
    LD (OUTBUF), A
    
.loop:
    jp .loop        ; Loop infinito

    SAVESNA "sna/snapshot.sna", START     ; Creazione automatica del file TAP

END

