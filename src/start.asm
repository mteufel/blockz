/* 
    $0800 Init code and util routines
    $1000 Place for music
    
    $3000 CODE

    $4000-$5000 Free

    $5000 Graphics Data
        $5000-613C Tiles
    
    $7000 Levels

    // Graphics Area
    // $8000-$BFFF VIC Bank 2 from 
    //  $9000       SCREEN RAM
    //  $A000-$BFFF Bitmap data

    $C000 - $CFFF Free
    $E000 - $FFFF Free


*/

.label BITMAP       = $a000
.label SCREEN_RAM   = $8000
.label COLOR_RAM    = $d800

#import "zp.asm" 

BasicUpstart2(Entry)
//BasicUpstart2(SimpleEntry)

SimpleEntry: {
        // this is only for debugging purposes to check calculations etc...
        
        jmp *     
}


Entry: {
        sei

        // enable interrupts
        lda #$7f
        sta $dc0d
        sta $dd0d

        //  RAM between $A000-$BFFF, $E000-$FFFF available, I/O area visible at $D000-DFFF
        lda #$35
        sta $01

        blackScreen()
        activateBitmapMode()
        activateMulticolorMode()
        switchVicBank2()
        setStartOfBitmapAndScreenRam()
        
        cli

        jsr ClearScreen
        jmp INTRO.Start
}

* = * "Utitily functions and tables"

ClearScreen: {
       // Clear Screen in Bitmap-Mode
            ldy #$00
            tya
    !loop:  sta BITMAP,y
            sta BITMAP+$100,y
            sta BITMAP+$200,y
            sta BITMAP+$300,y
            sta BITMAP+$400,y
            sta BITMAP+$500,y
            sta BITMAP+$600,y
            sta BITMAP+$700,y
            sta BITMAP+$800,y
            sta BITMAP+$900,y
            sta BITMAP+$a00,y
            sta BITMAP+$b00,y
            sta BITMAP+$c00,y
            sta BITMAP+$d00,y
            sta BITMAP+$e00,y
            sta BITMAP+$f00,y
            sta BITMAP+$1000,y
            sta BITMAP+$1100,y
            sta BITMAP+$1200,y
            sta BITMAP+$1300,y
            sta BITMAP+$1400,y
            sta BITMAP+$1500,y
            sta BITMAP+$1600,y
            sta BITMAP+$1700,y
            sta BITMAP+$1800,y
            sta BITMAP+$1900,y
            sta BITMAP+$1a00,y
            sta BITMAP+$1b00,y
            sta BITMAP+$1c00,y
            sta BITMAP+$1d00,y
            sta BITMAP+$1e00,y
            sta BITMAP+$1f00,y
            iny
            bne !loop-
            rts
}

Add: {
            clc
            lda ZP.Num1Lo
            adc ZP.Num2Lo
            sta ZP.ResultLo
            lda ZP.Num1Hi
            adc ZP.Num2Hi
            sta ZP.ResultHi
            clc
            rts

}

Multiply: {

        // ZP.Num1 and ZP.Num2 values to be multplied
        // result in ACC

                lda #$00
                beq entry
        doAdd:  clc
                adc ZP.Num1
        loop:   asl ZP.Num1
        entry:  lsr ZP.Num2
                bcs doAdd
                bne loop
                rts
   
}


TABLES: {
        TileToScreenLSB:
                .for(var i=0; i<120; i++ ) {
                   .var x = mod(i,12)
                   .var y = floor(i/12)
                   //.print "i=" + i + " x:" + x + "y=" + y
                   //.print toHexString(BITMAP + y * ($50*8) + x * 24)
                   .byte <[BITMAP + y * ($50*8) + x * 24]
                }
        TileToScreenMSB:
                .for(var i=0; i<120; i++ ) {
                   .var x = mod(i,12)
                   .var y = floor(i/12)
                   .byte >[BITMAP + y * ($50*8) + x * 24]
                }     
        TileToColorRamLSB:
                .for(var i=0; i<120; i++ ) {
                   .var x = mod(i,12)
                   .var y = floor(i/12)
                   //.print "i=" + i + " x:" + x + "y=" + y
                   //.print toHexString(COLOR_RAM + y * $50 + x*3)
                   .byte <[COLOR_RAM + y * $50 + x*3]
                }
        TileToColorRamMSB:
                .for(var i=0; i<120; i++ ) {
                   .var x = mod(i,12)
                   .var y = floor(i/12)
                   .byte >[COLOR_RAM + y * $50 + x*3]
                }                
        TileToScreenRamLSB:
                .for(var i=0; i<120; i++ ) {
                   .var x = mod(i,12)
                   .var y = floor(i/12)
                   //.print "i=" + i + " x:" + x + "y=" + y
                   //.print toHexString(SCREEN_RAM + y * $50 + x*3)
                   .byte <[SCREEN_RAM + y * $50 + x*3]
                }
        TileToScreenRamMSB:
                .for(var i=0; i<120; i++ ) {
                   .var x = mod(i,12)
                   .var y = floor(i/12)
                   .byte >[SCREEN_RAM + y * $50 + x*3]
                }                

}


#import "macros/bitmap.asm"

* = $3000 "Blockz Code"
#import "intro.asm" 
#import "game.asm" 
#import "level.asm" 

* = $5000 "Graphics"
#import "graphics.asm"

* = $7000 "Level Data"
#import "levels3.asm"
