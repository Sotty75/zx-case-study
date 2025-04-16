    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ORG 0x5CBB

START

ARCHIVIO DB 3,4,1,6,3,5

; indirizzamento: il processo di trasferire informazioni (byte) tra registri, tra registri e memoria a 
; tra diverse locazioni di memoria richiede l'identificazione di un particolare registro (tramite il suo nome) 
; oppure di una particolare parte della memoria (tramite il suo indirizzo). 

; 1. indirizzamento immediato: assegna un dato direttamente al registro, si puo' usare con tutti i registri disponibili ad eccezione del flag.

; 2. indirizzamento indiretto tra registri: coinvolge due registri, tipicamente si tratta di passare una informazione da un registor all'altro
; 3. indirizzamento indiretto tramite registri: coinvolge un registro oppure una cella di memoria. l'indirizzo della cella deve essere salvato in un registro
; 4. indirizzamento indiretto esteso
; 5. indirizzamento indicizzato

IMMEDIATO:
    LD A, 12        ; Inizializzazione della variabile contatore
    LD B, 10        ; Massimo numero di iterazioni
    LD C, 34
    LD D, 66
    LD E, 234
    LD HL, 23453
    LD BC, 12342
    LD DE, 45235
    LD IX, 23432
    LD IY, 55632

IND_RR:
    LD A,B
    LD B,C
    LD B,A
    LD BC,DE
    LD HL,BC
    LD IX,IY

IND_TR_REG
    LD A, 10
    LD B, 10
    ; quando voglio trasferire dalla memoria verso il registro ACCUMULATORE posso usare qualunque coppia di registri
    ; BC, DE, HL
    LD (22222), A       ; sposto in memoria il valore 10 alla locazione 22222
    LD (BC), A 
    LD A, (DE)
    ; LD (22222), B     ; -- non si puo' fare -- solo A ha il privilegio di accedere alla memoria
    LD A, 34
    LD A, (22222)
    ld B, A
    LD a, 5
    LD (22222), A
    ld HL, 22222
    ; per scambiare informazione don iregistri generici (B,C,D,E,IX,IY) posso pero' passare TRAMITE l'indirizzo nel registro HL, 
    ; per questo motivo si chiama tramite registro
    LD B, (HL)          
    LD (HL), C
    LD D, (HL)
  
; in questo caso l'indirizzo di memoria dal quale trasferire il dato al registro viene 
; fornito direttamente dal programma sotto forma di due byte. Puo' avvenire:
; - da e verso l'accumulatore (in questo caso si trasferisce un solo byte)
; - da e verso una coppia di registri (in questo caso si trasferiscono due byte)
IND_INDIRETTO_ESTESO:
    LD (ARCHIVIO), A
    LD A, (ARCHIVIO+1)
    LD (ARCHIVIO+2), BC
    LD DE, (ARCHIVIO+3)



LOOP:
    jp LOOP        ; Loop infinito

END

; Creazione automatica del file TAP
    SAVESNA "sna/indirizzamento.sna", START