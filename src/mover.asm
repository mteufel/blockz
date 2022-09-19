MOVER: {


    StartX:         .byte $00
    StartY:         .byte $00
    EndX:           .byte $00
    EndY:           .byte $00

    // Constants to define the directions, in which a block can move
    UP:             .byte $01
    DOWN:           .byte $02
    LEFT:           .byte $03
    RIGHT:          .byte $04

    // The ActionTables defines in which directions the block will move finally
    ActionTable:    .byte MOVER.UP, $ff, $ff  

    // The Route Table holds the (pre-calculated) path for the sprite moving
    // based on the ActionTable, format of the data
    // XPosLo, XPosHi, YPosLo, YPosHi
    // the mover ends when it finds the first $ff
    RouteTable:     .fill 600, $fe



}