(define real-eval (lambda (c) (
  eval c user-initial-environment
  )))

  (define b 1)
  (define c '(set! b 100))
  (real-eval c)
  (set-car! (cdr (cdr c)) 35)
  (real-eval c) 
