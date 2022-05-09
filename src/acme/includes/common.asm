!macro basicStarter {
    
    *=$0800
    !byte $00,$0c,$08,$0a,$00,$9e,$32,$30,$36,$34,$00,$00,$00,$00


}

!macro bankInIo {
	; --------------------------------------------------------------------------------------------------
    ; Bank IO in via C64 mechanism (user guide page 456)
    ; --------------------------------------------------------------------------------------------------
    lda #$35
    sta $01
}


!macro setPos .read_lo,.read_hi,.dest_lo,.dest_hi,.ad {


    ldy Y

    lda .read_hi-1,y
    sta .dest_hi  

    lda .read_lo-1,y

    ldx X
    cpx #$01
    beq .sk2

    ldx #$01
-   clc
    adc #.ad
    bcc .sk
    inc .dest_hi
.sk inx 
    cpx X
    clc
    bne -



.sk2 sta .dest_lo
    
}

!macro setPos8 .read_lo,.read_hi,.dest_lo,.dest_hi {


    ldy Y

    lda .read_hi-1,y
    sta .dest_hi  
    lda .read_lo-1,y
    tay

    ldx #$01
-   iny 
    iny 
    iny 
    iny 
    iny 
    iny 
    iny 
    iny
    inx 
    cpx X  
    bne -



    tya
    sta .dest_lo
    
.sk inc .dest_hi  

}

!macro setPos1 .read_lo,.read_hi,.dest_lo,.dest_hi {


    ldy Y

    lda .read_hi-1,y
    sta .dest_hi  
    lda .read_lo-1,y
    tay

    ldx #$01
-   iny 
    inx 
    cpx X  
    bne -
    tya
    sta .dest_lo

}