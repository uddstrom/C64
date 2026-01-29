
.label JOYSTICK_2 = $dc00

.label UP       = %00000001
.label DOWN     = %00000010
.label LEFT     = %00000100
.label RIGHT    = %00001000
.label FIRE     = %00010000

.label JOYSTICK_2_IDLE = %01111111

INPUT:
{
    readJoystick_2:
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
                    // lda #32
                    // sta SCREEN_RAM + 0
                    jmp checkJoy2_DOWN
                joy2_UP:        // Holding joy2 in UP position
                    dec $d001   // move sprite 0 up
                    // lda #21     // U char
                    // sta SCREEN_RAM + 0

            checkJoy2_DOWN:
                lda JOYSTICK_2
                and #DOWN
                beq joy2_DOWN
                    // lda #32
                    // sta SCREEN_RAM + 1
                    jmp checkJoy2_LEFT
                joy2_DOWN:
                    inc $d001   // move sprite 0 down
                    // lda #4 // D
                    // sta SCREEN_RAM + 1

            checkJoy2_LEFT:
                lda JOYSTICK_2
                and #LEFT
                beq joy2_LEFT
                    // lda #32
                    // sta SCREEN_RAM + 2
                    jmp checkJoy2_RIGHT
                joy2_LEFT:
                    dec $d000
                    // lda #12 // L
                    // sta SCREEN_RAM + 2

            checkJoy2_RIGHT:
                lda JOYSTICK_2
                and #RIGHT
                beq joy2_RIGHT
                    // lda #32
                    // sta SCREEN_RAM + 3
                    jmp checkJoy2_FIRE
                joy2_RIGHT:
                    inc $d000
                    // lda #18 // R
                    // sta SCREEN_RAM + 3

            checkJoy2_FIRE:
                lda JOYSTICK_2
                and #FIRE
                beq joy2_FIRE
                    lda #$80            // Why $80? $2000 / $40 (64=$40 bytes of sprite graphics)
                    sta $07f8           // Sprite 0 sprite pointer index
                    jmp doneReadJoystick_2
                joy2_FIRE:
                    // later: smile (toggle smily sprite)
                    inc SCREEN_BORDER_COLOR
                    lda #$81            // Why $80? $2000 / $40 (64=$40 bytes of sprite graphics)
                    sta $07f8           // Sprite 0 sprite pointer index

        doneReadJoystick_2:
            rts
}

