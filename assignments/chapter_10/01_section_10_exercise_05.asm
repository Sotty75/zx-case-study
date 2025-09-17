    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; The  following  program  has  a  delay  subroutine  located  at  2060h.  Read  the  program and  answer  
    ; the  questions  following. 
    ; 
    ;   a. When  the  Call  instruction  located  at  2009h (CALL delay)  is  executed,  specify  the  contents 
    ;      of  the  stack  location  20FEh  and  the  address  in  the  stack  pointer. 
    ;   b. List  the  stack  locations  and  their  contents  after  the  execution  of  the  instructions PUSH  HL  
    ;      and  PUSH  BC  in  the  subroutine. 
    ;   c. List  the  address  in  the  stack  pointer  and  the  contents  of  the  BC  registers  after 
    ;      the  execution  of  the  instruction  POP  BC. 
    ;   d. Where  does  the  program  return  after  the  execution  of  the  instruction  RET  at 
    ;      the  end  of  the  subroutine? 
    ;   e. Specify  the  contents  of  the  stack  pointer  after  the  execution  of  the  RET  instruction. 

    ; Answers:
    ;
    ; a. The call pushes the PC ($200C) into the stack. $20FF -> $20. $20FE -> $0C
    ; b. $20FD -> $20 - $20FC ->$50 - $20FB  -> $00 - $20FA  -> $0a
    ; c. $20fc, $000a
    ; d. $200C
    ; e. $2100

START

PORT1 EQU $fe

main: 
    LD SP,  $2100
    LD HL,  $2050 
    LD BC,  $000a 
    CALL  delay
    OUT  (PORT1),  A 

delay:                  ; asssume this is in address $2060
    PUSH  HL 
    PUSH  BC 
    LD  HL,  $A2FF 
    POP  BC 
    POP  HL 
    RET 

.loop:
    jr .loop        ; Loop infinito

    SAVESNA "sna/snapshot.sna", START     ; Creazione automatica del file SNA 

END

