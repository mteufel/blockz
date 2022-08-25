/* 

    ========================================================

    BLOCKZ
    by seytan/reflex 2022

    ========================================================
    
    Memorylayout per 24.08.2022:
    
    $0000            Zeropage, Variables etc
    $0800-$0FFF      Init Code, Utils, Tables

    $1000-$2000      Reserved for Music

    $2000-$4000      Blockz Game Code

    $4000-$7FFF      VIC Bank 1
       $4000-$4FFF        Screen RAM
       $5000-$5FFF        Sprite Data
       $6000-$7FFF        Bitmap Data

    $8000-$A0FF      Levels

    $A100- max $CFFF Graphic Data

    $D000-$DFFF      VIC Control registers, dont touch

    $E000-$EFFF      Free

    $F000-$FFFF      Kernal, maybe I need it for irqs, so dont touch (at the moment)

*/

.label BITMAP       = $6000
.label SCREEN_RAM   = $4000
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
        //  this means, kernal functions e.g. for irq handling not available at the moment
        lda #$35
        sta $01

        blackScreen()
        activateBitmapMode()
        activateMulticolorMode()
        switchVicBank1()
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
#import "macros/utils.asm"

* = $2000 "Blockz Code"
#import "intro.asm" 
#import "game.asm" 
#import "level.asm" 
#import "input.asm"
#import "sprites.asm"

* = $A100 "Graphics"
#import "graphics.asm"


* = $8000 "Level Data"
#import "levels3.asm"
