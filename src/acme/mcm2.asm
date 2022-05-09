!cpu nmos6502
!to "./build/mcm2.prg", cbm
!src "./src/includes/common.asm"
!src "./src/includes/bitmap.asm"


tileIndex     = $40   
tile          = $41            
posX          = $43
posY          = $44

bLo           = $45
bHi           = $46

num1Lo        = $62
num1Hi        = $63
num2Lo        = $64
num2Hi        = $65
resultLo      = $66
resultHi      = $67

       +basicStarter

       *=$0810

main   +activateBitmapMode
       +activateMulticolorMode
       +switchVicBank1
       +setStartOfBitmapAndScreenRam


       lda #$00
       sta $d021
       lda #$01
       sta $d020

       ; position of the tile on the screen
       ldx #$00             
       ldy #$00
       stx posX
       sty posY
       
       ldx #$01
       lda $9100, x
       sta tileIndex
       
       ldx tileIndex
       lda $9110, x
       sta tile
       inx
       lda $9110, x
       sta tile + 1
       
       ; TILE=00, TILE+1=95 --> $9500


       ; ------------------------------------
       ; Male Bitmap
       ; ------------------------------------

       lda #$00
       sta num1Lo
       lda #$60
       sta num1Hi

       ldx posX
       lda twoByTwoLo,x
       sta num2Lo
       lda twoByTwoHi,x
       sta num2Hi
       jsr add

       lda resultLo
       sta bLo
       lda resultHi
       sta bHi

       

       ldy #$00
-      lda (tile),y
       sta (bLo),y  
       iny
       cpy #$0f
       bne -

       -- 





     lda #$06
       sta $d021

       vidmem = $5000
       colmem = $4000

       ldx #$00
setpic lda vidmem,x
       sta $4800,x
       lda vidmem+$100,x
       sta $4900,x
       lda vidmem+$200,x
       sta $4a00,x
       lda vidmem+$2e8,x
       sta $4ae8,x
       lda colmem,x
       sta $d800,x
       lda colmem+$100,x
       sta $d900,x
       lda colmem+$200,x
       sta $da00,x
       lda colmem+$2e8,x
       sta $dae8,x
       inx
       bne setpic                      


       +switchVicBank1

       lda #$00
       sta $d020


       jmp *



       jmp *


;      helper routine to add two 16-bit numbers
add	clc				
	lda num1Lo
	adc num2Lo
	sta resultLo			
	lda num1Hi
	adc num2Hi			
	sta resultHi			
	rts


;      creates some Jump-Tables for Bitmap, Screen- and Color-RAM in LO und HI Bytes
twoByTwoLo
       !for x, 0, 19 {
              !byte < $0000 + (x * $10)
       }
twoByTwoHi
       !for y, 0, 19 {
              !byte > $0000 + (y * $10)
       }
fourByFourLo
       !for x, 0, 9 {
              !byte < $0000 + (x * $20)
       }
fourByFourHi
       !for y, 0, 9 {
              !byte > $0000 + (y * $20)
       }
bitmapLo
       !for x, 0, 24 {
              !byte < $6000 + (x * $140)
       }
bitmapHi
       !for y, 0, 24 {
              !byte > $6000 + (y * $140)
       }
colorRamLo
       !for x, 0, 24 {
              !byte < $4000 + x * $28
       }
colorRamHi
       !for x, 0, 24 {
              !byte > $4000 + x * $28
       }
screenLo
       !for x, 0, 24 {
              !byte < $5000 + x * $28
       }
screenHi
       !for x, 0, 24 {
              !byte > $5000 + x * $28
       }





       *=$9000
       ; 40 Bytes per Tile
       ; hexer 4 4 9000 10 4
        
       ; 0=TILE_ROOF
       !byte 170,186,238,250,126,251,126,95,244,14    
       !byte 153,86,153,105,164,161,148,149,100,14     
       !byte 254,254,250,233,249,230,153,166,100,14    
       !byte 148,145,116,101,93,89,150,85,100,14    
        
       ; 1=TILE_GREEN_BOX
       ; $9028
       !byte 221,245,221,191,255,191,189,191,213,3
       ; $9032
       !byte 149,86,217,85,221,119,253,255,209,3
       ; $903c
       !byte 174,187,110,186,105,166,89,17,181,3
       ; $9046
       !byte 255,187,238,171,174,107,154,102,181,3

       ; 2=TILE_WALL
       !byte 0,213,183,221,191,239,187,170,248,10
       !byte 0,206,138,198,139,134,137,202,152,10
       !byte 0,254,169,230,153,101,153,107,188,15
       !byte 0,104,88,104,152,100,88,148,188,15

       *=$9500
       ;      0   1   2   3   4   5   6  7   8   9  a   b   c   d   e   f   1   2  3   4
       !byte 170,186,238,250,126,251,126,95,153,86,153,105,164,161,148,149,244,100,14,14
       !byte 254,254,250,233,249,230,153,166,148,145,116,101,93,89,150,85,100,100,14,14


       ;*=$9100
       ;!byte $00,$08,$0F
       ;*=$9110
       ;!byte $00,$90,$0a,$90,$1e,$90,$14,$90
       ;!byte $28,$90,$32,$90,$46,$90,$3c,$90

       *=$9100
       !byte $00,$04,$08
       *=$9110
       !byte $00,$95,$14,$95
       


   