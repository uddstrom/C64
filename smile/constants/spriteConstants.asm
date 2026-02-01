
// -------------- SPRITE CONSTANTS --------------

.label SPRITE_X                 = $d000           // sprite 0 x coord
.label SPRITE_Y                 = $d001           // sprite 0 y coord

.label SPRITE_ENABLE            = $d015           // Sprite enable register
.label SPRITE_MULTICOLOR        = $d01c           // Sprite multicolor mode

.label SPRITE_COLOR             = $d027           // sprite 0 color
.label SPRITE_EXTRA_COLOR_1     = $d025           // sprite extra color 1
.label SPRITE_EXTRA_COLOR_2     = $d026           // sprite extra color 2

// lda #$80            // Why $80? $2000 / $40 (64=$40 bytes of sprite graphics)
// sta $07f8           // Sprite 0 sprite pointer index
.label SPRITE_POINTER = SCREEN_RAM + $03f8
.label SPRITE_POINTER_INDEX = SPRITES_ADDRESS / 64
