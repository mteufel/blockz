.macro delay(delay_outer, delay_inner) {
            ldy #delay_outer
  loopy:    ldx #delay_inner
  loopx:    nop
            dex
            bne loopx
            dey
            bne loopy
}