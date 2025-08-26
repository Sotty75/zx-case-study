    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; Write  instructions  to  load  80h  and  7Fh  into  registers  B  and  C  respectively.  
    ; Logically AND  the  bytes  and  save  the  answer  in  memory  INBUF.  Specify  the  status 
    ; of  the  S,  Z,  and  CY  flags  after  ANDing  the  bytes.

INBUF DB $00

START

.init:
    LD B, $80   ; initialize the byte counter to 10
    LD C, $7F   ; initialize d to store the current remainders sum

.exercise
    LD A, B
    AND C
    LD (INBUF), A
.loop:
    jp .loop        ; Loop infinito

    SAVESNA "sna/snapshot.sna", START     ; Creazione automatica del file SNA

END

