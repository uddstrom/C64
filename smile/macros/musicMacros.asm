
// -------------- MUSIC MACROS --------------

.macro PlaySong(song)
{
    txa
    pha

    lda #song
    ldx #0
    ldy #0

    jsr MUSIC_INIT

    pla
    tax
}
