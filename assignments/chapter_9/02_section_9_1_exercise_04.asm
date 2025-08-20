    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    
    ; Write  instructions  to  read  INBUF.  If  the  reading  is  OOh,  set  the  Z  flag  and  jump 
    ; back  to  read  the  port  again.  What  is  the  reason  to  set  the  Z  flag  when  the  input 
    ; reading  is  OOh?  Specify  a  1-byte  logic  instruction  that  can  set  the  Z  flag  without 
    ; affecting  the  input  reading. 

INBUF DB $00

START


.read_input
    LD A, (INBUF)
    AND A
    JP Z, .read_input

.loop:
    jp .loop        ; Loop infinito


    SAVESNA "sna/snapshot.sna", START     ; Creazione automatica del file SNA

END

