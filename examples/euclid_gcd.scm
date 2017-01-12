#lang r5rs

(define (gcd a b)
    (cond ((<= a 0) (gcd (* -1 a) b))
          ((< b 0) (gcd a (* -1 b)))
          ((< a b) (gcd b a))
          ((= b 0) a)
          (else (gcd b (remainder a b)))))

(define tests (and (= 2 (gcd 6 8))
                   (= 2 (gcd 8 6))
                   (= 2 (gcd 6 -8))
                   (= 1 (gcd 13 7))
                   ))