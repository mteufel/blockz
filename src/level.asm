LEVEL: {


    Data: {
        Initial:           .fill 120, $0d
        InitialBlocksPos:  .fill 120, $ff
        InitialBlocksTile: .fill 120, $ff


        Current:            .fill 120, $00
        CurrentBlocksPos:   .fill 120, $ff
        CurrentBlocksTile:  .fill 120, $ff

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

                // initialize the level by loading it to Data.Initial
                ldy #$00
        !loop:  lda (ZP.LevelDataVector), y
                sta Data.Initial,y
                iny
                cpy #$78
                bne !loop-


                // this loop reads the initial stone layout from the level
                ldy #$7d
                ldx #$00
        !loop:  lda (ZP.LevelDataVector), y
                cmp #$ff
                beq !end+
                sta Data.InitialBlocksPos,x
                iny
                lda (ZP.LevelDataVector), y
                sta Data.InitialBlocksTile,x
                iny
                inx
                jmp !loop-
        !end:

                jsr CopyInitialMap
                jsr CopyInitialBlocksData

                rts
    }  

   

    CopyInitialMap: {
                ldx #$78
        !:      lda Data.Initial,x
                sta Data.Current,x
                dex
                bpl !-
                rts

    }

    CopyInitialBlocksData: {
                ldx #$00
        !:      lda Data.InitialBlocksPos,x
                sta Data.CurrentBlocksPos,x
                lda Data.InitialBlocksTile,x
                sta Data.CurrentBlocksTile,x
                inx
                cmp #$ff
                bne !-
                rts
    }


    DrawLevel: {

                lda #$01
                sta ZP.TileStoreBitmap

                ldx #$00
        !:      
                        txa
                        pha

                        lda Data.Current, x
                        jsr DrawTile

                        pla
                        tax
                inx
                cpx #$78
                bne !-


                // paint the initial blockz
                ldy #$00
        !:      lda Data.CurrentBlocksPos,y 
                cmp #$ff
                beq !end+ 
                tax
                lda Data.CurrentBlocksTile,y
                sty ZP.Temp
                jsr DrawTile
                ldy ZP.Temp 
                iny
                jmp !-
        !end:
                rts


    }      


    DrawTile: {

                // Tile-Element Number in accumulator
                // Position in X

                stx ZP.TileDrawTemp
                jsr GRAPHICS.CopyTile

                ldy ZP.TileStoreBitmap
                cpy #$01
                bne next


                // Store Bitmap
                ldx ZP.TileDrawTemp
                jsr StoreBitmap

                // Store Screen RAM
        next:   ldx ZP.TileDrawTemp
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

    RecolorTile: {

                // Tile-Element Number in accumulator
                // Position in X
                ldy #$00
                sty ZP.TileStoreBitmap
                stx ZP.TileDrawTemp
                jsr DrawTile
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

                // x start in Data Structure (+x)

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