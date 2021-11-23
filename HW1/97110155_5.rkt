#lang racket
(define (main l1 l2)
  (cond
    [(null? l1) l2]
    [(null? l2) l1]
    [else
     (if
      (positive? (- (car l2) (car l1)))
      (cons (car l1) (main (cdr l1) l2))
      (cons (car l2) (main l1 (cdr l2)))
      )
     ]
    )
  )

(main '(1 2 2 3 5 10 15) '(1 1 4 5 6 10))
