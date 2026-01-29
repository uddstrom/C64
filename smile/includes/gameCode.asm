
// -------------- GAME CODE --------------

main:
    // init stack pointer
    ldx #$ff
    txs

    jsr SYSTEM.setup

gameSetup:
    // lda #1
    // sta $0400
 
    DrawChar(5,5,5,2)

    #import "/includes/sprite.asm"

gameLoop:
    jsr delay
    jsr INPUT.readJoystick_2
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

