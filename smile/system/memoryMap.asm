
// -------------- MEMORY MAP --------------

.label ZERO_PAGE_ADDRESS            = $0020
.label GAME_CODE_ADDRESS            = $0810
.label VARIABLES_ADDRESS            = $0c00
.label CHARSET_ATTRIB_ADDRESS       = $0d00

.label SPRITES_ADDRESS              = $2000 // 96 sprites * 64 byte/sprite = 6144 bytes = $1800 bytes
.label CHARSET_ADDRESS              = $3800
.label TABLES_ADDRESS               = $4000
.label LIBRARIES_ADDRESS            = $5000
