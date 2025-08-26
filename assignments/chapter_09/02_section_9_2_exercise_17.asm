    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; Register  B  holds  the  byte  3Fh,  representing  the  values  of  two  Hex  keys,  3  and F.  
    ; The  accumulator  holds  02h,  representing  a  new  key.  Specify  the  contents of register  B 
    ; after  the  execution  of  the  following  instructions  and  explain  the  function of  the instruction  OR  A. 



START

.init:
    LD A, $02 ; >> 00000010 >> 2
    LD B, $3F ; >> 00111111 >> 63

    LD L, A   ; >> backup A value in L
    LD C, $04 ; >> 00000100 >> 4
    LD A, B   ; >> store B in A

.shift
    OR A      ; >> set the CARRY flag to 0
    RLA       ; >> A=01111110 CY=0 >> C=4
              ; >> A=11111100 CY=0 >> C=3
              ; >> A=11111000 CY=1 >> C=2
              ; >> A=11110000 CY=1 >> C=1  ; move the low HEX to the high hex and set the last four bits to 0.
    DEC C      
    JP NZ, .shift

    OR L      ; A=11110010 after oring A with L which is 00000010
    LD B, A   ; we replace B with new pair of keys $F2

    ; OR A looks to be used to reset the carry to zero when running the rotation throug the carry so it behaves like a shift

.loop:
    jp .loop        ; Loop infinito


    SAVESNA "sna/snapshot.sna", START     ; Creazione automatica del file TAP

END

