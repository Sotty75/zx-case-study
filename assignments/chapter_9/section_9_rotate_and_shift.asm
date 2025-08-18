    ; directives for the assembler
    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION
    
    ; load the assembly code starting from address 32768, typical for all ZX Spectrum programs.
    ORG 0x8000

BEEPER_PORT EQU $FE         ; Port for EAR/MIC/Buzzer

START

PlayTimedBeep:
    LD HL, 5000         ; Outer loop counter for duration
    LD A, %00010000     ; Start with Buzzer ON

ToneLoop:
    OUT (BEEPER_PORT), A ; Send value to port

    ; --- Pitch Delay ---
    LD B, 50            ; Inner loop for pitch (a high-pitched sound)
PitchDelay:
    DJNZ PitchDelay

    XOR %00010000       ; Flip the buzzer bit

    ; --- Duration Countdown ---
    DEC HL              ; Decrement the 16-bit duration counter
    LD C, H             ; Check if HL is zero
    OR L
    JP NZ, ToneLoop     ; If HL is not zero, continue the loop
    

    SAVESNA "sna/snapshot.sna", START     ; Creazione automatica del file TAP

END

