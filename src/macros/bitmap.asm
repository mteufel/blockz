.macro blackScreen() {
    lda #$00
    sta $d020
    sta $d021
}

.macro activateBitmapMode() {
    // --------------------------------------------------------------------------------------------------
    //  Activate Bitmap Mode
    // --------------------------------------------------------------------------------------------------
    lda $d011                          //load VIC Register 17 (Hex 11) into the accu
    //bit 76543210
    ora #%00100000                     //and activate the bitmap mode with bit 5
    sta $d011                          //activate by writing the modified value back to the register
}

.macro activateMulticolorMode() {
    // --------------------------------------------------------------------------------------------------
    //  Activate Multicolor Mode
    // --------------------------------------------------------------------------------------------------
    lda $d016                          //load VIC Register 22 (Hex 16) into the accu
    //bit 76543210
    ora #%00010000                     //and activate multicolor with bit 4
    sta $d016                          //activate by writing the modified value back to the register
                                       //activate by writing the modified value back to the register
}

.macro switchVicBank2() {
    // --------------------------------------------------------------------------------------------------
    // Switch to a specific VIC Bank 
    // --------------------------------------------------------------------------------------------------
    lda #%00000011                     //prepare write action to select bank
    sta $dd02 
    
    // Bits | Bank| Memory Area
    // -----+-----+----------------------------
    // %00  |  3  | $C000-$FFFF
    // %01  |  2  | $8000-$BFFF
    // %10  |  1  | $4000-$7FFF
    // %11  |  0  | $0000-$3FFF

    lda $dd00
    and #%11111100
    ora #%00000001                     //select Bank #2 $8000-$BFFF
    sta $dd00                          
}

.macro setStartOfBitmapAndScreenRam() {
    // --------------------------------------------------------------------------------------------------
    //  Select the start of the bitmap memory
    // --------------------------------------------------------------------------------------------------
        
        
    // the selected bank has 16kb and is divided into 2 8kb blocks
    // bit 3 of $d018 defines which of the bitmap areas will be used

    // Bit | # | Memory Area
    // ----+---+-------------------------------------------
    //     |   | Bank 0             Bank 1           Bank 2    ...
    // %0  | 0 | $0000-$1FFF        $4000-$5FFF      $8000-$9FFF
    // %1  | 1 | $2000-$3FFF        $6000-$7FFF      $A000-$BFFF


    lda $d018
    //bit 76543210
    and #%11110111
    ora #%00001000                   // put 1 in bit 3 means the bitmap is at $A000-$BFFF                
    sta $d018

    // --------------------------------------------------------------------------------------------------
    //  Select the start of the screen memory
    // --------------------------------------------------------------------------------------------------
    
    // In Hires all the color information is stored in the screenmemory.
    // with bit 7-4 you can control where the screenmemory starts

    // Bits  | #  | Screem Mem starts at....
    // ------+---+----------------------------
    // %0000 | 0  | $0000
    // %0001 | 1  | $0400
    // %0010 | 2  | $0800     // ------ 
    // %0011 | 3  | $0C00     //      |           
    // %0100 | 4  | $1000     //      |   
    // %0101 | 5  | $1400     //      |           
    // %0110 | 6  | $1800     //      |   
    // %0111 | 7  | $1C00     //      |
    // %1000 | 8  | $2000     //      |
    // %1001 | 9  | $2400     //      |   
    // %1010 | 10 | $2800     //      |   
    // %1011 | 11 | $2C00     //      |           
    // %1100 | 12 | $3000     //      |   
    // %1101 | 13 | $3400     //      |           
    // %1110 | 14 | $3800     //      |   
    // %1111 | 15 | $3C00     //      |
                              //      |
                              //      |
    lda $d018                 //      |
    ;bit  76543210            //      |
    and #%00001111            //      | 
    ora #%00000000            //  <---- bits 7-4   ==> $8000
    sta $d018
}