#lang racket
(define (len1 lis sofar)
  (if (null? lis) sofar 
  (len1 (cdr lis) (+ sofar 1))))

;len will call len1
(define (len lis) 
  (len1 lis 0))


;call the len function
(len (list 2 3 4 5 6 7))
;will evaluate to be 6