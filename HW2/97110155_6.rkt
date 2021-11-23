#lang racket
(define (root tree)
  (car tree)
  )

(define (left tree)
  (cadr tree)
  )
(define (right tree)
  (caddr tree)
  )

(define (main tree)
  (cond
    [(null? tree) tree]
    [else (append (main (left tree)) (cons (root tree) '()) (main (right tree)) '())]
  )
  )

(main '(8 (3 (1 () () )(6 (4 () () )(7 () () )))(10 () (14 (13 () () )() ) ) ))
