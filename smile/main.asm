BasicUpstart2(main)

#import "/system/memoryMap.asm"
#import "/system/config.asm"
#import "/includes/constants.asm"

*=GAME_CODE_ADDRESS "Game Code"
#import "/includes/gameCode.asm"

*=LIBRARIES_ADDRESS "Libraries"
#import "/includes/libraries.asm"

*=VARIABLES_ADDRESS "Variables"
#import "/includes/variables.asm"

*=CHARSET_ATTRIB_ADDRESS "Charset Attributes"
.import binary "/charset/charsetAttrib.bin"

// *=TILESET_ADDRESS "Tileset"
// .import binary "tileset.bin"

*=SPRITES_ADDRESS "Sprites"
.import binary "/sprites/smiley.bin"

*=CHARSET_ADDRESS "Charset"
.import binary "/charset/charset.bin"

