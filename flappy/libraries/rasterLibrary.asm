
// -------------- RASTER LIBRARY --------------

topBarColors: .byte 14,13,13,0
bottomBarColors: .byte 13,13,14,0

.const BAR_HEIGHT = 4

RASTER:
{
    topBar:
        ldx #0
        topBarLoop:
 
        lda topBarColors,x

        // Wait for the current raster line to finish painting,
        // then change the color.
        ldy $d012               // Current raster line
        painter1: cpy $d012
        beq painter1

        // sta $d020               // Screen border color
        sta SCREEN_BACKGROUND_COLOR// Screen background color

        inx

        cpx #BAR_HEIGHT
        bne topBarLoop
        rts

    bottomBar:
        ldx #0
        bottomBarLoop:
        lda bottomBarColors,x

        ldy $d012               // Current raster line
        painter2: cpy $d012
        beq painter2

        // sta $d020               // Screen border color
        sta SCREEN_BACKGROUND_COLOR// Screen background color

        inx

        cpx #BAR_HEIGHT
        bne bottomBarLoop
        rts
}
