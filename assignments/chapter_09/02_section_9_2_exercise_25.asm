    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; Rewrite  Illustrative  Program  1  (Section  9.3)  to  find  the  minimum  number  in  a given  data  set. 
    ; Data  (H)  32,  F8,  6A,  47,  1F,  AF,  97,  20,  2F,  C2 

SOURCE DB $32, $f8, $6a, $47, $1F, $AF, $97, $20, $2F, $C2 

START
    LD HL, SOURCE   ; set pointer to source
    LD D, $FF       ; set our destination to maximum possible byte (unsigned)
    LD B, $0A

.exercise
    
.next_byte
    LD A, (HL)
    CP D
    JP NC, .skip
    LD D, A
.skip
    INC HL
    DJNZ .next_byte

.loop:
    jp .loop        ; Loop infinito


.urgency:
    jp .urgency        ; Loop infinito


    SAVESNA "sna/snapshot.sna", START     ; Creazione automatica del file SNA 

END

