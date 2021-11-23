#lang racket
(define (custom_append a l)
  (cond
    [(null? l) (cons a '())]
    [else (cons (car l) (custom_append a (cdr l)))]
    )
  )

(define (main l c)
  (cond
    [(null? l) '0]
    [(number? l) (if (zero? (- l c)) 1 0)]
    [else      (
                +
                (main (car l) c)
                (main (cdr l) c)
                )
               ]
    )
  )

(main '(2 3 1 ((4 3 5 6) 7 1 2 3 2) 4 5 2 7 10) 3)
