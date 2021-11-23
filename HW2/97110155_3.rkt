#lang racket
(define (mul c l)
  (cond
    [(null? l) '()]
    [else (cons (cons c (cons (car l) '())) (mul c (cdr l)))]
  )
  )

(define (main l1 l2)
  (cond
    [(null? l1) '()]
    [else (cons (mul (car l1) l2) (main (cdr l1) l2))]
  )
  )


(main '(1 2) '(3 4 5 6))