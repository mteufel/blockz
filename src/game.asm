GAME: {

    Settings: {
        currentLevel: .byte $00
    }

    Start: {
                    lda Settings.currentLevel
                    jsr LEVEL.LoadLevel
                    jsr LEVEL.DrawLevel 

    /*
                    jsr POINTER.InitializePointer
    x:              jsr INPUT.ReadJoystick
                    jsr INPUT.Reaction
                    jmp x
                    */

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