#lang racket
(define (main l a b)
  (cond
    [(null? l) '()]
    [(equal? (car l) a) (cons b (cons a (main (cdr l) a b)))]
    [else (cons (car l) (main (cdr l) a b))]
  )
)
(main '(1 2 3 4 1) 1 'a)
