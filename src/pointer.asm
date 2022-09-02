POINTER: {

    PointerHighByteFlag:        .byte $00
    PointerIsAt:                .byte $00     // this pointer gets updated everytime when the sprite pointer
                                              // arrives at another tile (block) on the screen, rememeber, the layout is
                                              //      
                                              //         0   1   2   3   4   5   6   7   8   9   A   B
                                              //     +----------------------------------------------------
                                              //   0 |  00  01  02  03  04  05  06  07  08  09  0A  0B 
                                              //   1 |  0C  0D  0E  0F  10  11  12  13  14  15  16  17    
                                              //   2 |  18  19  1A  1B  1C  1D  1E  1F  20  21  22  23
                                              //   3 |  24  25  26  27  28  29  2A  2B  2C  2D  2E  2F
                                              //   4 |  30  31  32  33  34  35  36  37  38  39  3A  3B
                                              //   5 |  3C  3D  3E  3F  40  41  42  43  44  45  46  47
                                              //   6 |  48  49  4A  4B  4C  4D  4E  4F  50  51  52  52
                                              //   7 |  53  54  55  56  57  59  5A  5B  5C  5D  5E  5F
                                              //   8 |  60  61  62  63  64  65  66  67  68  69  6A  6B
                                              //   9 |  6C  6D  6E  6F  70  71  72  73  74  75  76  77 

    MOVED_RIGHT:                .byte $00
    MOVED_LEFT:                 .byte $01
    MOVED_UP:                   .byte $10
    MOVED_DOWN:                 .byte $11

    InitializePointer: {

                lda #$00
                sta $d017       // Sprite Double Height off
                sta $d01d       // Sprite Double Width off

                lda #%00000000
                sta $d01c       // turn all 8 Sprites into HI-RES 

                lda #%00000000
                sta $d01b       // place all 8 sprites in front of the background

                lda #LIGHT_RED
                sta $d02e       // color sprite 7 (body)
                lda #WHITE
                sta $d02d       // color sprite 6 (shadow top)
                lda #BLACK
                sta $d02c       // color sprite 5 (shadow bottom)

                lda #%00000000               
                sta $d010        // alle sprites are not outside x/y > $ff

                //ldx #$aa         // initially we position the mouse pointer to the middle of the screen              
                ldx #$18
                stx $d00e        // sprite 7 X-pos
                stx $d00c        // sprite 6 X-pos
                stx $d00a        // sprite 5 X-pos


                //ldy #$7a         // initially we position the mouse pointer to the middle of the screen                          
                ldy #$32
                sty $d00f        // sprite 7 Y-pos        
                sty $d00d        // sprite 6 Y-pos
                sty $d00b        // sprite 5 Y-pos        

                lda #%11100000
                sta $d015       // turn on sprite 7, 6, 5

                lda #$40        // set data pointers for sprites (remember divisor 64)
                sta $43ff
                lda #$41
                sta $43fe
                lda #$42
                sta $43fd


                rts
    }


    MovePointerLeft: {

                    // If the Highbyte is set and X-Pos = $00
                    //   ==> set Highbyte back to $00
                    //   ==> set X-Pos to $FF

                    // If the Highbyte is NOT set and X-Pos is less then $1d
                    //   we are at the left border and can't go further, so rts

                    lda PointerHighByteFlag       
                    cmp #$01    
                    bne check_min
                    lda $d00e
                    cmp #$01
                    bne check_min
                    // reset Highbyte, set X-Pos to $00 and rts
                    dec PointerIsAt
                    lda #$00
                    sta PointerHighByteFlag
                    lda $d010                   
                    and #%00000000              
                    sta $d010                   
                    lda #$ff
                    sta $d00e
                    sta $d00c
                    sta $d00a
                    rts

        check_min:  lda PointerHighByteFlag       
                    cmp #$00    
                    bne do
                    lda $d00e
                    cmp #$1d
                    bcs do
                    // Refresh PointerAtTile Position ------------------------------------
                    ldx MOVED_LEFT
                    jsr RefreshPointerIsAt
                    // -------------------------------------------------------------------
                    rts
        do:         dec $d00e
                    dec $d00c
                    dec $d00a
                    // Refresh PointerAtTile Position ------------------------------------
                    ldx MOVED_LEFT
                    jsr RefreshPointerIsAt
                    // -------------------------------------------------------------------
                    rts
    }

    MovePointerRight: {

                    // If the Highbyte is set we are at a X-Position > $FF
                    
                    // If the Hightbye is not set and X-Pos = $FF 
                    //    ==> set Highbyte to $01
                    //    ==> set X-Pos to $00

                    // If the Highbyte is set and X-Pos > $2a 
                    //    we are at the right border and can't go further, so rts
                    lda PointerHighByteFlag       // is the highbyte
                    cmp #$00                      // not set go to check_x...
                    beq check_x
                    jmp check_max
        check_x:    lda $d00e                     // and is the x-pos #$ff
                    cmp #$ff
                    bne check_max
                    inc PointerIsAt
                    lda #$01                      // then set the highbyte
                    sta PointerHighByteFlag
                    lda $d010                     // set the highbyte for all three sprites
                    ora #%11100000                // in its
                    sta $d010                     // vic register
                    lda #$00                      // and set the x-pos to $00
                    sta $d00e
                    sta $d00c
                    sta $d00a
                    rts

         check_max: lda PointerHighByteFlag       // again: check the highbyte
                    cmp #$01                      // if it is
                    bne do                        // not set the pointer can move ...
                    lda $d00e                     // otherwise we check
                    cmp #$2a                      // if the pointer arrived the max x-pos
                    bcc do

                    // Refresh PointerAtTile Position ------------------------------------
                    ldx MOVED_RIGHT
                    jsr RefreshPointerIsAt
                    // -------------------------------------------------------------------
                    rts 

        do:         inc $d00e
                    inc $d00c
                    inc $d00a

                    // Refresh PointerAtTile Position ------------------------------------
                    ldx MOVED_RIGHT
                    jsr RefreshPointerIsAt
                    // -------------------------------------------------------------------
                    rts
    }

    MovePointerDown: {
                    lda $d00f
                    cmp #$c9
                    bcc do
                    // Refresh PointerAtTile Position ------------------------------------
                    ldx MOVED_DOWN
                    jsr RefreshPointerIsAt
                    // -------------------------------------------------------------------
                    rts        
        do:         inc $d00f
                    inc $d00d
                    inc $d00b
                    // Refresh PointerAtTile Position ------------------------------------
                    ldx MOVED_DOWN
                    jsr RefreshPointerIsAt
                    // -------------------------------------------------------------------
                    rts

    }

    MovePointerUp: {
                    lda $d00f
                    cmp #$39
                    bcs do
                    // Refresh PointerAtTile Position ------------------------------------
                    ldx MOVED_UP
                    jsr RefreshPointerIsAt
                    // -------------------------------------------------------------------                    
                    rts
        do:         dec $d00f
                    dec $d00d
                    dec $d00b
                    // Refresh PointerAtTile Position ------------------------------------
                    ldx MOVED_UP
                    jsr RefreshPointerIsAt
                    // -------------------------------------------------------------------                    
                    rts

    }

    RefreshPointerIsAt: {

                    // X holds, in which direction the mouse pointed moved
                    // using the constants:
                    // MOVED_RIGHT, MOVED_LEFT, MOVED_UP, MOVED_DOWN

                    // calculate mod for the x position
                    lda $d00e           // get x-pos 
                    sta ZP.Num1
                    lda #$18
                    sta ZP.Num2       
                    jsr Mod             // Divide by $18 to find out if we're on another new tile (rest=0)
                    cmp #$00
                    bne mod_y
                    jsr RefreshPointerX               

                    // calculate mod for the y position
        mod_y:      lda $d00f           // get the y-pos
                    sta ZP.Num1
                    lda #$10
                    sta ZP.Num2       
                    jsr Mod 
                    cmp #$00
                    bne exit
                    jsr RefreshPointerY

        exit:       rts

    }

    RefreshPointerX: {
                    cpx MOVED_LEFT
                    beq moved_l
                    cpx MOVED_RIGHT
                    beq moved_r
                    rts
        moved_l:    dec PointerIsAt   // Pointer + $01
                    rts
        moved_r:    inc PointerIsAt   // Pointer + $01
                    rts

    }

    RefreshPointerY: {
                    cpx MOVED_UP
                    beq moved_u
                    cpx MOVED_DOWN
                    beq moved_d
                    rts
        moved_d:    clc
                    lda PointerIsAt
                    adc #$0c        
                    sta PointerIsAt   // continue $0b + $01 tiles
                    rts         
        moved_u:    clc
                    lda PointerIsAt
                    sbc #$0b    
                    sta PointerIsAt   // go $0b tiles back
                    rts                    

    }


    * = $5000 "Sprite Data Mouse Body"

    .byte 192,0,0
    .byte 240,0,0
    .byte 124,0,0
    .byte 127,0,0
    .byte 63,192,0
    .byte 63,192,0
    .byte 31,0,0
    .byte 31,128,0
    .byte 13,192,0
    .byte 8,224,0
    .byte 0,96,0
    .byte 0,0,0
    .byte 0,0,0    
    .byte 0,0,0
    .byte 0,0,0
    .byte 0,0,0
    .byte 0,0,0
    .byte 0,0,0
    .byte 0,0,0
    .byte 0,0,0
    .byte 0,0,0
    .byte 0

    * = $5040 "Sprite Data Mouse Shadow Top"

    .byte 64,0,0
    .byte 48,0,0
    .byte 12,0,0
    .byte 3,0,0
    .byte 0,192,0
    .byte 0,0,0
    .byte 1,0,0
    .byte 0,128,0
    .byte 0,64,0
    .byte 0,32,0
    .byte 0,0,0
    .byte 0,0,0
    .byte 0,0,0
    .byte 0,0,0
    .byte 0,0,0
    .byte 0,0,0
    .byte 0,0,0
    .byte 0,0,0
    .byte 0,0,0
    .byte 0,0,0
    .byte 0

    * = $5080 "Sprite Data Mouse Shadow Bottom"

    .byte 0,0,0
    .byte 128,0,0
    .byte 64,0,0
    .byte 64,0,0
    .byte 32,0,0
    .byte 33,0,0
    .byte 16,0,0
    .byte 18,0,0
    .byte 9,0,0
    .byte 8,128,0
    .byte 0,64,0
    .byte 0,0,0
    .byte 0,0,0
    .byte 0,0,0
    .byte 0,0,0
    .byte 0,0,0
    .byte 0,0,0
    .byte 0,0,0
    .byte 0,0,0
    .byte 0,0,0
    .byte 0

}