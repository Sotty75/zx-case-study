    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; Write  instructions  to  load  BYTEl  and  BYTE2  into  registers  D  and  E  respectively. 
    ; Check  bit  Do  in  both  bytes,  and  if  either  one  is  at  logic  1,  turn  on  the  indicator 
    ; connected  to  bit  Do  at  the  output  port  OUTl. 

BYTE1 EQU $A0
BYTE2 EQU $32
PORT1 EQU $FE

START

.init:
    
    LD D, BYTE1
    LD E, BYTE2

.check
    LD A, $01   ; bit-mask to mask bits D0
    AND D
    JR NZ, .publish
    LD A, $01   ; bit-mask to mask bits D0
    AND E
    JR NZ, .publish
    JR .loop
    
.publish
    OUT (PORT1), A

.loop:
    jp .loop        ; Loop infinito


    SAVESNA "sna/snapshot.sna", START     ; Creazione automatica del file SNA

END

