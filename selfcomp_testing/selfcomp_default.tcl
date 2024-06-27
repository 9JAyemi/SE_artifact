analyze -sva selfcomp_default.v

elaborate -top DefaultTester -bbox_mul 256

#specify clock and reset
clock clock
reset reset -non_resettable_regs 0

stopat se1.AESDecrypt.io_output_op1_0
stopat se2.AESDecrypt.io_output_op1_0

assert {timingLeakDone -> !timingLeak}
assert {bothDone -> io_out_resultOne == io_out_resultTwo}

prove -bg -all
