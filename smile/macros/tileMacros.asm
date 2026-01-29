
// -------------- TILE MACROS --------------

.macro DrawChar(char, row, col, color)
{
    lda #char
    sta tileNr

    lda #row
    sta tileRow

    lda #col
    sta tileCol

    lda #color
    sta tileColor

    jsr TILE.drawChar
}

