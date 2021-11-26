#lang racket

(define (diff t1 t2)
  (cons t1 t2)
  )
(define (one)
  '(one)
 )

(define (zero)
  (diff (one) (one))
  )


(define (get_value diff_tree)
  (cond
    [(equal? diff_tree (one)) 1]
    [else (- (get_value (car diff_tree)) (get_value (cdr diff_tree)))]
    )
  )
(define (successor x)
  (diff x (diff (zero) (one)))
  )

(define (predecessor x)
  (diff x (one))
  )

; x + y = x - (0 - y)
(define (diff-tree-plus x y)
  (diff x (diff (zero) y))
 )


(get_value (predecessor (zero)))
(get_value (predecessor (predecessor (predecessor (zero)))))
(get_value (diff-tree-plus (successor (zero)) (predecessor (predecessor (predecessor (zero))))))
