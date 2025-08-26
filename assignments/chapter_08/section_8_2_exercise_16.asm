    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; Show  the  contents  of  the  registers  and  the  memory  locations  that  are  affected  after 
    ; the  execution  of  the  following  instructions.  Explain  the  difference  between  the 
    ; two  INC  instructions  shown  below. 

START

    LD HL, $E09F
    LD (HL), $FF
    INC (HL)
    INC HL

LOOP:
    jp LOOP        ; Loop infinito

END

; Creazione automatica del file TAP
    SAVESNA "sna/snapshot.sna", START
