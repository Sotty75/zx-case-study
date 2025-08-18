    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; Modify  Illustrative  Program  2  (Section  8.7)  using  the  DE  register  as  a  memory 
    ; pointer  instead  of  HL. 



INBUF DB $A2, $37, $4F, $97, $22, $6B, $75, $8E, $9A, $C7
OUTBUF EQU $E000

START

; We create some random bytes at the memory location $E000


; Shift the bytes by 5 starting from the last one.
.init:
    LD A, $00
    LD C, A
    LD DE, INBUF
    LD B, $0A

.next_byte:
    LD H, A         ; backup current sum in H
    LD A, (DE)      ; get next byte to add
    ADD A, H        ; add sum stored in H to current byte store in A
    JP NC, .skip_carry
    INC C

.skip_carry
    INC DE
    DEC B
    JP NZ, .next_byte

.write_outbuf
    LD DE, OUTBUF
    LD (DE), A
    INC DE
    LD A, C
    LD (DE), A

.loop:
    jp .loop        ; Loop infinito

END

; Creazione automatica del file TAP
    SAVESNA "sna/snapshot.sna", START
