GAME: {

    Settings: {
        currentLevel: .byte $00
    }

    Start: {
                lda Settings.currentLevel
                jsr LEVEL.LoadLevel
                jsr LEVEL.DrawLevel

    // delay "each frame" (1/50 Sekunden)
    //loop1:      lda #$fb
    //loop2:      cmp $d012
    //            bne loop2
    //            inc $d021
    //            lda $d012
    //loop3:      cmp $d012
    //            beq loop3
    //            jmp loop1

    /*              lda #$00    // reset
                    sta ZP.counter  // counter

    loop1:          lda #$fb    // wait for vertical retrace
    loop2:          cmp $d012   // until it reaches 251th raster line ($fb)
                    bne loop2   // which is out of the inner screen area

                    inc ZP.counter  // increase frame counter
                    lda ZP.counter  // check if counter
                    cmp #$0a    // reached 50
                    bne out     // if not, pass the color changing routine

                    lda #$00    // reset
                    sta ZP.counter  // counter

                    inc $d021   // increase background color
    out:            lda $d012   // make sure we reached
    loop3:          cmp $d012   // the next raster line so next time we
                    beq loop3   // should catch the same line next frame

                    jmp loop1   // jump to main loop                
    
    loop:           :delay(255,100)
                    ldx #$28
                    lda #$13
                    jsr LEVEL.DrawTile
                    :delay(255,100)
                    ldx #$28
                    lda #$14
                    jsr LEVEL.DrawTile                    
                    :delay(255,100)
                    ldx #$28
                    lda #$15
                    jsr LEVEL.DrawTile                    
                    jmp loop

    */
                // Tile-Element Number in accumulator
                // Position in X

                    jsr SPRITES.Initialize
    x:              jsr INPUT.ReadJoystick
                    jsr INPUT.Reaction
                    jmp x

    loop:           ldx #$0d
                    lda #$51
                    jsr LEVEL.RecolorTile
                    :delay(255,50)                                                                                
                    ldx #$0d
                    lda #$52
                    jsr LEVEL.RecolorTile
                    :delay(255,75)                                                                                
                    ldx #$0d
                    lda #$53
                    jsr LEVEL.RecolorTile
                    :delay(255,75)                                                                                
                    ldx #$0d
                    lda #$54
                    jsr LEVEL.RecolorTile
                    :delay(255,255)                                                                                
                    ldx #$0d
                    lda #$53
                    jsr LEVEL.RecolorTile
                    :delay(255,75)                                                                                
                    ldx #$0d
                    lda #$52
                    jsr LEVEL.RecolorTile                                                                                
                    :delay(255,75)                                                                                
                    ldx #$0d
                    lda #$51
                    jsr LEVEL.RecolorTile
                    :delay(255,50)                                                                                
                    jmp loop

    }
}