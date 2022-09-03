GAME: {

    Settings: {
        currentLevel: .byte $00
    }

    Start: {
                    lda Settings.currentLevel
                    jsr LEVEL.LoadLevel
                    jsr LEVEL.DrawLevel 

                    jsr IRQ.Install      

    
                    jsr POINTER.InitializePointer
    loop:           jsr INPUT.ReadJoystick
                    jsr INPUT.Reaction
                    jmp loop
    /*
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
                    */


    }
}