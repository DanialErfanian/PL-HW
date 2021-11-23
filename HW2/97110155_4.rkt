#lang racket

(define (solve s c)
  (cond
    [(> 0 c) #f]
    [(null? s) (equal? c 0)]
    [(equal? (car s) #\() (solve (cdr s) (+ c 1))]
    [(equal? (car s) #\)) (solve (cdr s) (- c 1))]
    [else "error"]
    )
  )
(define (main s)
  (solve (string->list s) 0)
  )

(main "()(()())")
(main "())(()())")
