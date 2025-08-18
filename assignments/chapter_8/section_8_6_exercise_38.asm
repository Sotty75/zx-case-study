    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; Ten  1 6-bit  readings  are  stored  in  memory  locations  SOURCE;  the  low-order  byte 
    ; is  stored  first,  followed  by  the  high-order  byte.  Write  a  program  to  copy  the  low- 
    ; order  bytes  only  to  a  new  location  BUFFER. 


BUFFER EQU $E000
SOURCE DW $00BB, $01BB, $02BB, $03BB, $04BB, $05BB, $06BB, $07BB, $08BB, $09BB 

START

; We create some random bytes at the memory location $E000




; Shift the bytes by 5 starting from the last one.
.init:
    LD B, $0A               ; we initialize the counter to perform ten operations
    LD IX, SOURCE           ; source position, first byte
    LD IY, BUFFER

.copy_next:
    LD A, (IX)
    LD (IY), A
    INC IX
    INC IX
    INC IY
    DEC B
    JP NZ, .copy_next

.loop:
    jp .loop        ; Loop infinito

END

; Creazione automatica del file TAP
    SAVESNA "sna/snapshot.sna", START
