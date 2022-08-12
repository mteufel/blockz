GAME: {

    Settings: {
        currentLevel: .byte $01
    }

    Start: {
        lda Settings.currentLevel
        jsr LEVEL.LoadLevel
        jsr LEVEL.DrawLevel
        jmp *
    }
}