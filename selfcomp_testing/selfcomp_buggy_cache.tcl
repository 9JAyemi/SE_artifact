analyze -sva selfcomp_buggy_cache.v

elaborate -top BuggyCacheTester -bbox_mul 256

#specify clock and reset
clock clock
reset reset -non_resettable_regs 0

stopat se1.aes_invcipher.io_output_op1_0
stopat se2.aes_invcipher.io_output_op1_0

stopat se1._output_buffer_T
stopat se2._output_buffer_T

assume {se1._output_buffer_T == se2._output_buffer_T}

assert {oneValid -> bothValid}
assert {bothValid -> io_out_resultOne == io_out_resultTwo}

set_prove_time_limit 3600
prove -bg -all
