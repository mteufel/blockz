GAME: {

    Settings: {
        currentLevel: .byte $00
    }

    Start: {
        lda Settings.currentLevel
        jsr LEVEL.LoadLevel
        jsr LEVEL.DrawLevel
        jmp *
    }
}