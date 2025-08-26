    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; Three  data  bytes  are  stored  in  memory  locations  2050,  2051,  and  2052h.  Write 
    ; instructions  to  subtract  the  bytes  stored  in  memory  locations  2050  and  2051  from 
    ; the  byte  stored  in  location  2052h.  If  the  answer  is  in  2's  complement,  display 
    ; FFh  at  PORTl;  otherwise,  display  the  answer.  Execute  the  instructions  with  the 
    ; following  set  of  data  in  Hex. 
    ;
    ;      Set  1:  2050  =  32,  2051  =  78,  2052  =  F9 
    ;      Set  2:  2050  =  67,  2051  =  98,  2052  =  F9

PORT1 EQU $FE

START

    ; Data Set 1
    ; LD A, $32
    ; LD ($E050), A
    ; LD A, $78
    ; LD ($E051), A
    ; LD A, $F9
    ; LD ($E052), A

    ; Data Set 2
    LD A, $67
    LD ($E050), A
    LD A, $98
    LD ($E051), A
    LD A, $F9
    LD ($E052), A
    
    LD A, ($E052)
    LD HL, $E050
    LD B, (HL)
    SUB B
    LD HL, $E051
    LD B, (HL)
    SUB B
    
    JP M, COMPLEMENT
    OUT (PORT1), A
    JP LOOP

COMPLEMENT:
    LD A, $01
    OUT (PORT1), A
    
LOOP:
    jp LOOP        ; Loop infinito

END

; Creazione automatica del file TAP
    SAVESNA "sna/snapshot.sna", START
