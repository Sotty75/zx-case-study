    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; A  set  of  eight  current  readings  is  stored  in  memory  INBUF.  The  readings  are  ex- 
    ; pected to  be positive  (<128).  Write  a  program  to  check  each  reading,  reject 
    ; the  negative  readings,  and  add  the  positive  readings.  
    ; If  the  addition  generates  a  carry,  stop  the  addition  and  display  O1H  at  the output  port;  
    ; otherwise,  display  the  sum. . 
    ;    
    ;  Data  (H)  27,  Al,  2A,  1F,  38,  81,  19,  9A
    ;  Data  (H)  87,  22,  5F,  3A,  47,  52,  35,  81    

; INBUF DB  $27, $A1, $2A, $1F, $38, $81, $19, $9A
INBUF DB  $87, $22, $5F, $3A, $47, $52, $35, $81
OUT_PORT EQU $FE

START

    LD HL, INBUF   ; set pointer to source
    LD B, $08 ; number of houses to count
    LD C, $00 ; sum of positive current readings
    
.next_byte
    LD A, (HL)
    BIT 7, A                 ; we want to track houses with values greater than or equal to 201
    JR NZ, .skip           ; if the first bit is positive, we skip this byte
    ADD A, C
    JR C, .overflow     ; if there is an overlflow we exit the procedure and jump to the overflow code
    LD C, A
.skip
    INC HL                 ; prepare for next iteration
    DJNZ .next_byte

.sum_valid
    JR .completed

.overflow
    LD C, $01

.completed:
    LD A, C
    OUT (OUT_PORT), A

.loop:
    jp .loop        ; Loop infinito


.urgency:
    jp .urgency        ; Loop infinito


    SAVESNA "sna/snapshot.sna", START     ; Creazione automatica del file SNA 

END

