#lang racket


(define (ex4 v1 v2 v3 v4)
  (let ([mk (begin
             (let ([var '()]
                   [count 0])
              (lambda ()
              (lambda (x) (begin
                            (set! var (append var x))
                            (set! count (+ count 1))
                                  (list var count))))
              ))])
    (let ([f (mk)]
          [g (mk)])
      (begin
        (f (list v1) (list v2))
        (g (list v3) (list v4))
        (list (f '() '()) (g '() '()))))))

(ex4 1 2 3 4)
