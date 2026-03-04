
// -------------- MEMORY MAP --------------

.label ZERO_PAGE_ADDRESS            = $0020
.label GAME_CODE_ADDRESS            = $0810
.label CHARSET_ATTRIB_ADDRESS       = $1000 // 100
.label VARIABLES_ADDRESS            = $1100 // 100
.label TABLES_ADDRESS               = $1200 // 100
.label LIBRARIES_ADDRESS            = $1300 // 500

.label SPRITES_ADDRESS              = $2000 // 50 sprites * 64 byte/sprite = 3200 bytes = $0c80 bytes
.label CHARSET_ADDRESS              = $3800
.label MAPS_ADDRESS                 = $6000
.label MAPS_COLOR_ADDRESS           = $7900
.label MUSIC_ADDRESS                = $c000



// $a000-$c000 BASIC ROM - DONT TOUCH!
// $c000-$cfff Free to use
// $d000-$ffff I/O and KERNEL ROM
