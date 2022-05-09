LEVELS: {

    .align $100
    LevelPointerData:
        .word level_0
        .word level_1
        .word level_2
        .word level_3

    level_0:
        .byte $16,$16,$16,$16,$16,$16,$16,$16,$16,$16,$16,$16
        .byte $16,$35,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$22,$16
        .byte $16,$1b,$1b,$1b,$1b,$06,$06,$1b,$1b,$1b,$1b,$16
        .byte $16,$1b,$1b,$1b,$06,$06,$06,$06,$1b,$1b,$1b,$16
        .byte $16,$1b,$1b,$1b,$1b,$06,$06,$1b,$1b,$1b,$1b,$16
        .byte $16,$1b,$1b,$1b,$1b,$06,$06,$1b,$1b,$1b,$1b,$16
        .byte $16,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$22,$16
        .byte $16,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$16
        .byte $16,$21,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$22,$16
        .byte $16,$16,$16,$16,$16,$16,$16,$16,$16,$16,$16,$16
        .byte 1      // level number
        .byte 4      // tries
        .byte 60     // time in sconds
        .byte 1,2    // in- and out sequence
    level_1:
        .byte $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0a,$0b
        .byte $0c,$0d,$0e,$10,$15,$16,$1a,$1b,$20,$21,$22,$23
        .byte $30,$31,$32,$33,$34,$35,$36,$37,$40,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte 2      // level number
        .byte 4      // tries
        .byte 60     // time in sconds
        .byte 1,2    // in- and out sequence
    level_2:
        .byte $10,$10,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b
        .byte $1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b
        .byte $1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b
        .byte $1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b
        .byte $1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b
        .byte $1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b
        .byte $1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b
        .byte $1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b
        .byte $1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b
        .byte $1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b
        .byte 2      // level number
        .byte 4      // tries
        .byte 60     // time in sconds
        .byte 1,2    // in- and out sequence
    level_3:
        .byte $16,$16,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b
        .byte $1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b
        .byte $1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b
        .byte $1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b
        .byte $1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b
        .byte $1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b
        .byte $1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b
        .byte $1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b
        .byte $1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b
        .byte $1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b,$1b
        .byte 2      // level number
        .byte 4      // tries
        .byte 60     // time in sconds
        .byte 1,2    // in- and out sequence                
}