
// -------------- GAME CODE --------------

main:
    // init stack pointer
    ldx #$ff
    txs

    jsr SYSTEM.setup

gameSetup:
    LoadMap(0)
    // #import "/includes/sprite.asm"

    // --- init player (sprite 0) ---
    ldx #0 // sprite 0

    lda #100
    sta Sprite_X_Pos,x
    sta Sprite_Y_Pos,x

    // For later
    // lda #10
    // sta Sprite_V_Speed,x
    // sta Sprite_H_Speed,x

    lda #%00000001          // Enable bit for sprite 0
    sta SPRITE_MULTICOLOR   // Enable multicolor for sprite 0
    lda #%00000001          // Enable bit for sprite 0
    sta SPRITE_ENABLE       // Enable sprite 0

    lda #YELLOW
    sta SPRITE_COLOR,x //$d027,0

    lda #BLACK
    sta SPRITE_EXTRA_COLOR_1

    lda #WHITE
    sta SPRITE_EXTRA_COLOR_2

    // --- init Sprite 1 ---
    ldx #1

    lda #150
    sta Sprite_X_Pos,x
    sta Sprite_Y_Pos,x

    lda #(SPRITE_POINTER_INDEX + 8)
    sta SPRITE_POINTER,x

    lda SPRITE_ENABLE
    ora #%00000010
    sta SPRITE_ENABLE



gameLoop:
    jsr delay
    jsr INPUT.readJoystick_2
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

