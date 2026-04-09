
// -------------- SYSTEM LIBRARY --------------

SYSTEM:
{
    setup:
        // Disable Basic
        sei 
        lda #%00110110
        sta $0001 // PROCESSOR_PORT
        cli

        // Screen RAM: $0400   Charset: $3000
        lda #%00011100
        sta $d018 // SCREEN_MEMORY_SETUP

        // Enable screen multicolor and set screen width to 38 cols
		lda #%11010111
		sta $d016 // SCREEN_CONTROL_2
        sta PIX

        // Set screen border color
		lda #BLACK
		sta $d020 // SCREEN_BORDER_COLOR

        // Set screen background color
		lda #BLACK
		sta $d021 // SCREEN_BACKGROUND_COLOR

        // Set extra color 1
		lda #BLUE
		sta $d022 // SCREEN_EXTRA_COLOR_1

        // Set extra color 2
		lda #LIGHT_GREEN
		sta $d023 // SCREEN_EXTRA_COLOR_2

        // Clear the screen
        jsr $e544 // SCREEN_CLEAR

        // Init music
        lda #0
        tax
        tay
        jsr MUSIC_INIT

        // Setup raster inputs.
        jsr INTERRUPT.setupRasterInterrupt

        rts

}
