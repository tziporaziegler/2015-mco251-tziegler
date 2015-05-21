#lang racket

;This program determines the maximum and minimum numbers of a given list.

(define (maxmin L)
  (cond
    ((null? L) '()) ;; empty list represents error
    ((null? (cdr L)) (list (car L) (car L))) ;; if one item return a list of 2 items
    (else
    (find (cdr L) (car L) (car L))
     )))
     
     (define find
       (lambda (L min max)
         list min
         (cond
           ((null? L) (list max min))
           ((< (car L) min) (find (cdr L) (car L) max)) ;min value = car L
           ((> (car L) max) (find (cdr L) min (car L))) ;max value = car L
           (else (find (cdr L) min max))
     )))

(maxmin (list 4 5 6 3 2 9 2 3))
;should evaluate as: '(9 2)