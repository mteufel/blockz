GRAPHICS: {

    CopyTile: {

                    // first of all get the memory location with data
                    // for tile in accumulator
                    tax
                    lda TileElementsLSB,x
                    sta ZP.TileElementVector + 0
                    lda TileElementsMSB,x
                    sta ZP.TileElementVector + 1


                    // copy whole data
                    ldx #$00
                    ldy #$00
        !loop:      lda (ZP.TileElementVector),y
                    sta TileData,x
                    inx
                    iny
                    cpx #$3c
                    bne !loop-
                    rts
    }

    TileElementsLSB:   .byte <Empty,<Grey1,<Grey2,<Grey3,<Grey4,<Green1,<Green2,<Green3,<Green4
                       .byte <Brown1,<Brown2,<Brown3,<Brown4,<Brown5
                       .byte <Blue1,<Blue2,<Blue3,<Blue4,<Blue5
                       .byte <Red1,<Red2,<Red3,<Red4
                       .byte <LightBlue1,<LightBlue2,<LightBlue3,<LightBlue4
                       .byte <Bordered1,<Bordered2,<Bordered3,<Bordered4
                       .byte <Fade1,<Fade2,<Fade3,<Fade4,<Fade5,<Fade6
                       .byte <Background1, <Background2,<BackgroundSolo 
                       .byte <Empty,<Empty,<Empty,<Empty
                       .byte <Empty,<Empty,<Empty,<Empty
                       .byte <Down,<Up,<Left,<Right
                       .byte <Empty,<Empty,<Empty,<Empty
                       .byte <Empty,<Empty,<Empty,<Empty
                       .byte <Empty,<Empty,<Empty,<Empty
                       .byte <LeftDown,<LeftUp,<RightUp,<RightDown
                       .byte <TopLeft, <TopRight, <BottomRight, <BottomLeft
                       .byte <Empty,<Empty,<Empty,<Empty
                       .byte <Empty,<Empty,<Empty,<Empty
                       .byte <Goal

    TileElementsMSB:   .byte >Empty,>Grey1,>Grey2,>Grey3,>Grey4,>Green1,>Green2,>Green3,>Green4
                       .byte >Brown1,>Brown2,>Brown3,>Brown4,>Brown5
                       .byte >Blue1,>Blue2,>Blue3,>Blue4,>Blue5
                       .byte >Red1,>Red2,>Red3,>Red4
                       .byte >LightBlue1,>LightBlue2,>LightBlue3,>LightBlue4
                       .byte >Bordered1,>Bordered2,>Bordered3,>Bordered4
                       .byte >Fade1,>Fade2,>Fade3,>Fade4,>Fade5,>Fade6
                       .byte >Background1, >Background2,>BackgroundSolo 
                       .byte >Empty,>Empty,>Empty,>Empty
                       .byte >Empty,>Empty,>Empty,>Empty                       
                       .byte >Down,>Up,>Left,>Right
                       .byte >Empty,>Empty,>Empty,>Empty
                       .byte >Empty,>Empty,>Empty,>Empty
                       .byte >Empty,>Empty,>Empty,>Empty
                       .byte >LeftDown,>LeftUp,>RightUp,>RightDown
                       .byte >TopLeft, >TopRight, >BottomRight, >BottomLeft
                       .byte >Empty,>Empty,>Empty,>Empty
                       .byte >Empty,>Empty,>Empty,>Empty
                       .byte >Goal

    Empty:           .fill $3c, 0   // empty space

    Grey1:          .byte 255,105,103,231,105,230,219,101
                    .byte 255,119,251,238,250,254,127,222
                    .byte 251,234,162,130,34,128,162,128
                    .byte 215,223,215,223,255,223,255,170
                    .byte 255,238,187,234,170,168,251,32
                    .byte 160,226,160,128,32,128,2,0
                    .byte 207
                    .byte 192
                    .byte 16
                    .byte 192
                    .byte 16
                    .byte 176
                    .byte 11
                    .byte 11
                    .byte 11
                    .byte 11
                    .byte 11
                    .byte 11

    Grey2:          .byte 255,105,103,231,105,230,219,101
                    .byte 255,127,251,238,250,254,127,222
                    .byte 254,250,162,130,34,128,162,128
                    .byte 215,223,215,223,255,223,238,170
                    .byte 255,238,187,234,170,168,128,32
                    .byte 160,226,160,128,32,128,2,0
                    .byte 247
                    .byte 251
                    .byte 27
                    .byte 251
                    .byte 27
                    .byte 187
                    .byte 12
                    .byte 12
                    .byte 12
                    .byte 12
                    .byte 12
                    .byte 12

    Grey3:          .byte 255,105,103,231,105,230,219,101
                    .byte 255,127,251,238,250,254,127,222
                    .byte 254,250,166,150,102,149,166,165
                    .byte 215,223,215,223,255,223,234,170
                    .byte 255,238,187,234,170,169,149,101
                    .byte 165,230,165,149,101,150,85,85
                    .byte 113
                    .byte 124
                    .byte 188
                    .byte 124
                    .byte 188
                    .byte 188
                    .byte 15
                    .byte 15
                    .byte 15
                    .byte 15
                    .byte 15
                    .byte 15

    Grey4:          .byte 255,105,103,231,105,230,219,101
                    .byte 255,127,251,238,250,254,127,222
                    .byte 254,250,166,150,102,149,166,165
                    .byte 215,223,215,223,255,223,234,170
                    .byte 255,238,187,234,170,169,149,101
                    .byte 165,230,165,149,101,150,85,85
                    .byte 17
                    .byte 31
                    .byte 207
                    .byte 31
                    .byte 207
                    .byte 207
                    .byte 7
                    .byte 7
                    .byte 7
                    .byte 7
                    .byte 7
                    .byte 7

    Green1:         .byte 255,105,103,231,105,230,219,101
                    .byte 255,119,251,238,250,254,127,222
                    .byte 251,234,162,130,34,128,162,128
                    .byte 215,223,215,223,255,223,255,170
                    .byte 255,238,187,234,170,168,251,32
                    .byte 160,226,160,128,32,128,2,0
                    .byte 83
                    .byte 80
                    .byte 16
                    .byte 80
                    .byte 16
                    .byte 176
                    .byte 11
                    .byte 11
                    .byte 11
                    .byte 11
                    .byte 11
                    .byte 11

    Green2:         .byte 255,105,103,231,105,230,219,101
                    .byte 255,127,251,238,250,254,127,222
                    .byte 254,250,162,130,34,128,162,128
                    .byte 215,223,215,223,255,223,234,170
                    .byte 255,238,187,234,170,168,128,32
                    .byte 160,226,160,128,32,129,0,0
                    .byte 61
                    .byte 59
                    .byte 27
                    .byte 59
                    .byte 27
                    .byte 187
                    .byte 5
                    .byte 5
                    .byte 5
                    .byte 5
                    .byte 5
                    .byte 5

    Green3:         .byte 255,105,103,231,105,230,219,101
                    .byte 255,127,251,238,250,254,127,222
                    .byte 254,250,166,150,102,149,166,165
                    .byte 215,223,215,223,255,223,234,170
                    .byte 255,238,187,234,170,169,149,101
                    .byte 165,230,165,165,101,150,85,85
                    .byte 209
                    .byte 213
                    .byte 181
                    .byte 213
                    .byte 181
                    .byte 181
                    .byte 3
                    .byte 3
                    .byte 3
                    .byte 3
                    .byte 3
                    .byte 3

    Green4:         .byte 255,105,103,231,105,230,219,101
                    .byte 255,127,251,238,250,254,127,222
                    .byte 254,250,166,150,102,149,166,165
                    .byte 215,223,215,223,255,223,234,170
                    .byte 255,238,187,234,170,169,149,101
                    .byte 165,230,165,165,101,150,85,85
                    .byte 17
                    .byte 19
                    .byte 83
                    .byte 19
                    .byte 83
                    .byte 83
                    .byte 13
                    .byte 13
                    .byte 13
                    .byte 13
                    .byte 13
                    .byte 13
    
    Brown1:         .byte 255,105,103,231,105,230,219,101
                    .byte 255,119,251,238,250,254,127,222
                    .byte 251,234,162,130,34,128,162,128
                    .byte 215,223,215,223,255,223,255,170
                    .byte 255,238,187,234,170,168,251,32
                    .byte 160,226,160,128,32,128,2,0
                    .byte 138
                    .byte 128
                    .byte 16
                    .byte 128
                    .byte 16
                    .byte 176
                    .byte 9
                    .byte 9
                    .byte 9
                    .byte 9
                    .byte 9
                    .byte 9

    Brown2:         .byte 255,105,103,231,105,230,219,101
                    .byte 255,127,251,238,250,254,127,222
                    .byte 254,250,162,130,34,128,162,128
                    .byte 215,223,215,223,255,223,238,170
                    .byte 255,238,187,234,170,168,128,32
                    .byte 160,226,160,128,32,128,2,0
                    .byte 175
                    .byte 169
                    .byte 25
                    .byte 169
                    .byte 25
                    .byte 185
                    .byte 8
                    .byte 8
                    .byte 8
                    .byte 8
                    .byte 8
                    .byte 8

    Brown3:         .byte 255,105,103,231,105,230,219,101
                    .byte 255,127,251,238,250,254,127,222
                    .byte 254,250,166,150,102,149,166,165
                    .byte 215,223,215,223,255,223,234,170
                    .byte 255,238,187,234,170,169,149,101
                    .byte 165,230,165,149,101,150,85,85
                    .byte 247
                    .byte 248
                    .byte 152
                    .byte 248
                    .byte 152
                    .byte 152
                    .byte 10
                    .byte 10
                    .byte 10
                    .byte 10
                    .byte 10
                    .byte 10

    Brown4:         .byte 255,105,103,231,105,230,219,101
                    .byte 255,127,251,238,250,254,127,222
                    .byte 254,250,166,150,102,149,166,165
                    .byte 215,223,215,223,255,223,234,170
                    .byte 255,238,187,234,170,169,149,101
                    .byte 165,230,165,149,101,150,85,85
                    .byte 113
                    .byte 122
                    .byte 138
                    .byte 122
                    .byte 138
                    .byte 138
                    .byte 15
                    .byte 15
                    .byte 15
                    .byte 15
                    .byte 15
                    .byte 15

    Brown5:         .byte 255,105,103,231,105,230,219,101
                    .byte 255,127,251,238,250,254,127,222
                    .byte 254,250,166,150,102,149,166,165
                    .byte 215,223,215,223,255,223,234,170
                    .byte 255,238,187,234,170,169,149,101
                    .byte 165,230,165,149,101,150,85,85
                    .byte 17
                    .byte 31
                    .byte 175
                    .byte 31
                    .byte 175
                    .byte 175
                    .byte 7
                    .byte 7
                    .byte 7
                    .byte 7
                    .byte 7
                    .byte 7

    Blue1:          .byte 255,105,103,231,105,230,219,101
                    .byte 255,119,251,238,250,254,127,222
                    .byte 251,234,162,130,34,128,162,128
                    .byte 215,223,215,223,255,223,255,170
                    .byte 255,238,187,234,170,168,251,32
                    .byte 160,226,160,128,32,128,2,0
                    .byte 78
                    .byte 64
                    .byte 16
                    .byte 64
                    .byte 16
                    .byte 176
                    .byte 6
                    .byte 6
                    .byte 6
                    .byte 6
                    .byte 6
                    .byte 6

    Blue2:          .byte 255,105,103,231,105,230,219,101
                    .byte 255,127,251,238,250,254,127,222
                    .byte 254,250,162,130,34,128,162,128
                    .byte 215,223,215,223,255,223,238,170
                    .byte 255,238,187,234,170,168,128,32
                    .byte 160,226,160,128,32,128,2,0
                    .byte 227
                    .byte 230
                    .byte 22
                    .byte 230
                    .byte 22
                    .byte 182
                    .byte 4
                    .byte 4
                    .byte 4
                    .byte 4
                    .byte 4
                    .byte 4

    Blue3:          .byte 255,105,103,231,105,230,219,101
                    .byte 255,127,251,238,250,254,127,222
                    .byte 254,250,166,150,102,149,166,165
                    .byte 215,223,215,223,255,223,234,170
                    .byte 255,238,187,234,170,169,149,101
                    .byte 165,230,165,149,101,150,85,85
                    .byte 61
                    .byte 52
                    .byte 100
                    .byte 52
                    .byte 100
                    .byte 100
                    .byte 14
                    .byte 14
                    .byte 14
                    .byte 14
                    .byte 14
                    .byte 14

    Blue4:          .byte 255,105,103,231,105,230,219,101
                    .byte 255,127,251,238,250,254,127,222
                    .byte 254,250,166,150,102,149,166,165
                    .byte 215,223,215,223,255,223,234,170
                    .byte 255,238,187,234,170,169,149,101
                    .byte 165,230,165,149,101,150,85,85
                    .byte 209
                    .byte 222
                    .byte 78
                    .byte 222
                    .byte 78
                    .byte 78
                    .byte 3
                    .byte 3
                    .byte 3
                    .byte 3
                    .byte 3
                    .byte 3

    Blue5:          .byte 255,105,103,231,105,230,219,101
                    .byte 255,127,251,238,250,254,127,222
                    .byte 254,250,166,150,102,149,166,165
                    .byte 215,223,215,223,255,223,234,170
                    .byte 255,238,187,234,170,169,149,101
                    .byte 165,230,165,149,101,150,85,85
                    .byte 17
                    .byte 19
                    .byte 227
                    .byte 19
                    .byte 227
                    .byte 227
                    .byte 13
                    .byte 13
                    .byte 13
                    .byte 13
                    .byte 13
                    .byte 13

    Red1:           .byte 255,105,103,231,105,230,219,101
                    .byte 255,119,251,238,250,254,127,222
                    .byte 251,234,162,130,34,128,162,128
                    .byte 215,223,215,223,255,223,255,170
                    .byte 255,238,187,234,170,168,251,32
                    .byte 160,226,160,128,32,128,2,0
                    .byte 175
                    .byte 160
                    .byte 16
                    .byte 160
                    .byte 16
                    .byte 176
                    .byte 2
                    .byte 2
                    .byte 2
                    .byte 2
                    .byte 2
                    .byte 2

    Red2:           .byte 255,105,103,231,105,230,219,101
                    .byte 255,127,251,238,250,254,127,222
                    .byte 254,250,162,130,34,128,162,128
                    .byte 215,223,215,223,255,223,238,170
                    .byte 255,238,187,234,170,168,128,32
                    .byte 160,226,160,128,32,128,2,0
                    .byte 247
                    .byte 242
                    .byte 18
                    .byte 242
                    .byte 18
                    .byte 178
                    .byte 10
                    .byte 10
                    .byte 10
                    .byte 10
                    .byte 10
                    .byte 10

    Red3:           .byte 255,105,103,231,105,230,219,101
                    .byte 255,127,251,238,250,254,127,222
                    .byte 254,250,170,150,102,149,166,149
                    .byte 215,223,215,223,255,223,238,170
                    .byte 255,238,187,234,170,169,149,101
                    .byte 165,230,165,149,101,148,86,85
                    .byte 113
                    .byte 122
                    .byte 42
                    .byte 122
                    .byte 42
                    .byte 42
                    .byte 15
                    .byte 15
                    .byte 15
                    .byte 15
                    .byte 15
                    .byte 15

    Red4:           .byte 255,105,103,231,105,230,219,101
                    .byte 255,127,251,238,250,254,127,222
                    .byte 254,250,166,150,102,149,166,165
                    .byte 215,223,215,223,255,223,234,170
                    .byte 255,238,187,234,170,169,149,101
                    .byte 165,230,165,149,101,150,85,85
                    .byte 17
                    .byte 31
                    .byte 175
                    .byte 31
                    .byte 175
                    .byte 175
                    .byte 7
                    .byte 7
                    .byte 7
                    .byte 7
                    .byte 7
                    .byte 7

    LightBlue1:     .byte 255,105,103,231,105,230,219,101
                    .byte 255,119,251,238,250,254,127,222
                    .byte 251,234,162,130,34,128,162,128
                    .byte 215,223,215,223,255,223,255,170
                    .byte 255,238,187,234,170,168,251,32
                    .byte 160,226,160,128,32,128,2,0
                    .byte 227
                    .byte 224
                    .byte 16
                    .byte 224
                    .byte 16
                    .byte 176
                    .byte 6
                    .byte 6
                    .byte 6
                    .byte 6
                    .byte 6
                    .byte 6

    LightBlue2:     .byte 255,105,103,231,105,230,219,101
                    .byte 255,127,251,238,250,254,127,222
                    .byte 254,250,162,130,34,128,162,128
                    .byte 215,223,215,223,255,223,238,170
                    .byte 255,238,187,234,170,168,128,32
                    .byte 160,226,160,128,32,128,2,0
                    .byte 61
                    .byte 54
                    .byte 22
                    .byte 54
                    .byte 22
                    .byte 182
                    .byte 14
                    .byte 14
                    .byte 14
                    .byte 14
                    .byte 14
                    .byte 14

    LightBlue3:     .byte 255,105,103,231,105,230,219,101
                    .byte 255,127,251,238,250,254,127,222
                    .byte 254,250,166,150,102,149,166,165
                    .byte 215,223,215,223,255,223,234,170
                    .byte 255,238,187,234,170,169,149,102
                    .byte 165,230,165,165,100,149,84,85
                    .byte 209
                    .byte 222
                    .byte 110
                    .byte 222
                    .byte 110
                    .byte 110
                    .byte 3
                    .byte 3
                    .byte 3
                    .byte 3
                    .byte 3
                    .byte 3

    LightBlue4:     .byte 255,105,103,231,105,230,219,101
                    .byte 255,127,251,238,250,254,127,222
                    .byte 254,250,166,150,102,149,166,165
                    .byte 215,223,215,223,255,223,234,170
                    .byte 255,238,187,234,170,169,149,102
                    .byte 165,230,165,165,100,149,84,85
                    .byte 209
                    .byte 222
                    .byte 110
                    .byte 222
                    .byte 110
                    .byte 110
                    .byte 3
                    .byte 3
                    .byte 3
                    .byte 3
                    .byte 3
                    .byte 3

    Bordered1:      .byte 254,192,207,206,139,206,138,202
                    .byte 160,0,170,170,162,136,34,128
                    .byte 0,0,0,128,0,0,0,0
                    .byte 138,136,138,8,136,0,0,0
                    .byte 0,0,0,0,0,0,0,0
                    .byte 0,0,0,0,0,0,0,0
                    .byte 59
                    .byte 187
                    .byte 187
                    .byte 187
                    .byte 187
                    .byte 187
                    .byte 12
                    .byte 11
                    .byte 11
                    .byte 11
                    .byte 11
                    .byte 3

    Bordered2:      .byte 254,192,207,206,139,206,138,202
                    .byte 175,0,170,186,174,187,238,191
                    .byte 16,0,192,176,240,192,240,192
                    .byte 138,139,138,203,139,205,192,204
                    .byte 243,252,243,204,96,136,0,0
                    .byte 0,0,0,0,0,0,0,0
                    .byte 60
                    .byte 188
                    .byte 188
                    .byte 188
                    .byte 187
                    .byte 187
                    .byte 15
                    .byte 11
                    .byte 11
                    .byte 11
                    .byte 11
                    .byte 3

    Bordered3:      .byte 254,192,207,206,139,206,138,202
                    .byte 175,0,170,170,174,187,238,191
                    .byte 212,0,208,176,240,208,240,208
                    .byte 138,139,138,203,139,207,192,221
                    .byte 251,254,251,238,234,170,0,162
                    .byte 160,160,128,32,128,0,0,0
                    .byte 63
                    .byte 191
                    .byte 191
                    .byte 191
                    .byte 187
                    .byte 187
                    .byte 13
                    .byte 12
                    .byte 12
                    .byte 12
                    .byte 12
                    .byte 3

    Bordered4:      .byte 254,192,207,206,139,206,138,202
                    .byte 175,0,170,170,170,187,238,191
                    .byte 212,0,208,176,240,208,240,208
                    .byte 138,139,138,203,139,207,192,221
                    .byte 251,254,251,238,234,170,0,166
                    .byte 160,160,144,96,144,80,0,81
                    .byte 61
                    .byte 189
                    .byte 205
                    .byte 205
                    .byte 188
                    .byte 188
                    .byte 1
                    .byte 3
                    .byte 3
                    .byte 3
                    .byte 3
                    .byte 3

    Fade1:          .byte 0,0,0,0,0,0,0,0
                    .byte 0,0,0,0,0,0,0,0
                    .byte 0,0,0,0,0,32,136,32
                    .byte 0,34,8,42,138,42,170,0
                    .byte 8,34,136,42,138,42,170,0
                    .byte 8,32,168,32,168,168,168,0
                    .byte 188
                    .byte 188
                    .byte 102
                    .byte 102
                    .byte 102
                    .byte 102
                    .byte 15
                    .byte 15
                    .byte 4
                    .byte 4
                    .byte 4
                    .byte 4

    Fade2:          .byte 0,16,4,17,68,21,85,85
                    .byte 0,1,64,1,4,17,69,85
                    .byte 0,0,68,16,84,100,153,100
                    .byte 85,102,89,106,154,106,170,85
                    .byte 89,102,153,106,154,106,170,85
                    .byte 89,100,169,100,169,169,169,85
                    .byte 107
                    .byte 107
                    .byte 100
                    .byte 100
                    .byte 100
                    .byte 100
                    .byte 4
                    .byte 4
                    .byte 4
                    .byte 4
                    .byte 4
                    .byte 4

    Fade3:          .byte 255,223,255,221,119,213,85,85
                    .byte 255,253,127,253,119,221,117,85
                    .byte 255,255,119,223,87,103,153,103
                    .byte 89,102,89,106,154,106,170,85
                    .byte 89,102,153,106,154,106,170,85
                    .byte 89,103,169,103,169,169,169,85
                    .byte 75
                    .byte 75
                    .byte 78
                    .byte 78
                    .byte 78
                    .byte 78
                    .byte 6
                    .byte 6
                    .byte 6
                    .byte 12
                    .byte 12
                    .byte 6

    Fade4:          .byte 255,223,255,221,119,213,85,85
                    .byte 255,253,127,253,119,221,117,85
                    .byte 255,255,119,223,87,103,153,103
                    .byte 89,102,89,106,154,106,170,85
                    .byte 89,102,153,106,154,106,170,85
                    .byte 89,103,169,103,169,169,169,85
                    .byte 235
                    .byte 235
                    .byte 227
                    .byte 227
                    .byte 227
                    .byte 227
                    .byte 4
                    .byte 4
                    .byte 4
                    .byte 12
                    .byte 12
                    .byte 4
   
    Fade5:          .byte 255,223,255,221,119,213,85,85
                    .byte 255,253,127,253,119,221,117,85
                    .byte 255,255,119,223,87,103,153,103
                    .byte 89,102,89,106,154,106,170,85
                    .byte 89,102,153,106,154,106,170,85
                    .byte 89,103,169,103,169,169,169,85
                    .byte 59
                    .byte 59
                    .byte 61
                    .byte 61
                    .byte 61
                    .byte 61
                    .byte 14
                    .byte 14
                    .byte 14
                    .byte 12
                    .byte 12
                    .byte 14

    Fade6:          .byte 255,223,255,221,119,213,85,85
                    .byte 255,253,127,253,119,221,117,85
                    .byte 255,255,119,223,87,103,153,103
                    .byte 89,102,89,106,154,106,170,85
                    .byte 89,102,153,106,154,106,170,85
                    .byte 89,103,169,103,169,169,169,85
                    .byte 219
                    .byte 219
                    .byte 209
                    .byte 209
                    .byte 209
                    .byte 209
                    .byte 3
                    .byte 3
                    .byte 3
                    .byte 12
                    .byte 12
                    .byte 3

    Background1:    .byte 0,165,149,84,145,68,80,64
                    .byte 0,148,80,0,0,68,16,0
                    .byte 0,65,0,0,0,0,0,0
                    .byte 68,64,0,64,0,64,0,0
                    .byte 0,0,0,0,0,0,0,0
                    .byte 0,0,0,0,0,0,0,0
                    .byte 100
                    .byte 100
                    .byte 100
                    .byte 100
                    .byte 100
                    .byte 188
                    .byte 15
                    .byte 15
                    .byte 15
                    .byte 15
                    .byte 15
                    .byte 15

    Background2:    .byte 0,126,117,105,101,89,101,85
                    .byte 0,100,85,16,68,17,68,0
                    .byte 0,68,80,0,0,0,0,0
                    .byte 84,85,16,84,16,4,16,0
                    .byte 64,16,64,16,4,0,0,0
                    .byte 0,0,0,0,0,0,0,0
                    .byte 100
                    .byte 100
                    .byte 100
                    .byte 100
                    .byte 100
                    .byte 188
                    .byte 14
                    .byte 15
                    .byte 15
                    .byte 15
                    .byte 15
                    .byte 15

    
    BackgroundSolo: .byte 0,153,84,145,68,80,68,65
                    .byte 0,16,0,0,0,0,0,16
                    .byte 0,68,0,0,0,4,0,0
                    .byte 0,64,0,64,0,0,4,0
                    .byte 4,0,4,1,0,0,68,0
                    .byte 4,4,68,24,4,24,84,0
                    .byte 100
                    .byte 100
                    .byte 108
                    .byte 108
                    .byte 108
                    .byte 100
                    .byte 15
                    .byte 15
                    .byte 15
                    .byte 15
                    .byte 15
                    .byte 15


    Down:           .byte 255,105,103,231,105,230,219,101
                    .byte 255,127,251,194,194,194,67,194
                    .byte 254,250,166,150,102,149,166,165
                    .byte 215,220,214,223,255,222,234,170
                    .byte 194,0,0,130,170,233,149,102
                    .byte 165,38,165,165,101,150,85,85
                    .byte 113,124,188
                    .byte 124,188,188
                    .byte 15,15,15
                    .byte 15,15,15

    Up:             .byte 255,105,103,231,105,231,216,101
                    .byte 255,127,251,234,194,0,0,194
                    .byte 254,250,166,150,102,149,38,165
                    .byte 215,223,215,223,255,223,234,170
                    .byte 195,194,131,194,130,169,149,102
                    .byte 165,230,165,165,101,150,85,85
                    .byte 113,124,188
                    .byte 124,188,188
                    .byte 15,15,15
                    .byte 15,15,15

    Left:           .byte 255,105,101,231,105,229,212,80
                    .byte 255,119,251,126,74,14,15,0
                    .byte 254,250,166,150,102,149,166,5
                    .byte 208,220,215,223,255,223,234,170
                    .byte 0,14,11,142,154,169,149,102
                    .byte 5,166,165,165,101,150,85,85
                    .byte 113,124,188
                    .byte 124,188,188
                    .byte 15,15,15
                    .byte 15,15,15


    Right:          .byte 255,105,101,231,105,229,215,80
                    .byte 255,127,251,110,242,240,112,0
                    .byte 254,250,166,150,102,149,38,5
                    .byte 208,223,215,223,255,223,234,170
                    .byte 0,224,176,226,170,169,149,102
                    .byte 5,38,165,165,101,150,85,85
                    .byte 113,124,188
                    .byte 124,188,188
                    .byte 15,15,15
                    .byte 15,15,15

    LeftDown:       .byte 255,105,103,236,108,230,219,101
                    .byte 255,127,251,0,0,252,124,220
                    .byte 254,250,166,150,38,21,38,37
                    .byte 215,223,215,223,255,223,234,170
                    .byte 252,236,128,224,168,169,149,101
                    .byte 37,38,1,5,25,102,85,85
                    .byte 113,124,188
                    .byte 124,188,188
                    .byte 15,15,15
                    .byte 15,15,15

    LeftUp:         .byte 255,105,103,231,105,230,219,101
                    .byte 255,255,122,232,224,192,252,236
                    .byte 254,250,102,22,6,1,38,37
                    .byte 215,223,215,208,240,223,234,170
                    .byte 252,236,184,0,0,169,149,102
                    .byte 21,38,21,37,85,150,85,85
                    .byte 113,124,188
                    .byte 124,188,188
                    .byte 15,15,15
                    .byte 15,15,15

    RightUp:        .byte 255,105,103,228,96,192,216,100
                    .byte 255,127,251,46,10,2,63,30
                    .byte 254,250,166,150,102,149,166,165
                    .byte 212,220,212,220,254,223,234,170
                    .byte 63,46,59,0,0,169,149,102
                    .byte 165,230,165,37,37,150,85,85
                    .byte 113,124,188
                    .byte 124,188,188
                    .byte 15,15,15
                    .byte 15,15,15

    RightDown:      .byte 255,105,103,231,104,228,216,100
                    .byte 255,127,251,0,0,62,63,62
                    .byte 254,250,166,22,38,149,166,165
                    .byte 212,220,192,240,252,223,234,170
                    .byte 63,46,3,10,42,169,149,102
                    .byte 165,230,165,165,101,150,85,85
                    .byte 113,124,188
                    .byte 124,188,188
                    .byte 15,15,15
                    .byte 15,15,15

    TopLeft:        .byte 255,105,103,231,105,230,219,101
                    .byte 255,127,251,238,250,254,127,222
                    .byte 254,250,166,6,70,5,6,5
                    .byte 215,220,208,192,240,220,234,170
                    .byte 63,46,0,0,42,41,21,102
                    .byte 5,6,5,21,101,150,85,85
                    .byte 113,124,188
                    .byte 124,188,188
                    .byte 15,15,15
                    .byte 15,15,15

    TopRight:       .byte 255,105,103,224,96,224,208,96
                    .byte 255,127,251,238,250,254,127,222
                    .byte 254,250,166,150,102,149,166,165
                    .byte 208,208,208,220,255,223,234,170
                    .byte 252,236,0,0,168,168,148,102
                    .byte 102,25,6,1,5,22,85,85
                    .byte 113,124,188
                    .byte 124,188,188
                    .byte 15,15,15
                    .byte 15,15,15

    BottomRight:    .byte 255,105,103,231,108,224,208,96
                    .byte 255,126,248,236,0,0,252,220
                    .byte 254,250,166,22,6,1,6,21
                    .byte 208,208,208,208,255,223,234,170
                    .byte 252,237,187,234,170,169,149,102
                    .byte 117,230,165,165,101,150,85,85
                    .byte 113,124,188
                    .byte 124,188,188
                    .byte 15,15,15
                    .byte 15,15,15

    BottomLeft:     .byte 255,105,103,236,80,192,240,100
                    .byte 255,127,59,46,0,0,59,30
                    .byte 254,250,166,150,22,5,6,5
                    .byte 215,223,215,223,255,223,234,170
                    .byte 63,110,187,234,170,169,149,102
                    .byte 5,6,5,21,5,150,85,85
                    .byte 113,124,188
                    .byte 124,188,188
                    .byte 15,15,15
                    .byte 15,15,15                    

    Goal:           .byte 255,105,101,231,105,229,219,101
                    .byte 255,119,251,126,250,130,0,0
                    .byte 254,250,166,150,102,149,166,165
                    .byte 215,223,215,223,255,223,234,170
                    .byte 0,0,65,234,170,169,149,102
                    .byte 165,230,165,165,101,150,85,85
                    .byte 113,124,188
                    .byte 124,188,188
                    .byte 15,15,15
                    .byte 15,15,15

/* Template Tile Data Structure

    Name:           .byte
                    .byte
                    .byte

                    .byte
                    .byte
                    .byte

                    .byte
                    .byte

                    .byte
                    .byte
*/

    TileData:       .fill $3c, 0   // initially, the tile area is empty ...

}