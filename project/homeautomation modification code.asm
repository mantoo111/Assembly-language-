.MODEL SMALL
.STACK 100H
.DATA

    ; Messages
    promptMsg DB 'Enter 0 (Relay 1 OFF), 1 (Relay 1 ON), 2 (Relay 2 OFF), 3 (Relay 2 ON), 4 (Relay 3 OFF), 5 (Relay 3 ON), 6 (Relay 4 OFF), 7 (Relay 4 ON): $'
    relayMsg DB 'Relay selected: $'
    beforeStateMsg DB 'State before: $'
    afterStateMsg DB 'State after: $'
    relay1Msg DB 'Relay 1 (Light)$'
    relay2Msg DB 'Relay 2 (Fan)$'
    relay3Msg DB 'Relay 3 (Heater)$'
    relay4Msg DB 'Relay 4 (Pump)$'
    onMsg DB 'ON$'
    offMsg DB 'OFF$'
    newline DB 13, 10, '$'

    ; User input storage
    userInput DB 0

    ; Relay states (0 = OFF, 1 = ON)
    stateRelay1 DB 0
    stateRelay2 DB 0
    stateRelay3 DB 0
    stateRelay4 DB 0

.CODE

START:
    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX



    ; Initialize DX for port 0x379
    MOV DX, 0x379

    ; Main loop
