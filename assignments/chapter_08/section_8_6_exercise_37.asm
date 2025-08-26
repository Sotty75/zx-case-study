    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; Ten  bytes  are  stored  in  memory  locations  starting  from  INBUF.  To  insert  an  additional five  bytes  
    ; at  the  beginning  locations,  it  is  necessary  to  shift  the  first  ten bytes  by  five  locations.  
    ; Write  a  program  to  shift  the  data  string  by  five  memory locations. 

START

BYTES EQU $E000

; We create some random bytes at the memory location $E000
TEST_DATA:
    LD HL, BYTES
    LD A, $00
    LD B, $0A

NEXT_ENTRY:
    LD (HL), A
    INC HL
    INC A
    DEC B
    JP NZ, NEXT_ENTRY


; Shift the bytes by 5 starting from the last one.


    LD B, $0A               ; we initialize the counter
    LD IX, BYTES + $09      ; source position, last byte
    LD IY, BYTES + $0E      ; destination byte, last byte + 5

SHIFT:
    LD A, (IX + 0)
    LD (IY + 0), A
    DEC IX
    DEC IY
    DEC B
    JP NZ, SHIFT

LOOP:
    jp LOOP        ; Loop infinito

END

; Creazione automatica del file TAP
    SAVESNA "sna/snapshot.sna", START
