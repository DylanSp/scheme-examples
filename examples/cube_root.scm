#lang r5rs

(define (cuberoot-iter guess oldguess x)
  (if (good-enough? guess oldguess x)
      guess
      (cuberoot-iter (improve guess x)
                 guess
                 x)))
             
(define (improve guess x)
  (/ 
     (+ 
        (/ 
           x 
           (* guess guess)) 
        (* 2 guess))
     3))

(define epsilon 0.0001)

(define (good-enough? guess oldguess x)
    (< (/ (abs (- guess oldguess)) oldguess) epsilon))

(define (cuberoot x)
  (cuberoot-iter 1.0 0.0 x))