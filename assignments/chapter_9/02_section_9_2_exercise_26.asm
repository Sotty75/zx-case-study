    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; A  set  of  ten  readings  is  stored  in  memory  SOURCE.  Write  a  program  to  check 
    ; whether  the  byte  30h  exists  in  the  set.  If  it  does,  stop  checking,  and  output the value to PORT1, otherwise output the value $00
    ;    
    ;   Data  (H)  48,  8F,  C7,  68,  9F,  9C,  30,  33,  B8,  D9 

SOURCE DB $48, $8F, $C7, $68, $9F, $9C, $31, $33, $B8, $D9 
PORT1 EQU $FE

START
    LD HL, SOURCE   ; set pointer to source
    LD B, $0A

.exercise
    
.next_byte
    LD A, (HL)
    CP $30
    JR Z, .found
    INC HL
    DJNZ .next_byte

.not_found
    OUT (PORT1), $00
    JR .loop

.found
    OUT (PORT1), A

.loop:
    jp .loop        ; Loop infinito


.urgency:
    jp .urgency        ; Loop infinito


    SAVESNA "sna/snapshot.sna", START     ; Creazione automatica del file SNA 

END

