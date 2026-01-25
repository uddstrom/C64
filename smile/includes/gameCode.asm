
// -------------- GAME CODE --------------

main:

gameSetup:
    jsr SCREEN_CLEAR        // Clear the C64 screen (jsr = jump to subroutine)
    #import "/includes/sprite.asm"

gameLoop:
        jsr delay
        jsr readJoystick_2
        jmp gameLoop

delay:
    ldx #0
    slowDownLoop:
    nop
    nop
    nop
    nop
    inx
    cpx #255
    bne slowDownLoop
    rts

#import "/libraries/joystick.asm"

