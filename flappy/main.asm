
// -------------- MAIN --------------

#import "/system/memoryMap.asm"

BasicUpstart2(main)

*=GAME_CODE_ADDRESS "Game Code"
#import "/includes/gameCode.asm"

*=LIBRARIES_ADDRESS "Libraries"
#import "/includes/libraries.asm"

*=SPRITES_ADDRESS "Sprites"
.import binary "/sprites/flappy.bin"

