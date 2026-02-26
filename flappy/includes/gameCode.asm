
// -------------- GAME CODE --------------

.label SPRITE_ENABLE = $d015
.label SPRITE_COLOR = $d027
.label SPRITE_MULTICOLOR = $d01c
.label SPRITE_EXTRA_COLOR_1 = $d025
.label SPRITE_EXTRA_COLOR_2 = $d026

main:
    // init stack pointer
    ldx #$ff
    txs

    jsr SYSTEM.setup

gameSetup:

    // --- init player (sprite 0) ---
    ldx #0 // sprite 0

    lda #100
    sta $d000 // SPRITE_0_X
    sta $d001 // SPRITE_0_Y

    lda #$80            // Why $80? $2000 / $40 (64=$40 bytes of sprite graphics)
    sta $07f8           // Sprite 0 sprite pointer index

    lda #%00000001          // Enable bit for sprite 0
    sta SPRITE_MULTICOLOR   // Enable multicolor for sprite 0
    lda #%00000001          // Enable bit for sprite 0
    sta SPRITE_ENABLE       // Enable sprite 0

    lda #YELLOW
    sta SPRITE_COLOR,x //$d027,0

    lda #BLACK
    sta SPRITE_EXTRA_COLOR_1

    lda #RED
    sta SPRITE_EXTRA_COLOR_2

gameLoop:
    jsr delay
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

