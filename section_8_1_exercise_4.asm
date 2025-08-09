    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; Write  instructions  to  load  A7h  into  register  D  and  E055h  into  register  BC.  Copy 
    ; the  contents  of  D  using  BC  as  a  memory  pointer. 

START
	
    LD D, $A7
    LD BC, $E055
    LD A, D
    LD (BC), A
    
LOOP:
    jp LOOP        ; Loop infinito

END

; Creazione automatica del file TAP
    SAVESNA "sna/snapshot.sna", START
