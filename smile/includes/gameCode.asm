
// -------------- GAME CODE --------------

main:
    // init stack pointer
    ldx #$ff
    txs

    jsr SYSTEM.setup

gameSetup:
    // lda #1
    // sta $0400
 
    ldx #1 // row

    lda Row_LO,x
    sta ZP_ROW_LO
    lda Row_HI,x
    sta ZP_ROW_HI

    lda Row_Color_LO,x
    sta ZP_ROW_COLOR_LO
    lda Row_Color_HI,x
    sta ZP_ROW_COLOR_HI


    ldy #2 // column

    lda #1 // Screen code for A
    sta (ZP_ROW_LO),y


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

