    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; Write  instructions  to  load  E070h  into  the  IY  index  register.  Using  the  register  IY 
    ; as memory  pointer  with  appropriate  offsets,  store  the  bytes  A2h  and  32h 
    ; in memory  locations  E04Fh  and  E09Fh,  respectively.  

PORT1 EQU $FE

START

    LD IY, $E070
    LD (IY-$21), $A2
    LD (IY+$2F), $32
   
LOOP:
    jp LOOP        ; Loop infinito

END

; Creazione automatica del file TAP
    SAVESNA "sna/snapshot.sna", START
