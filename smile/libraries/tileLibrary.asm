
// -------------- TILE LIBRARY --------------

TILE:
{
    drawChar:

        txa
        pha
        tya
        pha

        ldx tileRow

        lda Row_LO,x
        sta ZP_ROW_LO
        lda Row_HI,x
        sta ZP_ROW_HI

        lda Row_Color_LO,x
        sta ZP_ROW_COLOR_LO
        lda Row_Color_HI,x
        sta ZP_ROW_COLOR_HI

        ldy tileCol

        lda tileNr
        sta (ZP_ROW_LO),y

        lda tileColor
        sta (ZP_ROW_COLOR_LO),y

        pla
        tay
        pla
        tax

        rts
}




