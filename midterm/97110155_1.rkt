#lang racket
(define (solve l l1 l2 bias)
  (cond
    [(null? l) (if (zero? bias) (list l1 l2) #f)]
    [else
     (or
      (solve (cdr l) (append l1 (list (car l))) l2 (+ bias (car l)))
      (solve (cdr l) l1 (append l2 (list (car l))) (- bias (car l)))
      )
     ]
    )
  )

(define (main l)
  (or (solve l '() '() 0) "impossible")
  )

(main '(1 2 3))
(main '(1 5 3 1 2))
(main '(1 2))