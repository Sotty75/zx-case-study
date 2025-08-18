    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; Two  sets  of  data,  ten  bytes  each,  are  stored  in  memory  locations  INBUFl  and 
    ; INBUF2.  Subtract  each  data  byte  stored  at  INBUF2  from  the  corresponding  data 
    ; byte  at  INBUFl.  Add  the  remainders,  and  if  the  sum  of  the  remainders  generates 
    ; a carry,  display  FFH  at  PORTl;  otherwise,  display  the  sum  at  PORTl. 

INBUF1 DB $32, $7A, $68, $FF, $32, $32, $AA, $23, $FF, $22
INBUF2 DB $13, $17, $18, $FF, $12, $02, $FF, $43, $CD, $EA

PORT1 EQU $FE

START

.init:
    LD A, $00   ; initialize the accumulator
    LD B, $0A   ; initialize the byte counter to 10
    LD D, $00   ; initialize d to store the current remainders sum
    LD IX, INBUF1
    LD IY, INBUF2

.next_byte
    LD A, (IX)
    SUB (IY)
    ADD A, D    ; calculate the new remainders total
    LD D, A     ; store the new sum in D
    INC IX
    INC IY
    DEC B
    JP NZ, .next_byte
    

    JP NC, .output_sum
    JP C, .output_error


.output_sum
    OUT (PORT1), A
    JP .loop

.output_error
    LD A, $01
    OUT (PORT1), A
    JP .loop
    
.loop:
    jp .loop        ; Loop infinito


    SAVESNA "sna/snapshot.sna", START     ; Creazione automatica del file TAP

END

