
// -------------- GAME CODE --------------

main:
    // init stack pointer
    ldx #$ff
    txs

    jsr SYSTEM.setup

gameSetup:
    LoadMap(0)
    #import "/includes/sprite.asm"

gameLoop:
    jsr delay
    jsr INPUT.readJoystick_2
    // jsr SPRITE.update
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

