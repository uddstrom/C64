
// -------------- MAP MACROS --------------

.macro LoadMap(map)
{
    lda #map
    sta mapNr

    jsr MAP.load
}

