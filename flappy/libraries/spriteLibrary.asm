
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
        sta SPRITE_POINTER_1,x
        sta SPRITE_POINTER_2,x

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
            sta SPRITE_POINTER_1,x
            sta SPRITE_POINTER_2,x

        done:
            rts

    checkCharCollision:
        txa
        pha
        tya
        pha

        stx tempX // Save X register in tempX

        // Calculate the sprites row position.
        // Done by dividing the sprites y pixel position by 8,
        // after removing the 50 pixel top offset.
        lda spriteYpos
        sec
        sbc #50 // Default Y offset
        clc
        adc spriteYoffset
        lsr
        lsr // LSR * 3: Divide by 8
        lsr
        tax // x now contains the current sprite row.

        // TODO: Figure out if we should read from screen 1 or 2.
        // Or does it matter?
        lda Row_LO,x
        sta ZP_ROW_LO
        lda Row_HI,x
        sta ZP_ROW_HI

        ldx tempX // Restore X register from tempX

        // Calculate the sprites col position.
        // Done by dividing the sprites x pixel position by 8,
        // after removing the 24 pixel left offset.
        lda spriteXpos
        sec
        sbc #24 // Default X offset
        clc
        adc spriteXoffset
        lsr
        lsr // LSR * 3: Divide by 8
        lsr
        tay // y now contains the current sprite col.

        lda (ZP_ROW_LO),y
        sta charCollision // charCollision will now contain the char code for the sprites row/col position.
 
        jsr charReaction

        pla
        tay
        pla
        tax

        rts

    charReaction:
        lda charCollision
        cmp #CHAR_SPACE
        bne isColliding
            rts
        isColliding:
            inc SCREEN_BORDER_COLOR
            rts
}
