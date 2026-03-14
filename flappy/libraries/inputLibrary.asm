
// -------------- INPUT LIBRARY --------------

INPUT:
{
    readJoystick_2:
        ldx #0                  // Sprite 0
        lda JOYSTICK_2          // Read joystick port 2, memaddr $dc00
        and #UP
        beq joy2_UP

        lda JOYSTICK_2          // Read joystick port 2, memaddr $dc00
        and #LEFT
        beq joy2_LEFT

        lda JOYSTICK_2          // Read joystick port 2, memaddr $dc00
        and #RIGHT
        beq joy2_RIGHT

        jmp joy2_ELSE

        joy2_UP:
            dec Sprite_Y_Pos,x
            SetSpriteAnimation(0,1,2) // animation 1 = flying
            jmp doneReadJoystick_2

        joy2_LEFT:
            SetSpriteAnimation(0,1,2) // animation 1 = flying
            dec Sprite_X_Pos,x
            jmp doneReadJoystick_2

        joy2_RIGHT:
            SetSpriteAnimation(0,1,2) // animation 1 = flying
            inc Sprite_X_Pos,x
            jmp doneReadJoystick_2

        joy2_ELSE:
            lda #JOYSTICK_2_IDLE
            inc Sprite_Y_Pos,x
            SetSpriteAnimation(0,0,10) // animation 0 = flappy is idle
            jmp doneReadJoystick_2

        doneReadJoystick_2:
            rts
}

