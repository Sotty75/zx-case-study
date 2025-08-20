    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

        ; Load  48A2h  into  register  BC.  Subtract  the  contents  of  C  from  B.  If  the  answer 
        ; is  in  2's  complement,  display  O1h  at  PORTl;  otherwise,  display  the  result.  
        ; Assemble the  code  and  execute  the  program. 

    PORT1 EQU $FE

    START

        LD BC, $A248
        LD A, B
        SUB C
        JP M, COMPLEMENT
        OUT (PORT1), A
        JP LOOP

    COMPLEMENT:
        LD A, $01
        OUT (PORT1), A
        
    LOOP:
        jp LOOP        ; Loop infinito

    END

; Creazione automatica del file TAP
    SAVESNA "sna/snapshot.sna", START
