* = $02 "Blockz Zeropage data" virtual 
ZP: {
    counter:           .byte $00
    Temp:              .byte $00       // temporary storage as helper
    LevelDataVector:   .word $000
    LevelTemp:         .byte $00
        
    TileDrawVector:    .word $0000     // .word = zwei Bytes lang
    TileDrawTemp:      .byte $00
    TileDrawTemp2:     .byte $00
    TileElementVector: .word $0000
    TileStoreBitmap:   .byte $00       // wenn $00, dann werden beim LEVEL.DrawTile keine Bitmap-Daten geschrieben, bei $01 dagen schon 
                                       // wird benutzt beim Levelaufbau (Wert $01) und beim Color-Flashen wenn der Cursor drauf steht (Wert $00)

    Num1Lo:            .byte $00
    Num1Hi:            .byte $00 
    Num2Lo:            .byte $00
    Num2Hi:            .byte $00
    ResultLo:          .byte $00
    ResultHi:          .byte $00

    Num1:              .byte $00
    Num2:              .byte $00
    Num3:              .byte $00

    
}