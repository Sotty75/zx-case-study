    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; Modify  the  previous  program  to  count  the  number  of  bytes  added  (excluding  the 
    ; byte  that  generates  the  carry)  and  display  the  count  at  PORT2. 



INBUF DB $89, $32, $2B, $7A, $B5, $68, $2F
PORT1 EQU $E000
PORT2 EQU $E001

START

.init:
    XOR A   ; initialize the accumulator
    LD B, $00   ; initialize B to work as a counter
    LD HL, INBUF

.next_byte
    ADD A, (HL)
    INC HL
    INC B
    JP NC, .next_byte

.write_result
    DEC HL
    DEC B
    SUB (HL)
    LD (PORT1), A
    LD (PORT2), B
    
.loop:
    jp .loop        ; Loop infinito

    SAVESNA "sna/snapshot.sna", START     ; Creazione automatica del file TAP

END

