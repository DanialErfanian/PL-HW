#lang racket
(define (main l c)
  (if
   (null? l)
   '()
   (
    cons
    (* (car l) c)
    (main (cdr l) c)
    )
   )
  )

(main '(2 6 10 2 5 0) 3)
