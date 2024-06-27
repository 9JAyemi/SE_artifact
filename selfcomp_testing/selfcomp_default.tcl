analyze -sva selfcomp_default.v

elaborate -top DefaultTester -bbox_mul 256

#specify clock and reset
clock clock
reset reset -non_resettable_regs 0

stopat se1.aes_invcipher.io_output_op1_0
stopat se2.aes_invcipher.io_output_op1_0

assert {timingLeakDone -> !timingLeak}

set_prove_time_limit 3600
prove -bg -all
