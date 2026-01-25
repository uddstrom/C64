
main:
    jsr SCREEN_CLEAR        // Clear the C64 screen (jsr = jump to subroutine)
    #import "sprite.asm"

    gameLoop:

        ldx #0
        slowDownLoop:
            nop
            nop
            nop
            nop
            inx
            cpx #255
            bne slowDownLoop

        jsr readJoystick_2
        jmp gameLoop

    #import "joystick.asm"

