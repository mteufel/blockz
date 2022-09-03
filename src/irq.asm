IRQ: {

    Install: {
                sei

                lda $d01a                       // activate VIC-II raster interrupts
                ora #%0000001
                sta $d01a

                lda #<test                  
                sta $fffe
                lda #>test
                sta $ffff 
                
                lda #$00                        // START_BLACK rasterline where interrupt should happen
                sta $d012                  
               
                lda $d011                       // ??
                and #%01111111
                sta $d011

                cli
                rts
            
    }

    test: {
                pha                             
                txa
                pha
                tya
                pha        

                lda $d019
                bmi do                         // check highes bit, if set, the source is rasterlineinterrupt fired from the VIC-II
                jmp rasterIrqExit
        do:     sta $d019                      // confirm irq
                
                lda $d012
                bne exit


                inc $d020
                ldx #$0d
                lda #$54
                jsr LEVEL.RecolorTile
                //:delay(255,50)                                                                                
        /*        ldx #$0d
                lda #$52
                jsr LEVEL.RecolorTile
                //:delay(255,75)                                                                                
                ldx #$0d
                lda #$53
                jsr LEVEL.RecolorTile
                //:delay(255,75)                                                                                
                ldx #$0d
                lda #$54
                jsr LEVEL.RecolorTile
                //:delay(255,255)                                                                                
                ldx #$0d
                lda #$53
                jsr LEVEL.RecolorTile
                //:delay(255,75)                                                                                
                ldx #$0d
                lda #$52
                jsr LEVEL.RecolorTile                                                                                
                //:delay(255,75)                                                                                
                ldx #$0d
                lda #$51
                jsr LEVEL.RecolorTile
                */
                dec $d020
                //:delay(255,50)  
        exit:   jmp rasterIrqExit   
    }


    rasterIrq: {
                pha                            //
                txa
                pha
                tya
                pha

                lda $d019
                bmi do                         // check highes bit, if set, the source is rasterlineinterrupt fired from the VIC-II
                jmp rasterIrqExit
        do:     sta $d019                      // confirm irq
                
                lda $d012
                bne doRed
                lda #$00
                sta $d020
                sta $d021
                lda #$70                       // START_RED
                sta $d012
                jmp rasterIrqExit

    }

    doRed: {
                cmp #$70
                bne doGold
                lda #$02
                sta $d020
                sta $d021
                lda #$d0                        // START_GOLD
                sta $d012
                jmp rasterIrqExit
    }

    doGold: {
                lda #$07
                sta $d020
                sta $d021
                lda #$00                        // START_BLACK
                sta $d012
                jmp rasterIrqExit
    }

    rasterIrqExit: {
                pla 
                tay
                pla 
                tax
                pla
                rti
    }

}