#lang racket
(current-namespace (make-base-namespace))
(define (main input_file output_file)
  (
   with-output-to-file output_file
    (
     lambda () (print
                (
                 eval
                 (with-input-from-file input_file (lambda () (eval (read))))
                 )
                )
      )
    )
  )
(main "input.rkt" "output.txt")
