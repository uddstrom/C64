BasicUpstart2(main)

main:
    jsr SCREEN_CLEAR        // Clear the C64 screen (jsr = jump to subroutine)
    #import "game.asm"

*=$2000
.import binary "smiley.bin"

