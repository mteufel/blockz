SPRITES: {


    Initialize: {

                lda #$00
                sta $d017       // Sprite Double Height off
                sta $d01d       // Sprite Double Width off

                lda #%00000000
                sta $d01c       // turn all Sprites into HI-RES 

                lda #%00000000
                sta $d01b       // place all sprites in front of the background

                lda #$01
                sta $d027       // color sprite 0 white


                lda #$00                 
                sta $d010        // ???

                ldx #$20                     
                stx $d000        // sprite 0 X-pos

                ldy #$80                     
                sty $d001        // sprite 0 Y-pos        

                lda #%00000001
                sta $d015       // turn on sprite 

                lda #$44
                sta $83f8
                
                rts
    }

    Make: {

    }

    *=$9100 "Sprite Data"

    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
}