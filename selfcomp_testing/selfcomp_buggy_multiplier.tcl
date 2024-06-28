analyze -sva selfcomp_buggy_multiplier.v

elaborate -top BuggyMultiplierTester -bbox_mul 256

#specify clock and reset
clock clock
reset reset -non_resettable_regs 0

stopat se1.aes_invcipher.io_output_op1_0
stopat se2.aes_invcipher.io_output_op1_0

assert {timingLeakDone -> !timingLeak}
# assert {bothValid -> io_out_resultOne == io_out_resultTwo}

set_prove_time_limit 7200
prove -bg -all
