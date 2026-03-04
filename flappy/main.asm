
// -------------- MAIN --------------

#import "/system/memoryMap.asm"
#import "/system/config.asm"
#import "/includes/constants.asm"
#import "/includes/macros.asm"

BasicUpstart2(main)

*=GAME_CODE_ADDRESS "Game Code"
#import "/includes/gameCode.asm"

*=CHARSET_ATTRIB_ADDRESS "Charset Attrib"
.import binary "/charset/charsetAttrib.bin"

*=TABLES_ADDRESS "Tables"
#import "/includes/tables.asm"

*=LIBRARIES_ADDRESS "Libraries"
#import "/includes/libraries.asm"

*=VARIABLES_ADDRESS "Variables"
#import "/includes/variables.asm"

*=MUSIC_ADDRESS "Music"
#import "/music/angry_birds.sid"

*=CHARSET_ADDRESS "Charset"
.import binary "/charset/charset.bin"

*=SPRITES_ADDRESS "Sprites"
.import binary "/sprites/flappy.bin"

*=MAPS_ADDRESS "Maps"
.import binary "/maps/map.bin"

*=MAPS_COLOR_ADDRESS "Maps color"
.import binary "/maps/mapColors.bin"

