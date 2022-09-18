GAME: {

    Data: {
        currentLevel: .byte $00

        lastPosition: .byte $00
        position:     .byte $00       // if this variable > $00 (and filled with a playfield coordinate) the flashing is active

        counter:      .byte $00       // to control the sleeps between color fades in the game loop
        fadeIndex:    .byte $00       //
        waitIndex:    .byte $00         
        fades:        .byte $51, $ff 
                      .byte $52, $ff 
                      .byte $53, $ff 
                      .byte $54, $ff 
                      .byte $53, $ff 
                      .byte $52, $ff, $fe      // $ff means -> wait sequence, other values point to a color fade , $fe means, end of fade sequence so restart it
        waits:        .byte $ff,$ff, $00       // table with wai values for each fade state, so i can control exactly the fade, $00 means end of this wait cylce  
                      .byte $a0, $00 
                      .byte $a0, $00 
                      .byte $ff, $ff, $ff, $ff, $00      // in the white phase of the fade, we stay a little bit longer 
                      .byte $a0, $00 
                      .byte $a0, $00      
   
    }

    

    Start: {
                    lda Data.currentLevel
                    jsr LEVEL.LoadLevel
                    jsr LEVEL.DrawLevel 
                    jsr OBJECTS.InitializePointer

                    // ============================================================
                    // MAIN GAME LOOP
                    // ============================================================

    loop:           jsr INPUT.ReadJoystick
                    jsr INPUT.Reaction
                    jsr RefreshPosition
                    jsr FadeSelectedBlockIfAny
                    jsr HandleLastPosition
                    jmp loop

    }

    BlockActivated: {
                    lda Data.position
                    cmp #$00
                    bne continue
                    rts
        continue:   sta Data.lastPosition
                    jsr HandleLastPosition

                    .break
                    // Create the sprite representation out of the marked block
                    jsr OBJECTS.InitializeBlockSprite

                    // Restore the background so that only the sprite is in front of
                    ldx OBJECTS.PointerIsAt
                    lda LEVEL.Data.Current,x
                    jsr LEVEL.DrawTileComplete

                    
                    jmp *
    }

    HandleLastPosition: {
                    lda Data.lastPosition
                    cmp #$00
                    beq exit
                    tax
                    lda #$51
                    jsr LEVEL.RecolorTile
                    lda #$00
                    sta Data.lastPosition
                    sta Data.fadeIndex
                    sta Data.waitIndex                    
                    sta Data.counter
        exit:       rts
    }

    RefreshPosition: {
                    ldx #$00
        !:          lda LEVEL.Data.CurrentBlocksPos,x
                    inx
                    cmp #$ff
                    beq off
                    cmp OBJECTS.PointerIsAt
                    bne !-
        match:      cmp #$00
                    beq store
                    cmp Data.position
                    beq doNotStore
                    ldx Data.position
                    stx Data.lastPosition
        store:      sta Data.position                   
        doNotStore: rts
        off:        lda Data.position             // resets the block to its initial color 
                    cmp #$00
                    beq exit
                    tax
                    lda #$51
                    jsr LEVEL.RecolorTile
        exit:       lda #$00
                    sta Data.fadeIndex
                    sta Data.waitIndex                    
                    sta Data.position
                    sta Data.counter
                    rts
    }

    FadeSelectedBlockIfAny: {
                    lda Data.position
                    cmp #$01
                    bcs fade                   // go to fade if position >= $01 
                    rts
        fade:       lda Data.counter
                    cmp #$00
                    bne wait
                    ldx Data.fadeIndex
                    lda Data.fades, x
                    cmp #$fe
                    beq reset
                    cmp #$ff
                    beq loadWait

                    ldx Data.position
                    jsr LEVEL.RecolorTile


                    inc Data.fadeIndex
                    rts
        wait:       dec Data.counter
                    lda Data.counter
                    cmp #$00
                    beq nextWait
                    rts
        nextWait:   inc Data.waitIndex
        loadWait:   ldx Data.waitIndex
                    lda Data.waits,x
                    cmp #$00
                    bne takeWait
                    inc Data.waitIndex
                    inc Data.fadeIndex

                    rts
        takeWait:   sta Data.counter
                    rts
        reset:      lda #$00
                    sta Data.fadeIndex
                    sta Data.waitIndex
                    sta Data.counter
                    rts

    }

    CheckPointerIsAt: {
                    // This routine checks if there is a block 
                    // at the position OBJECTS.PointerIsAt
                    //
                    // x = $00 no match (no Block which can be selected in PointerIsAt)
                    // x > $00 The id of of the block that is at PointerIsAt
                    ldx #$00
        !:          lda LEVEL.Data.CurrentBlocksPos,x
                    inx
                    cmp #$ff
                    beq noMatch
                    cmp OBJECTS.PointerIsAt
                    bne !-
        match:      dex
                    lda LEVEL.Data.CurrentBlocksTile,x
                    tax
                    rts
        noMatch:    ldx #$00
                    rts    
    }

}