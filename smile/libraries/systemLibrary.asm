
// -------------- SYSTEM LIBRARY --------------

SYSTEM:
{
    setup:
        // Disable Basic
        sei 
        lda #%00110110
        sta PROCESSOR_PORT
        cli

        lda #%00011110 // Screen RAM: $0400   Charset: $3800
        sta SCREEN_MEMORY_SETUP

        rts

}
