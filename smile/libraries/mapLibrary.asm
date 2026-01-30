
// -------------- MAP LIBRARY --------------

MAP:
{
    load:
        // Push x and y to the stack
        txa
        pha
        tya
        pha

        // store the memory address for the map
        // in zero page.
        ldx mapNr
        lda Map_LO,x
        sta ZP_MAP_LO
        lda Map_HI,x
        sta ZP_MAP_HI


        lda #0
        sta tileCounter // keeps track of how far into the map we are.
        sta tileRow

        ldx #0
        loadMapRow:

            ldy #0
            sty tileCol
            loadMapCol:
                sty tempY
                ldy tileCounter
                lda (ZP_MAP_LO),y
                sta tileNr
                ldy tempY

                jsr TILE.drawTile

                inc tileCounter
                iny
                sty tileCol
                cpy #MAP_WIDTH
                bne loadMapCol

            inx
            stx tileRow
            cpx #MAP_HEIGHT
            bne loadMapRow


        // Restore x and y to from stack
        pla
        tay
        pla
        tax

        rts
}