MAIN_LOOP:
    ; Prompt for input
    LEA DX, promptMsg
    CALL PRINT_STRING

    ; Read input from user
    CALL READ_INPUT  
   
    ; Handle input for each relay
    CMP AL, '0'
    JE RELAY1_OFF
    CMP AL, '1'
    JE RELAY1_ON
    CMP AL, '2'
    JE RELAY2_OFF
    CMP AL, '3'
    JE RELAY2_ON
    CMP AL, '4'
    JE RELAY3_OFF
    CMP AL, '5'
    JE RELAY3_ON
    CMP AL, '6'
    JE RELAY4_OFF
    CMP AL, '7'
    JE RELAY4_ON

    ; If invalid input, loop again
    JMP MAIN_LOOP
     
    

       RELAY1_OFF:
                   ; Turn off relay 1
                   LEA DX, relay1Msg
                   CALL DISPLAY_RELAY_STATE
               
                   IN AL, DX
                   AND AL, 0xFE          ; 1111 1110 (Turn off bit 0)
                   OUT DX, AL
                   MOV stateRelay1, 0
               
                   LEA DX, offMsg
                   JMP DISPLAY_UPDATED_STATE

       RELAY1_ON:
                   ; Turn on relay 1
                   LEA DX, relay1Msg
                   CALL DISPLAY_RELAY_STATE
               
                   IN AL, DX
                   OR AL, 0x01          ; 0000 0001 (Turn on bit 0)
                   OUT DX, AL
                   MOV stateRelay1, 1
               
                   LEA DX, onMsg
                   JMP DISPLAY_UPDATED_STATE
               
      RELAY2_OFF:
                   ; Turn off relay 2
                   LEA DX, relay2Msg
                   CALL DISPLAY_RELAY_STATE
               
                   IN AL, DX
                   AND AL, 0xFD          ; 1111 1101 (Turn off bit 1)
                   OUT DX, AL
                   MOV stateRelay2, 0
               
                   LEA DX, offMsg
                   JMP DISPLAY_UPDATED_STATE
               
      RELAY2_ON:
                   ; Turn on relay 2
                   LEA DX, relay2Msg
                   CALL DISPLAY_RELAY_STATE
               
                   IN AL, DX
                   OR AL, 0x02          ; 0000 0010 (Turn on bit 1)
                   OUT DX, AL
                   MOV stateRelay2, 1
               
                   LEA DX, onMsg
                   JMP DISPLAY_UPDATED_STATE
               
      RELAY3_OFF:
                   ; Turn off relay 3
                   LEA DX, relay3Msg
                   CALL DISPLAY_RELAY_STATE
               
                   IN AL, DX
                   AND AL, 0xFB          ; 1111 1011 (Turn off bit 2)
                   OUT DX, AL
                   MOV stateRelay3, 0
               
                   LEA DX, offMsg
                   JMP DISPLAY_UPDATED_STATE
               
      RELAY3_ON:
                   ; Turn on relay 3
                   LEA DX, relay3Msg
                   CALL DISPLAY_RELAY_STATE
               
                   IN AL, DX
                   OR AL, 0x04          ; 0000 0100 (Turn on bit 2)
                   OUT DX, AL
                   MOV stateRelay3, 1
               
                   LEA DX, onMsg
                   JMP DISPLAY_UPDATED_STATE
               
      RELAY4_OFF:
                   ; Turn off relay 4
                   LEA DX, relay4Msg
                   CALL DISPLAY_RELAY_STATE
               
                   IN AL, DX
                   AND AL, 0xF7          ; 1111 0111 (Turn off bit 3)
                   OUT DX, AL
                   MOV stateRelay4, 0
               
                   LEA DX, offMsg
                   JMP DISPLAY_UPDATED_STATE
               
       RELAY4_ON:
                   ; Turn on relay 4
                   LEA DX, relay4Msg
                   CALL DISPLAY_RELAY_STATE
               
                   IN AL, DX
                   OR AL, 0x08          ; 0000 1000 (Turn on bit 3)
                   OUT DX, AL
                   MOV stateRelay4, 1
               
                   LEA DX, onMsg
               
      DISPLAY_UPDATED_STATE:
       
                   CALL PRINT_STRING
                   CALL PRINT_NEWLINE
                   JMP MAIN_LOOP
                     
                     
                     
                     
                     
                                                  
                                                  DISPLAY_RELAY_STATE PROC
                                                      ; Display which relay is selected
                                                      LEA DX, relayMsg
                                                      CALL PRINT_STRING
                                                     ; CALL PRINT_STRING  ; Print relay message
                                                  
                                                      ; Display state before change
                                                      LEA DX, beforeStateMsg
                                                      CALL PRINT_STRING
                                                  
                                                      ; Check current state and display it
                                                      CMP userInput, '0'
                                                      JE PRINT_STATE_RELAY1
                                                      CMP userInput, '1'
                                                      JE PRINT_STATE_RELAY1
                                                      CMP userInput, '2'
                                                      JE PRINT_STATE_RELAY2
                                                      CMP userInput, '3'
                                                      JE PRINT_STATE_RELAY2
                                                      CMP userInput, '4'
                                                      JE PRINT_STATE_RELAY3
                                                      CMP userInput, '5'
                                                      JE PRINT_STATE_RELAY3
                                                      CMP userInput, '6'
                                                      JE PRINT_STATE_RELAY4
                                                      CMP userInput, '7'
                                                      JE PRINT_STATE_RELAY4
                                                  
                                                  PRINT_STATE_RELAY1:
                                                      MOV AL, stateRelay1
                                                      CMP AL, 0
                                                      JE DISPLAY_OFF_STATE
                                                      JMP DISPLAY_ON_STATE
                                                  
                                                  PRINT_STATE_RELAY2:
                                                      MOV AL, stateRelay2
                                                      CMP AL, 0
                                                      JE DISPLAY_OFF_STATE
                                                      JMP DISPLAY_ON_STATE
                                                  
                                                  PRINT_STATE_RELAY3:
                                                      MOV AL, stateRelay3
                                                      CMP AL, 0
                                                      JE DISPLAY_OFF_STATE
                                                      JMP DISPLAY_ON_STATE
                                                  
                                                  PRINT_STATE_RELAY4:
                                                      MOV AL, stateRelay4
                                                      CMP AL, 0
                                                      JE DISPLAY_OFF_STATE
                                                      JMP DISPLAY_ON_STATE
                                                  
                                                  DISPLAY_OFF_STATE:
                                                      LEA DX, offMsg
                                                      JMP PRINT_AND_CONTINUE
                                                  
                                                  DISPLAY_ON_STATE:
                                                      LEA DX, onMsg
                                                  
                                                  PRINT_AND_CONTINUE:
                                                      CALL PRINT_STRING
                                                      CALL PRINT_NEWLINE
                                                  
                                                      LEA DX, afterStateMsg
                                                      CALL PRINT_STRING
                                                  
                                                      RET
                                                  DISPLAY_RELAY_STATE ENDP  
                                                  
                                                  
                                                                            
                                                                            
                                                                            
                                                                            
                                                                            
                                                                            
                                                  
                                                  ; Subroutine to print a string
                                                  PRINT_STRING PROC
                                                      ; Print null-terminated string at DS:DX
                                                      MOV AH, 09H
                                                      INT 21H
                                                      RET
                                                  PRINT_STRING ENDP
                                                                    
                                                                      
                                                                      
                                                                      
                                                                      
                                                                    
                                                                    
                                                                    
                                                                    
                                                  ; Subroutine to read a single character input
                                                  READ_INPUT PROC
                                                      ; Read a character from keyboard into AL
                                                      MOV AH, 01H
                                                      INT 21H
                                                      MOV userInput, AL
                                                      RET
                                                  READ_INPUT ENDP
                                                                       
                                                                        
                                                                        
                                                                        
                                                                        
                                                                       
                                                                       
                                                                       
                                                  ; Subroutine to print a newline
                                                  PRINT_NEWLINE PROC
                                                      LEA DX, newline
                                                      CALL PRINT_STRING
                                                      RET
                                                  PRINT_NEWLINE ENDP

END START
