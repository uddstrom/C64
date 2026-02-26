
// -------------- SYSTEM LIBRARY --------------

SYSTEM:
{
    setup:
        // Disable Basic
        sei 
        lda #%00110110
        sta $0001 // PROCESSOR_PORT
        cli

        // Screen RAM: $0400   Charset: $3800
        lda #%00011110 
        sta $d018 // SCREEN_MEMORY_SETUP

        // Enable screen multicolor
		lda #%11011000
		sta $d016 // SCREEN_CONTROL_2

        // Set screen border color
		lda #BLACK
		sta $d020 // SCREEN_BORDER_COLOR

        // Set screen background color
		lda #WHITE
		sta $d021 // SCREEN_BACKGROUND_COLOR

        // Set extra color 1
		lda #CYAN
		sta $d022 // SCREEN_EXTRA_COLOR_1

        // Set extra color 2
		lda #BLACK
		sta $d023 // SCREEN_EXTRA_COLOR_2

        // Clear the screen
        jsr $e544 // SCREEN_CLEAR

        // Setup raster inputs.
        // jsr INTERRUPT.setupRasterInterrupt

        rts

}
