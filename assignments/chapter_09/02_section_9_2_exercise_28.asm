    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; A  set  of  eight  current  readings  is  stored  in  memory  INBUF.  The  readings  are  ex- 
    ; pected to  be positive  (<128).  Write  a  program  to  check  each  reading,  reject 
    ; the  negative  readings,  and  add  the  positive  readings.  Display  the  answer  at  the 
    ; output  port  or  store  it  in  the  output  buffer  memory  OUTBUF. 
    ;    
    ;   Data  (H)  74,  6F,  A1,  7F,  76,  87,  5B,  8C   

INBUF DB  $74, $6F, $A1, $7F, $76, $87, $5B, $8C
OUT_PORT EQU $FE

START

    LD HL, INBUF   ; set pointer to source
    LD B, $08 ; number of houses to count
    LD C, $00 ; sum of positive current readings
    
.next_byte
    LD A, (HL)
    CP $80                 ; we want to track houses with values greater than or equal to 201
    JR NC, .skip           ; if difference is positive, means the reading is negative, therefore we skip and go to next byte
    ADD A, C
    LD C, A
.skip
    INC HL                 ; prepare for next iteration
    DJNZ .next_byte

; A < OP >> Z=0 CY=1 > C
; A = OP >> Z=1 CY=0 > NC
; A > OP >> Z=0 CY=0 > NC

completed:
    LD A, C
    OUT (OUT_PORT), A

.loop:
    jp .loop        ; Loop infinito


.urgency:
    jp .urgency        ; Loop infinito


    SAVESNA "sna/snapshot.sna", START     ; Creazione automatica del file SNA 

END

