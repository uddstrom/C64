
// -------------- COLLISION MACROS --------------

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
