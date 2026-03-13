
// ---------------------- ANIMATION TABLES ----------------------

//
// Animation type "Flappy is idle"
//
Flappy_Anim_Idle:
    .byte 0
    .byte 255

//
// Animation type "Flappy is flying"
//
Flappy_Anim_Fly:
    .byte 0
    .byte 1
    .byte 2
    .byte 1
    .byte 255

Sprite_Anim_LO:
    .byte <Flappy_Anim_Idle
    .byte <Flappy_Anim_Fly

Sprite_Anim_HI:
    .byte >Flappy_Anim_Idle
    .byte >Flappy_Anim_Fly

//
// Sets the animation type for each sprite.
//
Sprite_Anim_Type:
    .byte 0 // eg. sprite 0 should be "flappy flying", ie animation type = 1
    .byte 0
    .byte 0
    .byte 0
    .byte 0
    .byte 0
    .byte 0
    .byte 0

//
// How many "ticks" before we update the frame counter.
//
Sprite_Anim_Speed:
    .byte 0
    .byte 0
    .byte 0
    .byte 0
    .byte 0
    .byte 0
    .byte 0
    .byte 0

//
// Keeps track of the "ticks" for each sprite.
//
Sprite_Anim_Timer:
    .byte 0
    .byte 0
    .byte 0
    .byte 0
    .byte 0
    .byte 0
    .byte 0

//
// Sprite graphic number of the current frame in the animation.
//
Sprite_Anim_Frame:
    .byte 0 // eg. the sprite graphic number for the current frame (3) is 5.
    .byte 0
    .byte 0
    .byte 0
    .byte 0
    .byte 0
    .byte 0
    .byte 0

//
// Keeps track of how far (how many frames) into the animation each sprite is.
//
Sprite_Anim_Frame_Counter:
    .byte 0 // eg. sprite 0 is at frame 3 of the animation.
    .byte 0
    .byte 0
    .byte 0
    .byte 0
    .byte 0
    .byte 0
    .byte 0

