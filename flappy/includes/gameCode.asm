
// -------------- GAME CODE --------------

scrollX: .byte 0


main:
    // init stack pointer
    ldx #$ff
    txs

    jsr SYSTEM.setup

gameSetup:

    lda #0
    sta scrollX

    jsr MAP.loadMap_screen_1
    jsr MAP.colorMap

    // --- init player (sprite 0) ---
    ldx #0 // sprite 0

    lda #50
    sta Sprite_X_Pos,x
    lda #150
    sta Sprite_Y_Pos,x

    lda #%00000001          // Enable bit for sprite 0
    sta SPRITE_MULTICOLOR   // Enable multicolor for sprite 0
    lda #%00000001          // Enable bit for sprite 0
    sta SPRITE_ENABLE       // Enable sprite 0

    lda #YELLOW
    sta SPRITE_COLOR,x //$d027,0

    lda #ORANGE
    sta SPRITE_EXTRA_COLOR_1

    lda #WHITE
    sta SPRITE_EXTRA_COLOR_2

gameLoop:
    jsr delay
    jsr SPRITE.update
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

