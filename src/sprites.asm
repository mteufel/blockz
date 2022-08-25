SPRITES: {


    Initialize: {

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

                ldx #$20                     
                stx $d00e        // sprite 7 X-pos
                stx $d00c        // sprite 6 X-pos
                stx $d00a        // sprite 5 X-pos


                ldy #$45                     
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
                dec $d00e
                dec $d00c
                dec $d00a
                rts
    }

    MovePointerRight: {
                inc $d00e
                inc $d00c
                inc $d00a
                rts
    }

    MovePointerDown: {
                inc $d00f
                inc $d00d
                inc $d00b
                rts

    }

    MovePointerUp: {
                dec $d00f
                dec $d00d
                dec $d00b
                rts

    }



    Make: {

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