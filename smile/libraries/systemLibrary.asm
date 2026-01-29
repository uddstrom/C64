
// -------------- SYSTEM LIBRARY --------------

SYSTEM:
{
    setup:
        // Disable Basic
        sei 
        lda #%00110110
        sta PROCESSOR_PORT
        cli

        // Screen RAM: $0400   Charset: $3800
        lda #%00011110 
        sta SCREEN_MEMORY_SETUP

        // Enable screen multicolor
		lda #%11011000
		sta SCREEN_CONTROL_2

        // Set screen border color
		lda #DEFAULT_SCREEN_BORDER_COLOR
		sta SCREEN_BORDER_COLOR

        // Set screen background color
		lda #DEFAULT_SCREEN_BACKGROUND_COLOR
		sta SCREEN_BACKGROUND_COLOR

        // Set extra color 1
		lda #DEFAULT_SCREEN_EXTRA_COLOR_1
		sta SCREEN_EXTRA_COLOR_1

        // Set extra color 2
		lda #DEFAULT_SCREEN_EXTRA_COLOR_2
		sta SCREEN_EXTRA_COLOR_2


        // Clear the screen
        jsr SCREEN_CLEAR

        // Setup raster inputs.

        rts

}
