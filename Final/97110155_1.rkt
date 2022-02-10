#lang racket


(define (ex2 v1 v2)
  (let ([mk (begin
             (let ([var '()])
              (lambda ()
              (lambda (x) (begin
                            (set! var (append var x))
                                  var)))))
            ])
    (let ([f (mk)]
          [g (mk)])
      (begin
        (f (list v1))
        (g (list v2))
        (g '())))))

(ex2 3 6)
