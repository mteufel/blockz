INPUT: {

    Up:         .byte $00
    Down:       .byte $00
    Left:       .byte $00
    Right:      .byte $00
    Button:     .byte $00
    Debounce:   .byte $00

    ReadJoystick: {

            lda $dc00      // read joystick port 2
            lsr
            ror Up
            lsr
            ror Down
            lsr
            ror Left
            lsr
            ror Right
            lsr
            ror Button
            rts

    }

    Reaction: {

                    lda Up
                    bne down
                    dec Up
                    jsr POINTER.MovePointerUp

        down:       lda Down
                    bne left
                    dec Down
                    jsr POINTER.MovePointerDown
                    jsr POINTER.RefreshPointerIsAt

        left:       lda Left
                    bne right
                    dec Left
                    jsr POINTER.MovePointerLeft
                    jsr POINTER.RefreshPointerIsAt

        right:      lda Right
                    bne button
                    dec Right
                    jsr POINTER.MovePointerRight
                    jsr POINTER.RefreshPointerIsAt
        
        button:     lda Button
                    bne debounce
                    lda #$01
                    sta Debounce
                    rts

        debounce:   lda Debounce
                    beq noAction
                    lda #$00
                    sta Debounce
                    inc $d020


        noAction:   :delay(10,5)
                    rts


    }

}