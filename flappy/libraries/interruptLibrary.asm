
// -------------- INTERUPT LIBRARY --------------

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

        lda #250                                        // Trigger a raster interrupt at scan line 250

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

        jsr SPRITE.drawSprites

        jmp INTERRUPT_RETURN    // $ea81, KERNAL interrupt return routine

        // ------------ Interrupt routine END --------------------
    }
