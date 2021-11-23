#lang racket
(define (custom_append a l)
  (cond
    [(null? l) (cons a '())]
    [else (cons (car l) (custom_append a (cdr l)))]
    )
  )

(define (main l)
  (cond
    [(null? l) '()]
    [(number? l) l]
    [else      (
                custom_append
                (main (car l))
                (main (cdr l))
                )
               ]
    )
  )

(main '(1 (2 3 4) 4 5 (3 2)))
