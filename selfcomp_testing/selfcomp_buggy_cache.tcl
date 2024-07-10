analyze -sva selfcomp_buggy_cache.v

elaborate -top BuggyCacheTester -bbox_mul 256

#specify clock and reset
clock clock
reset reset -non_resettable_regs 0

stopat se1.aes_invcipher.io_output_op1_*
stopat se1.aes_invcipher.io_output_op2_*
stopat se2.aes_invcipher.io_output_op1_*
stopat se2.aes_invcipher.io_output_op2_*

stopat se1._output_buffer_T
stopat se2._output_buffer_T

assume {se1._output_buffer_T == se2._output_buffer_T}

assert {oneValid -> bothValid}
# assert {bothValid -> io_out_resultOne == io_out_resultTwo}

#se1
abstract -init_value {se1.cache_valid_neg_0 se1.cache_valid_neg_1 se1.cache_valid_neg_2 se1.cache_valid_neg_3 se1.cache_valid_neg_4 se1.cache_valid_neg_5 se1.cache_valid_neg_6 se1.cache_valid_neg_7 se1.cache_valid_neg_8 se1.cache_valid_neg_9 se1.cache_valid_neg_10 se1.cache_valid_neg_11 se1.cache_valid_neg_12 se1.cache_valid_neg_13 se1.cache_valid_neg_14 se1.cache_valid_neg_15}
abstract -init_value {se1.cache_valid_pos_0 se1.cache_valid_pos_1 se1.cache_valid_pos_2 se1.cache_valid_pos_3 se1.cache_valid_pos_4 se1.cache_valid_pos_5 se1.cache_valid_pos_6 se1.cache_valid_pos_7 se1.cache_valid_pos_8 se1.cache_valid_pos_9 se1.cache_valid_pos_10 se1.cache_valid_pos_11 se1.cache_valid_pos_12 se1.cache_valid_pos_13 se1.cache_valid_pos_14 se1.cache_valid_pos_15}

#se2
abstract -init_value {se2.cache_valid_neg_0 se2.cache_valid_neg_1 se2.cache_valid_neg_2 se2.cache_valid_neg_3 se2.cache_valid_neg_4 se2.cache_valid_neg_5 se2.cache_valid_neg_6 se2.cache_valid_neg_7 se2.cache_valid_neg_8 se2.cache_valid_neg_9 se2.cache_valid_neg_10 se2.cache_valid_neg_11 se2.cache_valid_neg_12 se2.cache_valid_neg_13 se2.cache_valid_neg_14 se2.cache_valid_neg_15}
abstract -init_value {se2.cache_valid_pos_0 se2.cache_valid_pos_1 se2.cache_valid_pos_2 se2.cache_valid_pos_3 se2.cache_valid_pos_4 se2.cache_valid_pos_5 se2.cache_valid_pos_6 se2.cache_valid_pos_7 se2.cache_valid_pos_8 se2.cache_valid_pos_9 se2.cache_valid_pos_10 se2.cache_valid_pos_11 se2.cache_valid_pos_12 se2.cache_valid_pos_13 se2.cache_valid_pos_14 se2.cache_valid_pos_15}

set_prove_time_limit 3600
prove -bg -all

set_engine_mode Tri