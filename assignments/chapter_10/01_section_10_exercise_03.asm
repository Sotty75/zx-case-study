    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; Read the program below and  answer  the  questions.
    ;     
    ; 1. What  is  stored  in  the  stack  pointer  after  the  execution  of  instruction  1? 
    ; 2. What  are  the  contents  of  locations  84F8h  and  84F7h  after  the  execution  of  instruction 7  (PUSH HL)?     
    ; 3. Specify  the  bytes  in  the  accumulator  and  the  flag  register  after  the  execution 
    ;    of  the  instruction  OR  A. 
    ; 4. What  is  the  address  in  the  stack  pointer  when  instruction  9  is  executed  and 
    ;    what  are  the  contents  of  the  two  top  locations  of  the  stack? 
    ; 5. Specify  the  status  of  the  S,  Z,  and  C  flags  after  the  execution  of  instruction  20 
    ;    (POP  AF). 

    ; Answers
    ; 1. $84f9
    ; 2. $84f8 contains $81 - $84f7 contains $38
    ; 3. a=$23 - z=0 c=0 s=0 (%00100011)
    ; 4. $84f3
    ; 5. z=0 c=0 s=0


START

    ld sp, $84f9    ; 1
    ld hl, $8138    ; 2
    ld bc, $0001    ; 3
    ld de, $235a    ; 4
    ld a, d         ; 5
    or a            ; 6
    push hl         ; 7
    push af         ; 8
    push bc         ; 9
    pop af          ; 10   >> sovrascrive il flag registry con il contenuto di bc
    
.loop:
    jr .loop        ; Loop infinito

    SAVESNA "sna/snapshot.sna", START     ; Creazione automatica del file SNA 

END

