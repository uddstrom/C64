
// -------------- INPUT LIBRARY --------------

INPUT:
{
    readJoystick_2:
        ldx #0                  // Sprite 0
        lda JOYSTICK_2          // Read joystick port 2, memaddr $dc00
        cmp #JOYSTICK_2_IDLE    // cmp = compare, is the joystick idle 
        beq joy2_IDLE           // beq = branch if equal, if equal goto label joy2_IDLE, otherwise proceed
                jmp checkJoy2_UP    // if not idle, go here 
            joy2_IDLE:

            checkJoy2_UP:
                lda JOYSTICK_2  //   01111110
                and #UP         // & 00000001
                                // ----------
                                //   00000000 => 0 if up is active
                beq joy2_UP     // comparing JOYSTICK_2 && #UP with 0.
                    jmp checkJoy2_DOWN
                joy2_UP:        // Holding joy2 in UP position
                    dec Sprite_Y_Pos,x

            checkJoy2_DOWN:
                lda JOYSTICK_2
                and #DOWN
                beq joy2_DOWN
                    jmp checkJoy2_LEFT
                joy2_DOWN:
                    inc Sprite_Y_Pos,x

            checkJoy2_LEFT:
                lda JOYSTICK_2
                and #LEFT
                beq joy2_LEFT
                    jmp checkJoy2_RIGHT
                joy2_LEFT:
                    dec Sprite_X_Pos,x

            checkJoy2_RIGHT:
                lda JOYSTICK_2
                and #RIGHT
                beq joy2_RIGHT
                    jmp checkJoy2_FIRE
                joy2_RIGHT:
                    inc Sprite_X_Pos,x

            checkJoy2_FIRE:
                lda JOYSTICK_2
                and #FIRE
                beq joy2_FIRE
                    lda #(SPRITE_POINTER_INDEX + 0)            // Why $80? $2000 / $40 (64=$40 bytes of sprite graphics)
                    sta SPRITE_POINTER,x           // Sprite 0 sprite pointer index
                    jmp doneReadJoystick_2
                joy2_FIRE:
                    inc SCREEN_BORDER_COLOR
                    lda #(SPRITE_POINTER_INDEX + 1)            // Why $80? $2000 / $40 (64=$40 bytes of sprite graphics)
                    sta SPRITE_POINTER,x           // Sprite 0 sprite pointer index

        doneReadJoystick_2:
            rts
}

