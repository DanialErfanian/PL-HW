#lang racket
; data - type
(define (empty-env) '())

(define (extend-env env var val)
  (cons (cons var val) env)
  )

(define (has-binding? env var)
  (cond
    [(null? env) #f]
    [else (or (equal? var (caar env)) (has-binding? (cdr env) var))]
    )
  )

(define (apply env var)
  (cond
    [(null? env) 'not-set-variable]
    [else (if (equal? var (caar env)) (cdar env) (apply (cdr env) var))]
    )
  )

(define (union env1 env2)
  (append env1 env2)
  )

(has-binding? (extend-env (empty-env) 'key 'value) 'key)
(apply (union (extend-env (empty-env) 'key2 'value)
              (extend-env (empty-env) 'key 'value2)
              )              'key2)