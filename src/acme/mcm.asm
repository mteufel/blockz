!cpu nmos6502
!to "./build/mcm.prg", cbm
!src "./src/includes/common.asm"
!src "./src/includes/bitmap.asm"


TILE_LEN = 40
TILE_IDX = $40              
TILE     = $41
X        = $43
Y        = $44
BITM     = $45


COLR     = $50
SCRR     = $52

MEM      = $55
CNT      = $57
CNTY     = $58

MAX_X    = $59
MAX_Y    = $60

       +basicStarter

       *=$0810

main   +activateBitmapMode
       +activateMulticolorMode
       +switchVicBank3
       +setStartOfBitmapAndScreenRam


       lda #$00
       sta $d021
       lda #$01
       sta $d020

       lda #$29
       sta MAX_X
       lda #$17
       sta MAX_Y

       ldx #$01
       sta CNT
       ldy #$01
       sta CNTY

       ldx #$01
       ldy #$01
       stx X
       sty Y
-      jsr blk2
       inc X
       inc X
       lda X
       cmp MAX_X
       bne -
       lda Y
       cmp MAX_Y
       beq ende
       inc Y
       inc Y
       ldx #$01
       stx X
       jmp - 
ende



       lda #$06
       sta $d020

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


blk2    
       ldx #$00
       lda $9100,x
       sta TILE_IDX

       ldx TILE_IDX
       lda $9110,x
       sta TILE
       inx
       lda $9110,x
       sta TILE + 1
       stx TILE_IDX
       jsr chr

       ldx TILE_IDX
       inx
       lda $9110,x
       sta TILE
       inx
       lda $9110,x
       sta TILE + 1
       stx TILE_IDX
       inc X
       jsr chr

       ldx TILE_IDX
       inx
       lda $9110,x
       sta TILE
       inx
       lda $9110,x
       sta TILE + 1
       stx TILE_IDX
       inc Y
       jsr chr

       ldx TILE_IDX
       inx
       lda $9110,x
       sta TILE
       inx
       lda $9110,x
       sta TILE + 1
       stx TILE_IDX
       dec X
       jsr chr


       
       dec Y

       rts

blk    lda #$28
       sta TILE
       lda #$90
       sta TILE + 1
       jsr chr

       lda #$32
       sta TILE
       lda #$90
       sta TILE + 1
       inc X
       jsr chr

       lda #$46
       sta TILE
       lda #$90
       sta TILE + 1
       inc Y
       jsr chr

       lda #$3c
       sta TILE
       lda #$90
       sta TILE + 1
       dec X
       jsr chr

       dec Y
       rts


chr    
       ; ------------------------------------
       ; Bitmap-Start in ZP -> BITM $45
       ; ------------------------------------

       +setPos BITMAP_LO, BITMAP_HI, BITM, BITM+1, $08
       +setPos SCREEN_LO, SCREEN_HI, SCRR, SCRR+1, $01
       +setPos COLRAM_LO, COLRAM_HI, COLR, COLR+1, $01

       ; ------------------------------------
       ; Male Bitmap
       ; ------------------------------------
       ldy #$00
-      lda (TILE),y
       sta (BITM),y  
       iny
       cpy #$08
       bne -

       lda (TILE),y
       tax
       sty MEM
       ldy #$00
       txa
       sta (SCRR),y
       ldy MEM
       iny

       lda (TILE),y
       tax
       sty MEM
       ldy #$00
       txa
       sta (COLR),y

       rts


BITMAP_LO
       !for x, 0, 24 {
              !byte < $6000 + (x * $140)
       }
BITMAP_HI
       !for y, 0, 24 {
              !byte > $6000 + (y * $140)
       }
       !byte $ff,$ff,$ff,$ff
COLRAM_LO
       !for x, 0, 24 {
              !byte < $4000 + x * $28
       }
COLRAM_HI
       !for x, 0, 24 {
              !byte > $4000 + x * $28
       }
       !byte $aa,$aa,$aa,$aa
SCREEN_LO
       !for x, 0, 24 {
              !byte < $5000 + x * $28
       }
SCREEN_HI
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
       !byte 170,186,238,250,126,251,126,95,153,86,153,105,164,161,148,149,244,14,100,14
       !byte 254,254,250,233,249,230,153,166,148,145,116,101,93,89,150,85,100,14,100,14


       ;*=$9100
       ;!byte $00,$08,$0F
       ;*=$9110
       ;!byte $00,$90,$0a,$90,$1e,$90,$14,$90
       ;!byte $28,$90,$32,$90,$46,$90,$3c,$90

       *=$9100
       !byte $00,$04,$08
       *=$9110
       !byte $00,$95,$14,$95
       


   