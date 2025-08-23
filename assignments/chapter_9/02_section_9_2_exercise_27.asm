    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ;  A  set  of  ten  readings,  representing  the  power  consumption  in  watts  of  each 
    ; house  in  the  area,  is  stored  in  memory  INBUF.  The  limit  on  consumption  per house  
    ; is  set  at  200 watts.  Check  each  reading  and  count  all  the  readings  that exceed  the  limit  and  display  the  number to PORT1
    ;    
    ;   Data  (H)  A9,  B3,  98,  C8,  C7,  F5,  C8,  89,  D2,  E7  

INBUF DB $A9, $B3, $98, $C8, $C7, $F5, $C8, $89, $D2, $E7
PORT1 EQU $FE

START

    LD HL, INBUF   ; set pointer to source
    LD B, $0A ; number of houses to count
    LD C, $00 ; counter for the readings exceeding 200 Watts
    
.next_house
    LD A, (HL)
    CP $C9      ; we want to track houses with values greater than or equal to 201
    JR C, .skip
    INC C
.skip:
    INC HL
    DJNZ .next_house

completed:
    LD A, C
    OUT (PORT1), A

.loop:
    jp .loop        ; Loop infinito


.urgency:
    jp .urgency        ; Loop infinito


    SAVESNA "sna/snapshot.sna", START     ; Creazione automatica del file SNA 

END

