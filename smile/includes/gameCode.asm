
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

    // Should be done in raster interupt routine
    sta $d000           // sprite 0 x coord
    sta $d001           // sprite 0 y coord

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

