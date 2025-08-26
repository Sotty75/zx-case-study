    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; Write  instructions  to  load  A2h  into  register  D  and  2080h  into  register  HL.  Copy 
    ; the  contents  of  D  into  memory  location  E080h. 

PORT1 EQU $FE

START
	LD D, $A2
	LD HL, $E080
	LD (HL), D
    
LOOP:
    jp LOOP        ; Loop infinito

END

; Creazione automatica del file TAP
    SAVESNA "sna/snapshot.sna", START
