#!/usr/bin/sbcl --script
(define-condition my-division-by-zero (error) ())

(defun divide (x y)
    (if (= y 0)
        (error 'MY-DIVISION-BY-ZERO :dividend x))
    (/ x y))

(defun division-restarter (x y)
    (restart-case (divide 3 0)
      (return-zero () 0)
      (divide-by-one () (divide 3 1))))

(defun division-or-by-one (x y)
    (handler-bind
        ((error (lambda (c)
            (invoke-restart 'divide-by-one))))
        (division-restarter x y)))

(defun division-or-zero (x y)
    (handler-bind
        ((error (lambda (c)
            (invoke-restart 'return-zero))))
        (division-restarter x y)))

(print (division-or-zero 3 0))
(print (division-or-by-one 3 0))

