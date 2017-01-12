#lang r5rs

; taken from http://www.cs.odu.edu/~zeil/cs355/Handouts/schemedoc/schemedoc/node16.html

(define (partition compare l1)
      (cond
         ((null? l1) '())
         ((compare (car l1)) (cons (car l1) (partition compare (cdr l1))))
         (else (partition compare (cdr l1)))))

(define (quicksort l1)
    (cond ((null? l1) '())
          (else (let ((pivot (car l1)))
                (append (append (quicksort (partition (lambda (x) (< x pivot)) l1))
                       (partition (lambda (x) (= x pivot)) l1))
                    (quicksort (partition (lambda (x) (> x pivot)) l1)))))))
                
(define tests (and (equal? '(1 2 3 4 5) (quicksort '(5 4 3 1 2)))
                   (equal? '() (quicksort '()))
                   (equal? '(1 2 3 4 5) (quicksort '(1 2 3 4 5)))
                   ))