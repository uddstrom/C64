
// -------------- COLLISION MACROS --------------
.macro CheckCollisions()
{
    // check collision upwards
    CheckCharCollision(SPRITE_X, SPRITE_Y, SPRITE_LEFT, SPRITE_TOP)
    CheckCharCollision(SPRITE_X, SPRITE_Y, SPRITE_MIDDLE, SPRITE_TOP)
    CheckCharCollision(SPRITE_X, SPRITE_Y, SPRITE_RIGHT, SPRITE_TOP)

    // check collision to the right
    CheckCharCollision(SPRITE_X, SPRITE_Y, SPRITE_RIGHT, SPRITE_TOP)
    CheckCharCollision(SPRITE_X, SPRITE_Y, SPRITE_RIGHT, SPRITE_CENTER)
    CheckCharCollision(SPRITE_X, SPRITE_Y, SPRITE_RIGHT, SPRITE_BOTTOM)

    // check collision downwards
    CheckCharCollision(SPRITE_X, SPRITE_Y, SPRITE_LEFT, SPRITE_BOTTOM)
    CheckCharCollision(SPRITE_X, SPRITE_Y, SPRITE_MIDDLE, SPRITE_BOTTOM)
    CheckCharCollision(SPRITE_X, SPRITE_Y, SPRITE_RIGHT, SPRITE_BOTTOM)
}

.macro CheckCharCollision(xPos, yPos, offsetX, offsetY)
{
    lda xPos // xPos = memory address of the sprites x pos
    sta spriteXpos
    lda yPos // yPos = memory address of the sprites y pos
    sta spriteYpos

    lda #offsetX
    sta spriteXoffset
    lda #offsetY
    sta spriteYoffset

    jsr SPRITE.checkCharCollision
    lda charCollision
}

.macro SetSpriteAnimation(spriteIdx, type, speed)
{
    ldx #spriteIdx

    lda #type
    sta Sprite_Anim_Type,x

    lda #speed
    sta Sprite_Anim_Speed,x
}
