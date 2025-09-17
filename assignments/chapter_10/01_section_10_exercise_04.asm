    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; If  the  stack  pointer  is  initialized  at  20C8h  and  the  Call  instruction  located  at 
    ; 2052h  calls  the  subroutine  at  2075h,  specify  the  contents  of  the  stack  locations 
    ; 20C7h  and  20C6h  and  the  contents  of  the  stack  pointer  after  the  execution  of  the 
    ; Call  instruction. 
    ;
    ; Answer:
    ; The call automatically peroforms a push of the PC register into the stack, the PC contains the 
    ; address of the next instruction, which is 3-bytes after the call, so it will be 2055h. Therefore
    ; in 20c7h we will have the High byte, 20h, and in 20c6h we will have the low byte, 55h.


START

.loop:
    jr .loop        ; Loop infinito

    SAVESNA "sna/snapshot.sna", START     ; Creazione automatica del file SNA 

END

