    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; The  input  buffer  memory  (INBUF)  contains  256  bytes  of  data.  
    ; Search  for  the  byte  (character) 24H  in  the  input  buffer.  
    ; If  it  is  found,  jump  to  location  START;  otherwise,  jump  to location  ERROR. 

    ORG 0x8000

INBUF DB $7B, $E1, $C3, $8A, $5F, $D2, $09, $4E, $6D, $B4, $27, $91, $FA, $3C, $05, $88
      DB $1F, $A6, $55, $7D, $E9, $3B, $C2, $04, $90, $47, $6A, $F8, $2E, $B3, $DC, $11
      DB $50, $8C, $E7, $3A, $D1, $0F, $96, $4B, $23, $BA, $79, $FE, $61, $CB, $14, $A2 
      DB $D8, $24, $B7, $6C, $0E, $95, $4A, $F1, $33, $AE, $70, $C9, $82, $5B, $16, $EC 
      DB $9A, $41, $DE, $37, $C0, $1B, $80, $59, $F3, $2A, $B1, $68, $0D, $97, $4F, $E2 
      DB $C4, $1D, $86, $5E, $F7, $2C, $B5, $6E, $00, $99, $42, $DB, $36, $AD, $74, $C1 
      DB $29, $B0, $69, $FC, $3E, $A5, $7E, $D7, $18, $83, $5A, $F0, $0B, $92, $49, $E4 
      DB $67, $CA, $13, $A8, $4D, $D6, $0B, $92, $E5, $38, $CF, $12, $AB, $72, $C5, $8E 
      DB $FF, $06, $9F, $44, $D9, $01, $98, $43, $AC, $75, $CC, $15, $A0, $6B, $F2, $3D 
      DB $30, $A9, $73, $CE, $26, $BB, $60, $FD, $94, $4D, $DA, $35, $C6, $1F, $84, $5D 
      DB $8B, $52, $EB, $34, $CD, $10, $88, $51, $F9, $22, $BF, $66, $0A, $93, $48, $E3 
      DB $0C, $9D, $46, $DF, $32, $AF, $76, $CD, $85, $5C, $E0, $39, $D0, $08, $9B, $40 
      DB $A1, $62, $FB, $20, $BD, $64, $FF, $07, $9E, $45, $DC, $31, $AA, $71, $C8, $19 
      DB $77, $CE, $17, $A4, $4F, $D4, $03, $9A, $E8, $3F, $C7, $1E, $A7, $6E, $B9, $58 
      DB $25, $B6, $B8, $57, $F4, $2B, $B2, $65, $02, $9B, $4A, $DD, $30, $A9, $70, $C7 
      DB $ED, $36, $CB, $16, $A3, $6A, $F1, $28, $BE, $63, $FA, $21, $B8, $5F, $89, $C7  

START

.initialization
    LD A, $89
    LD HL, INBUF
    LD BC, $100

.find
    CPIR    
    JP Z, .found
    JP .loop

.found
    LD D, C

.loop
    JP .loop    

    SAVESNA "sna/snapshot.sna", START     ; Creazione automatica del file TAP

END

