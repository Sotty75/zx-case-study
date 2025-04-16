; SET PIXEL FUNCTION FOR THE ZX SPECTRUM WRITTEN BY PAOLO SOTGIU AKA SOT
; APRIL 9, 2025

    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ORG $5cbb

START



SCREEN DW $4000
SCREEN_END DW $5800
VPOS DW $0000           ; used to backup the VPOS during a character fill

INIT_SCREEN_POINTER:
    LD HL, (SCREEN)         ; HL = inizio schermo
    LD DE, (SCREEN_END)     ; DE = fine schermo
    
TEST_00:
    LD B, 12                ; X POS
    LD C, 21                ; Y POS

TEST_01:
    LD B, 0                 ; X POS
    LD C, 0                ; Y POS
    CALL SET_PIXEL

TEST_02:
    LD B, 1                ; X POS
    LD C, 1                ; Y POS
    CALL SET_PIXEL

TEST_03:
    LD B, 2                ; X POS
    LD C, 2               ; Y POS
    CALL SET_PIXEL
    LD B, 3                ; X POS
    LD C, 3               ; Y POS
    CALL SET_PIXEL
    LD B, 4                ; X POS
    LD C, 5               ; Y POS
    CALL SET_PIXEL
    LD B, 5                ; X POS
    LD C, 5               ; Y POS
    CALL SET_PIXEL
    LD B, 6                ; X POS
    LD C, 6               ; Y POS
    CALL SET_PIXEL
    LD B, 7                ; X POS
    LD C, 7               ; Y POS
    CALL SET_PIXEL


; Takes as input the X and Y positions:
;
;       X=[x7,x6,x5,x4,x3,x2,x1,x0]
;       Y=[y7,y6,y5,y4,y3,y2,y1,y0]
;
;       extracts target register and puts it in HL = [0,1,0,y7,y6,y2,y1,y0][y5,y4,y3,x7,x6,x5,x4,x3]
;       counts the position using [x0,x1,x2] to identify which point in the target address to highlight
;       
;       H Reginster
;       [y7,y6] are defining which block of the three main blocks we are using (00,01,02) => H {%010[00]}... {%010[01]...} {%010[10]...}   {$40} {48} {50}
;       [y2,y1,y0] are defining which row inside of a character we are using, rangin from 0 to 7
;       
;       L Register
;       [y5,y4,y3] are defining which characters row in the block to target from 0 to 7
;       [x7,x6,x5,x4,x3] are definings which character in the targeted characters row to index, from 0 to 31
;
;       L Register extrapolation
;       The algorithm can start from X or Y, we store XY in the BC registers.
;       Start from the X coordinate, putting bits x7,x6,x5,x4,x3 in A and doing a Shift Right Logical Operation, which is setting to 0 the leftmost values/
;       We put the result in L (where it is expected to stay) and then we extract values from Y after masking it with %00111000 as we need [y5,y4,y3]
;       We do an or with L so to get the final expected value
;       
;       H Register extrapolation
;       We do the same for Y values.
;       Take the first [y2,y1,y0] and move them in H after an OR to clear previous values.
;       To take [y7,y6] we do some shift operations to move them in the proper position, and then mask the values, we do an or with %01000000 to include the first 3 bits
;       store everything in H
;
;       Bit shift operations
;       Since we want to move bits around to save some cycles i want the most or less significant buits in shift right and shift left operations to be set to 0
;       So we use the two instructions: 
;
;           SLA -> Shift Left Arithmetic 
;           SRL -> Shift Right Logical
;
;       To pick the right pixel we set a kind of if on the [x2,x1,x0] bits and depoending on the value we set a different value in the target address.

SET_PIXEL:
    LD A, B                 ; ci mettiamo la coordinata x in A 
    SRL A                   ; mi interessa spostare i primi 5 pixel in L
    SRL A                   ; li sposto nella posizione giusta e quindi
    SRL A                   ; copio A in L
    LD L, A
    LD A, C                 
    AND %00111000           
    SLA A
    SLA A
    OR A, L
    LD L, A
    LD A, C
    AND %00000111
    OR %01000000
    LD H, A
    LD A, C
    AND %11000000
    SRL A
    SRL A
    SRL A
    OR A, H
    LD H, A
    ;;; HL Registry is correctly set

    LD A, B
    AND %00000111
    LD D, %10000000         ; we store in D the byte for first position %10000000
                            ; any time we decrement A we shift D by 1 until A is 0
    CP 0
    JP Z, FOUND
FIND_PIXEL:
    RRC D
    DEC A
    CP 0
    JP NZ, FIND_PIXEL
FOUND:
    LD (HL), D
    RET



END_LOOP:
    JP END_LOOP

; Delay loop molto semplice
DELAY:
    LD B, $FF        ; puoi abbassare questo valore se vuoi un delay più breve
DELAY_LOOP:
    DEC B
    JP NZ, DELAY_LOOP
    RET

END


    ; Creazione automatica del file SNA
    SAVESNA "sna/set-pixel.sna", START