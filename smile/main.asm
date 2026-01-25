BasicUpstart2(main)

#import "/system/memoryMap.asm"
#import "/includes/constants.asm"

*=GAME_CODE_ADDRESS "Game Code"
#import "/includes/gameCode.asm"

*=VARIABLES_ADDRESS "Variables"
#import "/includes/variables.asm"

// *=TILESET_ADDRESS "Tileset"
// .import binary "tileset.bin"

*=SPRITES_ADDRESS "Sprites"
.import binary "/spites/smiley.bin"

