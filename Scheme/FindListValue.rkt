#lang racket

;Examples of extracting a specific value from a list.

;a of the first list =
(define L1(list (list (list (list 'a)))))
(car (car (car (car L1))))

;3 of the second list = 
(define L2(list 1 (list 2 (list 3 4)) (list 5)))
(car (car (cdr (car (cdr L2)))))

;c of the third list = 
(define L3(list (list 'a (list)) (list (list 'c) (list 'd) 'b) 'e))
(car (car (car (cdr L3))))