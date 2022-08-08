GAME: {

    Settings: {
        currentLevel: .byte $03
    }

    Start: {
        lda Settings.currentLevel
        jsr LEVEL.LoadLevel
        jsr LEVEL.DrawLevel
        jmp *
    }
}