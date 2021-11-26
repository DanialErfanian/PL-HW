#lang racket

(define (zero N)
  (list N '(0))
  )

(define (dastan l x)
  (cond
    [(null? l) (cons x '())]
    [else (cons (+ (car l) x) (cdr l))]
    )
  
  )

(define (normalize x N)
  (cond
    [(null? x) x]
    [(and (null? (cdr x)) (zero? (car x))) '()] 
    [
     (>= (car x) N)
     (cons (modulo (car x) N) (normalize (dastan (cdr x) (quotient (car x) N)) N))
     ]
    [
     (< (car x) 0)
     (cons (modulo (+ (car x) N) N) (normalize (dastan (cdr x) -1) N))
     ]
    [else x]
    )
  )

(define (successor x)
  (list
   (car x)
   (cond
     [(null? (cadr x)) '(1)]
     [else (normalize (cons (+ 1 (caadr x)) (cdadr x)) (car x))]
     )
   )
  )


(define (predecessor x)
  (list
   (car x)
   (normalize (cons (+ -1 (caadr x)) (cdadr x)) (car x))
   )
  )

(successor (successor (successor (zero 3))))
(predecessor (successor (successor (successor (zero 3)))))
(predecessor (predecessor (successor (successor (successor (zero 3))))))
(successor (predecessor (predecessor (predecessor (successor (successor (successor (zero 3))))))))
