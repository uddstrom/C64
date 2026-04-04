
colorBar1: .byte 13,13,14,14,0
colorBar2: .byte 14,14,13,13,0

BasicUpstart2(main)

main:
    jsr $e544               // Clear screen
    jsr setupRasterInterrupt
    mLoop:
        jmp mLoop

setupRasterInterrupt:

    sei                     // Disable interrupt requests

    lda #$7f                // 0111 1111
    sta $dc0d               // Disable interrupt signals from CIA 1 chip
    sta $dd0d               // Disable interrupt signals from CIA 2 chip

    lda $dc0d               // Acknowledge pending interrupts from CIA 1
    lda $dd0d               // Acknowledge pending interrupts from CIA 2

    lda $d011               // Screen control reg.
    and #%01111111          // Clear bit 7 since we are not using raster interrupts past raster line 255
    sta $d011               // Screen control reg.

    lda #150                // Trigger a raster interrupt at scan line 250
    sta $d012               // Current raster line

    lda #<irq               // Low byte of the address for our interrupt routine
    sta $0314               // Execution address (low bit) of interrupt service routine.
    lda #>irq               // High byte of the address for our interrupt routine
    sta $0315               // Execution address (hi bit) of interrupt service routine.

    lda $d01a               // Interrupt control reg.
    ora #%00000001          // Enable raster interrupts
    sta $d01a               // Interrupt control reg.

    cli                     // Enable interrupt requests

    rts

// ------------ Interrupt routine START --------------------
irq:
    lda $d019               // Interrupt status
    ora #%00000001          // Acknowledge raster interrupt
    sta $d019               // Interrupt status

    lda #200                // Trigger a raster interrupt at scan line 250
    sta $d012               // Current raster line

    lda #<irq2               // Low byte of the address for our interrupt routine
    sta $0314               // Execution address (low bit) of interrupt service routine.
    lda #>irq2               // High byte of the address for our interrupt routine
    sta $0315               // Execution address (hi bit) of interrupt service routine.

    ldx #0

    topBar: 
        lda colorBar1,x

        // Wait for the current raster line to finish painting,
        // then change the color.
        ldy $d012               // Current raster line
        painter1: cpy $d012
        beq painter1

        sta $d020               // Screen border color
        sta $d021               // Screen background color

        inx

        cpx #5
        bne topBar

    jmp $ea81               // $ea81, KERNAL interrupt return routine

// ------------ Interrupt routine END --------------------

// ------------ Interrupt routine 2 START --------------------
irq2:
    lda $d019               // Interrupt status
    ora #%00000001          // Acknowledge raster interrupt
    sta $d019               // Interrupt status

    lda #150                // Trigger a raster interrupt at scan line 250
    sta $d012               // Current raster line

    lda #<irq               // Low byte of the address for our interrupt routine
    sta $0314               // Execution address (low bit) of interrupt service routine.
    lda #>irq               // High byte of the address for our interrupt routine
    sta $0315               // Execution address (hi bit) of interrupt service routine.

    ldx #0

    bottomBar: 
        lda colorBar2,x

        ldy $d012               // Current raster line
        painter2: cpy $d012
        beq painter2

        sta $d020               // Screen border color
        sta $d021               // Screen background color

        inx

        cpx #5
        bne bottomBar

    jmp $ea31               // $ea81, KERNAL interrupt return routine

// ------------ Interrupt routine 2 END --------------------


