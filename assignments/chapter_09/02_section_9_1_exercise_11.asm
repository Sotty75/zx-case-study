; The  following  instructions  read  the  switches  S7-S0  from  port  INPUT  1  and 
; S7'-S0'  from  port  INPUT2.  When  a  switch  is  ON,  it  provides  logic  1  to  the  corre- 
; sponding data  line  (for  example,  S7  to  D7).  The  readings  are  processed  and  used 
; for  decision  making.  Read  the  instructions,  and  answer  the  questions  following. 


; START:  
;   LD  HL,  2065H 
;   LD  (HL),  80H >> %10000000
; READ: 
;   IN  A,  (INPUT1) 
;   LD B,  A 
;   IN A,  (INPUT2) 
;   AND B  
;   JP Z,  READ     
;   LD B,  A 
;   AND $80             ; mascheriamo il bit A7 nell'accumulatore
;   CP (HL)             
;   JP  Z,  URGENT 
;   OUT  (OUTl),  A 
;   Continue — 


; a. What  is  the  output  at  OUTl  when  switches  So,  Si,  S3',  and  S7'  are  turned 
;    ON?  Explain  your  answer.  
; b. Does  the  program  jump  to  location  URGENT  when  switches  S7,  S7',  and  S0 
;    are  ON,  or  does  it  go  back  to  READ?  
; c. Specify  the  output  if  switches  S7,  S6,  S5,  S1,  S0  from  INPUT1  and  S5',  S4', 
;    S1' and  S0'  from  INPUT2  are  ON. 

; Answers:
; The program repeats the readings until the same switch is turned on on both the input ports
;
; a. The output is unchanged as the application keeps jumping to read after comparing the ports
; b. After the AND, A is set to $80 as S7 = S7' >> B is set to $80 >> AND $80 >> $80 and the comparison with (HL) moves the logic to urgent.
; c. The AND operation returns 00010010 >> $12 >> B is set to $12 >> AND $80 is not 0 so we do not jump to urgent and OUT1 is set to $80

