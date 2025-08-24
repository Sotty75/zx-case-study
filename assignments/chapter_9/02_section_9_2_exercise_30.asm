    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; A  data  string  is  stored  in  memory  INBUF,  and  the  end  of  data  string  is  indicated 
    ; by  the  data  byte  00h.  Copy  the  data  string  into  new  memory  OUTBUF. 
    ; 
    ; Data  (H)  67,  89,  7F,  F5,  C8,  9A,  4B,  00,  F8,  F8 


INBUF DB $67, $89, $7F, $F5, $C8, $9A, $4B, $00, $F8, $F8
OUTBUF EQU $E000


START

    LD B, $FF               ; maximum lenght of the string
    LD HL, INBUF
    LD DE, OUTBUF

.next_byte
    LD A, (HL)
    CP $00
    JR Z, .loop
    LD (DE), A
    INC HL
    INC DE
    DJNZ .next_byte

.loop:
    jr .loop        ; Loop infinito

    SAVESNA "sna/snapshot.sna", START     ; Creazione automatica del file SNA 

END

