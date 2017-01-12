#lang r5rs

(define (f x)
    (cond ((= x 1) #t)
          ((= x 2) #f)))

; (f 3) produces no output in Racket