
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
