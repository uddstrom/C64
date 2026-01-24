
lda #150
sta $d000           // sprite 0 x coord

lda #100
sta $d001           // sprite 0 y coord

lda #YELLOW
sta $d027           // sprite 0 color

lda #BLACK
sta $d025           // sprite extra color 1

lda #WHITE
sta $d026           // sprite extra color 2

lda #$80            // Why $80? $2000 / $40 (64=$40 bytes of sprite graphics)
sta $07f8           // Sprite 0 sprite pointer index

lda #%00000001      // Enable multicolor for sprite 0
sta $d01c           // Sprite multicolor mode

lda #%00000001      // Enable sprite 0
sta $d015           // Sprite enable register

// *=$2000
// .import binary "smiley.bin"


