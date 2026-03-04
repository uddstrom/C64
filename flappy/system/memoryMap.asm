
// -------------- MEMORY MAP --------------

.label ZERO_PAGE_ADDRESS            = $0020
.label GAME_CODE_ADDRESS            = $0810
.label CHARSET_ATTRIB_ADDRESS       = $1000 // 100
.label VARIABLES_ADDRESS            = $1100 // 100
.label TABLES_ADDRESS               = $1200 // 100
.label LIBRARIES_ADDRESS            = $1300 // 500

.label MUSIC_ADDRESS                = $2000 // 834
.label CHARSET_ADDRESS              = $3000 // 7c8, must align with system memory setup in system library!
.label SPRITES_ADDRESS              = $3800 // 40 sprites * 64 byte/sprite = 2560 bytes = $0a00 bytes
.label MAPS_ADDRESS                 = $6000
.label MAPS_COLOR_ADDRESS           = $7900



// $a000-$c000 BASIC ROM - DONT TOUCH!
// $c000-$cfff Free to use
// $d000-$ffff I/O and KERNEL ROM
