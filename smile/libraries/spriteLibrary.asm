
// -------------- SPRITE LIBRARY --------------
sprite_anim_timer: .byte 0 
sprite_anim_timer_temp: .byte 0

SPRITE:
{
    update:
        rts

    drawSprites:
        ldx #0
        updateSpritesPos:
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
            bne updateSpritesPos

        // animate spprite 1

        ldx #1
        lda sprite_anim_timer
        clc
        adc #10
        sta sprite_anim_timer
        lsr
        lsr
        lsr
        lsr
        lsr
        lsr
        clc
        adc #SPRITE_POINTER_INDEX
        adc #8
        sta SPRITE_POINTER,x

        rts
}
