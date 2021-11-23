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



(define (insert tree v)
  (cond
    [(null? tree) (cons v '(() ()))]
    [(> (root tree) v) (list (root tree) (insert (left tree) v) (right tree))]
    [else (list (root tree) (left tree) (insert (right tree) v))]
    )
  )

(define (main l)
  (cond
    [(null? l) '()]
    [else (insert (main (cdr l)) (car l))]
  )
  )

(main '(3 1 2))
; my program recevies input in reversed order