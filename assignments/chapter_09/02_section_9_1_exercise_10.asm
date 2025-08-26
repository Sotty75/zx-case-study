    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; Write  instructions  to  load  37h  into  the  accumulator  and  6Fh  into  register  B. 
    ; Compare  the  two  bytes  and  specify  the  statuses  of  the  S,  Z,  and  CY  flags. 

START

.exercise       ; 10  10
    LD A, $37   ;  00110111
    LD B, $6F   ;  01101111
                ;  --------  
                ;  11001000
    CP B
    ; S=1 >> as A < B
    ; Z=0 >> as results is not Zero
    ; CY=0 >> as the carry flag is not set in comparison operations

    SUB B

.loop:
    jp .loop        ; Loop infinito


    SAVESNA "sna/snapshot.sna", START     ; Creazione automatica del file SNA

END

