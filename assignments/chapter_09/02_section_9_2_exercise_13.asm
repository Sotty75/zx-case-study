    ; directives for the assembler

    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; The  accumulator  contains  the  byte  $77. What  is  the  byte  in  the  accumulator  and 
    ; the  CY  flag  status  after  the  execution  of  the  instruction  RRCA? 

START

.exercise
    LD A, $77   ; bit-mask to mask bits D7-D4
    RRCA

; Answer:
; $77 is 01110111
; The RRCA instruztion pushes bit D0 on the carry and on the D7
; A will be 10111011, CY will be 1

; Il mnemonico lo posso interpretare come: Ruota i bit verso destra i sposta il bit sia in C che in A R.R.C.A
; a differenza di RRA che sposta il bit in C e quello in C lo sposta in A.
; Mi sembra piu' utile RRCA che RRA

.loop:
    jp .loop        ; Loop infinito


    SAVESNA "sna/snapshot.sna", START     ; Creazione automatica del file TAP

END

