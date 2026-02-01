
// -------------- SPRITE LIBRARY --------------

SPRITE:
{
    update:
        rts

    drawSprites:
        ldx #0
        loop:
            lda Sprite_X_Pos,x
            sta tempXpos
            lda Sprite_Y_Pos,x
            sta tempYpos

            txa
            pha
            asl
            tax

            lda tempXpos
            sta SPRITE_X,x
            lda tempYpos
            sta SPRITE_Y,x

            pla
            tax

            inx
            cpx #8
            bne loop

        rts
}
