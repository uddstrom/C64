
// -------------- GAME CODE --------------

main:
    // init stack pointer
    ldx #$ff
    txs

    jsr SYSTEM.setup

gameSetup:
    // lda #1
    // sta $0400
 
    DrawChar(19,3,5,YELLOW) // S
    DrawChar(13,3,6,YELLOW) // M
    DrawChar(9,3,7,YELLOW)  // I
    DrawChar(12,3,8,YELLOW) // L
    DrawChar(5,3,9,YELLOW)  // E

    // ROW 0
    DrawTile(2,0,0)
    DrawTile(2,0,1)
    DrawTile(2,0,2)
    DrawTile(2,0,3)
    DrawTile(2,0,4)
    DrawTile(2,0,5)
    DrawTile(2,0,6)
    DrawTile(2,0,7)

    // ROW 1
    DrawTile(2,1,0)
    // ROW 2
    DrawTile(2,2,0)

    // ROW 11
    DrawTile(2,11,0)
    DrawTile(2,11,1)
    DrawTile(2,11,2)
    DrawTile(2,11,3)
    DrawTile(2,11,4)
    DrawTile(2,11,5)
    DrawTile(2,11,6)
    DrawTile(2,11,7)


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

