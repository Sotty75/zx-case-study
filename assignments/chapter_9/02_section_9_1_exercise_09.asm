    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; Eight  lights  are  connected  to  output  port  OUT1.  These  can  be  turned  on  from  the 
    ; corresponding  switches  from  either  of  the  input  ports  INPUT1  or  INPUT2.  Write 
    ; instructions  to  read  INPUT1  and  INPUT2.  If  all  the  switches  are  off  in  both 
    ; ports,  continue  to  read  the  input  ports.  When  a  switch  (or  switches)  is  on  in  ei- 
    ; ther port,  turn  on  the  corresponding  light(s)  at  OUT1. 

INPUT1 EQU $04
INPUT2 EQU $00
OUT1 EQU $FE

START

.read_input
    LD A, INPUT1
    LD B, INPUT2
    OR B
    JR Z, .read_input ; if all switches are off, read input again

.turn_on
    OUT (OUT1), A

.loop:
    jp .loop        ; Loop infinito


    SAVESNA "sna/snapshot.sna", START     ; Creazione automatica del file SNA

END

