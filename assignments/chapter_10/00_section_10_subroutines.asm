    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

    ; this section covers the usage of the stack, push and pop instructions
    ; and the usage of subroutines

START

; This  program  controls  the  traffic  signal  lights  by  turning  them  on  or  off  at  a  specified 
; interval.  The  subroutine  technique  is  used  to  write  the  delay  routine,  and  a  register  pair  is 
; used  as  a  delay  register.  The  significance  of  using  the  register  pair  is  that  the  increment/ 
; decrement  instructions  do  not  affect  any  flags.  Thus,  a  procedure  needs  to  be  built  in  to  set 
; the  zero  flag  when  the  delay  count  in  the  register  pair  reaches  zero.


; lets assume we want the lights to be turned on at every single second.
; in our case, we will just go throug the different border colors,
; switching between red yellow and green once every three seconds

port EQU $FE



loop:
    ; set red ($02)
    ld a, $02
    out (port), a
    call delay
    ld a, $06
    out (port), a
    call delay
    ld a, $04
    out (port), a
    call delay
    jr loop

    
delay:
    push af
    push bc
    push de
    ld bc, $01FF
    ld de, $FFFF
loop_01:
    dec b
    push af
loop_02:
    dec d
    push af
loop_03:
    dec e
    jp nz, loop_03
    pop af
    jp nz, loop_02
    pop af
    jp nz, loop_01        
    pop de
    pop bc
    pop af
    ret
    

    SAVESNA "sna/snapshot.sna", START     ; Creazione automatica del file TAP

END

