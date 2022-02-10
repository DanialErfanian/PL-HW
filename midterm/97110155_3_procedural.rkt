#lang racket
; procedural
(define (empty-env)
  (list
   (lambda (var) 'not-set-variable)
   (lambda (var) #f)
   )
  )

(define (extend-env env var val)
  (list
   (lambda (search-var)
     (cond
       [(equal? search-var var) val]
       [else ((car env) var)]     
       )
     )
   (lambda (search-var)
     (cond
       [(equal? search-var var) #t]
       [else ((cadr env) var)]     
       )
     )
   )
  )

(define (has-binding? env var)
  ((cadr env) var)
  )

(define (apply env var)
  ((car env) var)
  )

(define (union env1 env2)
  (list
   (lambda (search-var)
     (cond
       [(has-binding? env2 search-var) (apply env2 search-var)]
       [else (apply env1 search-var)]     
       )
     )
   (lambda (search-var)
     (or (has-binding? env1 search-var) (has-binding? env2 search-var))
     )
   )
  )

(has-binding? (extend-env (empty-env) 'key 'value) 'key)
(apply (union (extend-env (empty-env) 'key2 'value)
              (extend-env (empty-env) 'key 'value2)
              )              'key2)