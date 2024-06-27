analyze -sva selfcomp_buggy_rolled.v

elaborate -top BuggyRolledTester -bbox_mul 256

#specify clock and reset
clock clock
reset reset -non_resettable_regs 0

stopat se1.aes_cipher.io_output_text0 
stopat se1.aes_cipher.io_output_text1
stopat se1.aes_cipher.io_output_text2
stopat se1.aes_cipher.io_output_text3
stopat se1.aes_cipher.io_output_text4
stopat se1.aes_cipher.io_output_text5
stopat se1.aes_cipher.io_output_text6
stopat se1.aes_cipher.io_output_text7
stopat se1.aes_cipher.io_output_text8
stopat se1.aes_cipher.io_output_text9
stopat se1.aes_cipher.io_output_text10
stopat se1.aes_cipher.io_output_text11
stopat se1.aes_cipher.io_output_text12
stopat se1.aes_cipher.io_output_text13
stopat se1.aes_cipher.io_output_text14
stopat se1.aes_cipher.io_output_text15

stopat se2.aes_cipher.io_output_text0 
stopat se2.aes_cipher.io_output_text1
stopat se2.aes_cipher.io_output_text2
stopat se2.aes_cipher.io_output_text3
stopat se2.aes_cipher.io_output_text4
stopat se2.aes_cipher.io_output_text5
stopat se2.aes_cipher.io_output_text6
stopat se2.aes_cipher.io_output_text7
stopat se2.aes_cipher.io_output_text8
stopat se2.aes_cipher.io_output_text9
stopat se2.aes_cipher.io_output_text10
stopat se2.aes_cipher.io_output_text11
stopat se2.aes_cipher.io_output_text12
stopat se2.aes_cipher.io_output_text13
stopat se2.aes_cipher.io_output_text14
stopat se2.aes_cipher.io_output_text15

stopat se1.aes_cipher.io_output_valid
stopat se2.aes_cipher.io_output_valid

assume {se1.aes_cipher.io_output_valid & se2.aes_cipher.io_output_valid -> se1.aes_cipher.io_output_text0 == se2.aes_cipher.io_output_text0}
assume {se1.aes_cipher.io_output_valid & se2.aes_cipher.io_output_valid -> se1.aes_cipher.io_output_text1 == se2.aes_cipher.io_output_text1}
assume {se1.aes_cipher.io_output_valid & se2.aes_cipher.io_output_valid -> se1.aes_cipher.io_output_text2 == se2.aes_cipher.io_output_text2}
assume {se1.aes_cipher.io_output_valid & se2.aes_cipher.io_output_valid -> se1.aes_cipher.io_output_text3 == se2.aes_cipher.io_output_text3}
assume {se1.aes_cipher.io_output_valid & se2.aes_cipher.io_output_valid -> se1.aes_cipher.io_output_text4 == se2.aes_cipher.io_output_text4}
assume {se1.aes_cipher.io_output_valid & se2.aes_cipher.io_output_valid -> se1.aes_cipher.io_output_text5 == se2.aes_cipher.io_output_text5}
assume {se1.aes_cipher.io_output_valid & se2.aes_cipher.io_output_valid -> se1.aes_cipher.io_output_text6 == se2.aes_cipher.io_output_text6}
assume {se1.aes_cipher.io_output_valid & se2.aes_cipher.io_output_valid -> se1.aes_cipher.io_output_text7 == se2.aes_cipher.io_output_text7}
assume {se1.aes_cipher.io_output_valid & se2.aes_cipher.io_output_valid -> se1.aes_cipher.io_output_text8 == se2.aes_cipher.io_output_text8}
assume {se1.aes_cipher.io_output_valid & se2.aes_cipher.io_output_valid -> se1.aes_cipher.io_output_text9 == se2.aes_cipher.io_output_text9}
assume {se1.aes_cipher.io_output_valid & se2.aes_cipher.io_output_valid -> se1.aes_cipher.io_output_text10 == se2.aes_cipher.io_output_text10}
assume {se1.aes_cipher.io_output_valid & se2.aes_cipher.io_output_valid -> se1.aes_cipher.io_output_text11 == se2.aes_cipher.io_output_text11}
assume {se1.aes_cipher.io_output_valid & se2.aes_cipher.io_output_valid -> se1.aes_cipher.io_output_text12 == se2.aes_cipher.io_output_text12}
assume {se1.aes_cipher.io_output_valid & se2.aes_cipher.io_output_valid -> se1.aes_cipher.io_output_text13 == se2.aes_cipher.io_output_text13}
assume {se1.aes_cipher.io_output_valid & se2.aes_cipher.io_output_valid -> se1.aes_cipher.io_output_text14 == se2.aes_cipher.io_output_text14}
assume {se1.aes_cipher.io_output_valid & se2.aes_cipher.io_output_valid -> se1.aes_cipher.io_output_text15 == se2.aes_cipher.io_output_text15}

assert {bothValid -> io_out_resultOne == io_out_resultTwo}

set_prove_time_limit 3600
prove -bg -all
