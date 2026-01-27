
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

        // Set screen border color

        // Set screen background color

        // Set extra color 1
        // Set extra color 2

        // Clear the screen
        jsr SCREEN_CLEAR

        // Setup raster inputs.

        rts

}
