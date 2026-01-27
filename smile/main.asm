// These imports does not take up any space in memory
#import "/system/memoryMap.asm"
#import "/system/config.asm"
#import "/includes/constants.asm"

BasicUpstart2(main)

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

*=TABLES_ADDRESS "Tables"
#import "/includes/tables.asm"

