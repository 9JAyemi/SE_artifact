analyze -sva selfcomp_cache.v

elaborate -top CacheTester -bbox_mul 256

#specify clock and reset
clock clock
reset reset -non_resettable_regs 0

stopat se1.aes_invcipher.io_output_op1_0
stopat se2.aes_invcipher.io_output_op1_0

stopat se1._output_buffer_T
stopat se2._output_buffer_T

assume {se1.aes_cipher.io_output_valid & se2.aes_cipher.io_output_valid -> se1._output_buffer_T == se2._output_buffer_T}

assert {timingLeakDone -> !timingLeak}

set_prove_time_limit 3600
prove -bg -all

