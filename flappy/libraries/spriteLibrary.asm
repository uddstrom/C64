
// -------------- SPRITE LIBRARY --------------
sprite_anim_timer: .byte 0 
ground_level: .byte 198

SPRITE:
{
    update:
        ldx #0 // sprite 0
        lda Sprite_Y_Pos,x
        cmp ground_level
        bcs doneUpdateSprite // branch if a is greater than or equal to ground_level
        lda animate
        cmp #1
        beq doneUpdateSprite
        inc Sprite_Y_Pos,x
        doneUpdateSprite:
            rts


    drawSprites:
        ldx #0
        lda #SPRITE_POINTER_INDEX
        sta SPRITE_POINTER,x

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

        lda animate
        cmp #1
        bne done

        animateSprite0:
            ldx #0
            lda sprite_anim_timer
            clc
            adc #20
            sta sprite_anim_timer
            lsr
            lsr
            lsr
            lsr
            lsr
            lsr
            clc
            adc #SPRITE_POINTER_INDEX
            // adc #0
            sta SPRITE_POINTER,x

        done:
            rts
}
