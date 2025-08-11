    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; Calculate  the  values  of  two  memory  pointers  if  register  lY  contains  20FFh  and  it 
    ; is  combined  with  the  displacement  bytes  7Fh  and  8Fh.

PORT1 EQU $FE

START

    LD IY, $E0FF
    LD (IY+$7F), $A2 ; >> 
    ; LD (IY+$8F), $A2 ; il displacemente deve essere tra -128 e +127, quindi +80h non funziona, mentre funziona -80h
   
LOOP:
    jp LOOP        ; Loop infinito

END

; Creazione automatica del file TAP
    SAVESNA "sna/snapshot.sna", START
