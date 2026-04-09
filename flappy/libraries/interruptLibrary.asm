
// -------------- INTERUPT LIBRARY --------------

// First interrupt at line 225
// Secon interrupt at line 250

.const IRQ1_LINE = 0
.const IRQ2_LINE = 225
.const IRQ3_LINE = 240

INTERRUPT:
{
    setupRasterInterrupt:
        sei                 // Disable interrupt requests

        lda #%01111111
        sta INTERRUPT_CONTROL_AND_STATUS_CIA_1          // Disable interrupt signals from CIA 1 chip
        sta INTERRUPT_CONTROL_AND_STATUS_CIA_2          // Disable interrupt signals from CIA 2 chip

        lda INTERRUPT_CONTROL_AND_STATUS_CIA_1          // Acknowledge pending interrupts from CIA 1
        lda INTERRUPT_CONTROL_AND_STATUS_CIA_2          // Acknowledge pending interrupts from CIA 2

        lda SCREEN_CONTROL_1                            // $d011
        and #%01111111                                  // Clear bit 7 since we are not using raster
                                                        // interrupts past raster line 255
        sta SCREEN_CONTROL_1                            // $d011

        lda #IRQ1_LINE                                  // Trigger a raster interrupt at scan line 250
        sta CURRENT_RASTER_LINE                         // $d012

        lda #<irq                                       // Low byte of the address for our interrupt routine
        sta INTERRUPT_SERVICE_LO
        lda #>irq                                       // High byte of the address for our interrupt routine
        sta INTERRUPT_SERVICE_HI

        lda INTERRUPT_CONTROL                           // $d01a
        ora #%00000001                                  // Enable raster interrupts
        sta INTERRUPT_CONTROL                           // $d01a

        cli                                             // Enable interrupt requests

        rts


    enableRasterInterrupt:
        lda $d01a
        ora #%00000001      // Enable raster interrupts
        sta $d01a
        rts

    disableRasterInterrupt:
        lda $d01a
        and #%11111110      // Disable raster interrupts
        sta $d01a
        rts


    irq:
        // ------------ Interrupt routine START --------------------
        lda INTERRUPT_STATUS    // $d019
        ora #%00000001          // Acknowledge raster interrupt
        sta INTERRUPT_STATUS    // $d019

        lda PIX
        sta SCREEN_CONTROL_2
        jsr MAP.scrollRight
        jsr SPRITE.updateSprites // update the sprite position
        jsr SPRITE.animateSprites // runs the animation
        jsr MUSIC_PLAY

        lda #IRQ2_LINE                                  // Trigger a raster interrupt at scan line 250
        sta CURRENT_RASTER_LINE                         // $d012

        lda #<irq2                                      // Low byte of the address for our interrupt routine
        sta INTERRUPT_SERVICE_LO
        lda #>irq2                                      // High byte of the address for our interrupt routine
        sta INTERRUPT_SERVICE_HI

        jmp INTERRUPT_RETURN    // $ea81, KERNAL interrupt return routine

        // ------------ Interrupt routine END --------------------

    irq2:
        lda INTERRUPT_STATUS    // $d019
        ora #%00000001          // Acknowledge raster interrupt
        sta INTERRUPT_STATUS    // $d019

		lda #%11010000
        sta $d016

        jsr RASTER.topBar

        lda #IRQ3_LINE
        sta CURRENT_RASTER_LINE                         // $d012

        lda #<irq3                                      // Low byte of the address for our interrupt routine
        sta INTERRUPT_SERVICE_LO
        lda #>irq3                                      // High byte of the address for our interrupt routine
        sta INTERRUPT_SERVICE_HI

        jmp $ea81    // $ea81, KERNAL interrupt return routine

    irq3:
        lda INTERRUPT_STATUS    // $d019
        ora #%00000001          // Acknowledge raster interrupt
        sta INTERRUPT_STATUS    // $d019


        jsr RASTER.bottomBar

        lda #IRQ1_LINE
        sta CURRENT_RASTER_LINE                         // $d012

        lda #<irq                                       // Low byte of the address for our interrupt routine
        sta INTERRUPT_SERVICE_LO
        lda #>irq                                       // High byte of the address for our interrupt routine
        sta INTERRUPT_SERVICE_HI

        jmp $ea31    // $ea81, KERNAL interrupt return routine
    }
