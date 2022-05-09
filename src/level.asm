LEVEL: {


    Data: {
        Initial: .fill 120, $0d
        Display: .fill 120, $01
        Current: .fill 120, $00
    }

    LoadLevel: {
                // load level number in Accumulator

                // if level number is 0 we do not need to calculate the
                // start adresss of the level 
                sta ZP.LevelTemp
                cmp #$00  
                beq set

                // calculate start address of the level
                ldx #$00
                ldy #$00
        !:      inx
                inx
                iny
                cpy ZP.LevelTemp
                bne !-

                // set the level pointer for the level number in acc
        set:    lda LEVELS.LevelPointerData,x
                sta ZP.LevelDataVector + 0 
                inx
                lda LEVELS.LevelPointerData,x 
                sta ZP.LevelDataVector + 1

                // initialize the level by loading it to Data.Initial
                ldy #$00
        !loop:  lda (ZP.LevelDataVector), y
                sta Data.Initial,y
                iny
                cpy #$78
                bne !loop-

                jsr CopyInitialMap


                rts
    }  

   

    CopyInitialMap: {
                ldx #$78
        !:      lda Data.Initial,x
                sta Data.Display,x
                sta Data.Current,x
                dex
                bpl !-
                rts

    }


    DrawLevel: {


                ldx #$00
        !:      
                        txa
                        pha

                        lda Data.Display, x
                        jsr DrawTile

                        pla
                        tax
                inx
                cpx #$78
                bne !-
                rts


    }      


    DrawTile: {

                // Tile-Element Number in accumulator
                // Position in X


                // Store Bitmap
                stx ZP.TileDrawTemp
                jsr GRAPHICS.CopyTile
                ldx ZP.TileDrawTemp
                jsr StoreBitmap

                // Store Screen RAM
                ldx ZP.TileDrawTemp
                lda TABLES.TileToScreenRamLSB,x
                sta ZP.TileDrawVector + 0
                lda TABLES.TileToScreenRamMSB,x
                sta ZP.TileDrawVector + 1
                ldx #$30                                // index in TileData where screen ram data starts
                jsr Store 

                //  Store Color RAM
                ldx ZP.TileDrawTemp
                lda TABLES.TileToColorRamLSB,x
                sta ZP.TileDrawVector + 0
                lda TABLES.TileToColorRamMSB,x
                sta ZP.TileDrawVector + 1
                ldx #$36                                // index in TileData where color ram data starts
                jsr Store 

                rts
    }  


    StoreBitmap: {

                lda TABLES.TileToScreenLSB,x
                sta ZP.TileDrawVector + 0
                lda TABLES.TileToScreenMSB,x
                sta ZP.TileDrawVector + 1


                // paint the first three bitmap blocks
                ldy #$00
        !loop:  lda GRAPHICS.TileData, y
                sta (ZP.TileDrawVector),y
                iny
                cpy #$18
                bne !loop-
                

                // calculate start of the next row
                lda ZP.TileDrawVector + 0
                sta ZP.Num1Lo
                lda ZP.TileDrawVector + 1
                sta ZP.Num1Hi
                lda #$40
                sta ZP.Num2Lo
                lda #$01
                sta ZP.Num2Hi
                jsr Add
                
                lda ZP.ResultLo
                sta ZP.TileDrawVector + 0
                lda ZP.ResultHi
                sta ZP.TileDrawVector + 1

                // paint the next three bitmap blocks
                ldy #$00
                ldx #$18
        !loop:  lda GRAPHICS.TileData, x
                sta (ZP.TileDrawVector),y
                iny
                inx
                cpy #$18
                bne !loop- 
                rts

    }

    Store: {

                stx ZP.TileDrawTemp2
                ldx #$00
        !loop:  txa
                pha

                    clc
                    ldy #$00
                    ldx ZP.TileDrawTemp2
            !inner: lda GRAPHICS.TileData, x
                    sta (ZP.TileDrawVector),y
                    iny
                    inx
                    cpy #$03
                    bne !inner- 
                    
                    // calculate start of the next row
                    lda ZP.TileDrawVector + 0
                    sta ZP.Num1Lo
                    lda ZP.TileDrawVector + 1
                    sta ZP.Num1Hi
                    lda #$28
                    sta ZP.Num2Lo
                    lda #$00
                    sta ZP.Num2Hi
                    jsr Add
                    
                    lda ZP.ResultLo
                    sta ZP.TileDrawVector + 0
                    lda ZP.ResultHi
                    sta ZP.TileDrawVector + 1

                    lda ZP.TileDrawTemp2
                    adc #$03
                    sta ZP.TileDrawTemp2

                pla
                tax
                inx
                cpx #$02
                bne !loop-
                rts
    }


}