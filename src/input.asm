INPUT: {

    Up:         .byte 0
    Down:       .byte 0
    Left:       .byte 0
    Right:      .byte 0
    Button:     .byte 0

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
                    jsr SPRITES.MovePointerUp

        down:       lda Down
                    bne left
                    dec Down
                    jsr SPRITES.MovePointerDown

        left:       lda Left
                    bne right
                    jsr SPRITES.MovePointerLeft
                    dec Left

        right:      lda Right
                    bne noAction
                    jsr SPRITES.MovePointerRight
                    dec Right

        noAction:   :delay(10,10)
                    rts


    }

}