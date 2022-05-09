* = $02 "Blockz Zeropage data" virtual 
ZP: {
    LevelDataVector:   .word $000
    LevelTemp:         .byte $00
        
    TileDrawVector:    .word $0000     // .word = zwei Bytes lang
    TileDrawTemp:      .byte $00
    TileDrawTemp2:     .byte $00
    TileElementVector: .word $0000

    Num1Lo:            .byte $00
    Num1Hi:            .byte $00
    Num2Lo:            .byte $00
    Num2Hi:            .byte $00
    ResultLo:          .byte $00
    ResultHi:          .byte $00

}