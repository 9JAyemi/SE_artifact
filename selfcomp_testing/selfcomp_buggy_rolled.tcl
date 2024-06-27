analyze -sva selfcomp_buggy_rolled.v

elaborate -top BuggyRolledTester -bbox_mul 256

#specify clock and reset
clock clock
reset reset -non_resettable_regs 0

stopat se1.aes_cipher.io_output_text_0
stopat se1.aes_cipher.io_output_text_1
stopat se1.aes_cipher.io_output_text_2
stopat se1.aes_cipher.io_output_text_3
stopat se1.aes_cipher.io_output_text_4
stopat se1.aes_cipher.io_output_text_5
stopat se1.aes_cipher.io_output_text_6
stopat se1.aes_cipher.io_output_text_7
stopat se1.aes_cipher.io_output_text_8
stopat se1.aes_cipher.io_output_text_9
stopat se1.aes_cipher.io_output_text_10
stopat se1.aes_cipher.io_output_text_11
stopat se1.aes_cipher.io_output_text_12
stopat se1.aes_cipher.io_output_text_13
stopat se1.aes_cipher.io_output_text_14
stopat se1.aes_cipher.io_output_text_15

stopat se2.aes_cipher.io_output_text_0 
stopat se2.aes_cipher.io_output_text_1
stopat se2.aes_cipher.io_output_text_2
stopat se2.aes_cipher.io_output_text_3
stopat se2.aes_cipher.io_output_text_4
stopat se2.aes_cipher.io_output_text_5
stopat se2.aes_cipher.io_output_text_6
stopat se2.aes_cipher.io_output_text_7
stopat se2.aes_cipher.io_output_text_8
stopat se2.aes_cipher.io_output_text_9
stopat se2.aes_cipher.io_output_text_10
stopat se2.aes_cipher.io_output_text_11
stopat se2.aes_cipher.io_output_text_12
stopat se2.aes_cipher.io_output_text_13
stopat se2.aes_cipher.io_output_text_14
stopat se2.aes_cipher.io_output_text_15

stopat se1.aes_cipher.io_output_valid
stopat se2.aes_cipher.io_output_valid

assume {se1.aes_cipher.io_output_valid & se2.aes_cipher.io_output_valid -> se1.aes_cipher.io_output_text_0 == se2.aes_cipher.io_output_text_0}
assume {se1.aes_cipher.io_output_valid & se2.aes_cipher.io_output_valid -> se1.aes_cipher.io_output_text_1 == se2.aes_cipher.io_output_text_1}
assume {se1.aes_cipher.io_output_valid & se2.aes_cipher.io_output_valid -> se1.aes_cipher.io_output_text_2 == se2.aes_cipher.io_output_text_2}
assume {se1.aes_cipher.io_output_valid & se2.aes_cipher.io_output_valid -> se1.aes_cipher.io_output_text_3 == se2.aes_cipher.io_output_text_3}
assume {se1.aes_cipher.io_output_valid & se2.aes_cipher.io_output_valid -> se1.aes_cipher.io_output_text_4 == se2.aes_cipher.io_output_text_4}
assume {se1.aes_cipher.io_output_valid & se2.aes_cipher.io_output_valid -> se1.aes_cipher.io_output_text_5 == se2.aes_cipher.io_output_text_5}
assume {se1.aes_cipher.io_output_valid & se2.aes_cipher.io_output_valid -> se1.aes_cipher.io_output_text_6 == se2.aes_cipher.io_output_text_6}
assume {se1.aes_cipher.io_output_valid & se2.aes_cipher.io_output_valid -> se1.aes_cipher.io_output_text_7 == se2.aes_cipher.io_output_text_7}
assume {se1.aes_cipher.io_output_valid & se2.aes_cipher.io_output_valid -> se1.aes_cipher.io_output_text_8 == se2.aes_cipher.io_output_text_8}
assume {se1.aes_cipher.io_output_valid & se2.aes_cipher.io_output_valid -> se1.aes_cipher.io_output_text_9 == se2.aes_cipher.io_output_text_9}
assume {se1.aes_cipher.io_output_valid & se2.aes_cipher.io_output_valid -> se1.aes_cipher.io_output_text_10 == se2.aes_cipher.io_output_text_10}
assume {se1.aes_cipher.io_output_valid & se2.aes_cipher.io_output_valid -> se1.aes_cipher.io_output_text_11 == se2.aes_cipher.io_output_text_11}
assume {se1.aes_cipher.io_output_valid & se2.aes_cipher.io_output_valid -> se1.aes_cipher.io_output_text_12 == se2.aes_cipher.io_output_text_12}
assume {se1.aes_cipher.io_output_valid & se2.aes_cipher.io_output_valid -> se1.aes_cipher.io_output_text_13 == se2.aes_cipher.io_output_text_13}
assume {se1.aes_cipher.io_output_valid & se2.aes_cipher.io_output_valid -> se1.aes_cipher.io_output_text_14 == se2.aes_cipher.io_output_text_14}
assume {se1.aes_cipher.io_output_valid & se2.aes_cipher.io_output_valid -> se1.aes_cipher.io_output_text_15 == se2.aes_cipher.io_output_text_15}

assert {bothValid -> io_out_resultOne == io_out_resultTwo}

set_prove_time_limit 3600
prove -bg -all
