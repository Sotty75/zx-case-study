    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ;  Write  a  program  to  add  the  following  string  of  data  bytes  until  a  carry  is  generated. 
    ; When  the  Carry  flag  is  set,  subtract  the  last  byte  added  and  display  the  sum at  PORTl. 
    ; Data  (H) 89,  .32,  2B,  7A,  B5,  68,  2F,



INBUF DB $89, $32, $2B, $7A, $B5, $68, $2F
PORT1 EQU $E000

START

; Shift the bytes by 5 starting from the last one.
.init:
    XOR A   ; initialize the accumulator
    LD HL, INBUF

.next_byte
    ADD A, (HL)
    INC HL
    JP NC, .next_byte

.write_result
    DEC HL
    SUB (HL)
    LD (PORT1), A
    
.loop:
    jp .loop        ; Loop infinito

    SAVESNA "sna/snapshot.sna", START     ; Creazione automatica del file TAP

END

