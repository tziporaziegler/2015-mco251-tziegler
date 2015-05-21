#lang racket
;calculate sum, skipping one value
(define sumSkip
    (lambda (L skip) ;stores yourList and the number you want to skip
       (define loop
          (lambda (L L2 total) ;yourList, (1,5,10...) list, running total
             (cond
               ((null? L) (list total)) ;print the total when finish yourList

               ;if the next number is the skip number, just move on to next value
               ((= (car L2) skip) (loop L (cdr L2) total)) 

               ;otherwise, increase total and send in both lists, minus the head, to the loop
               (else (loop (cdr L) (cdr L2) (+ total (* (car L) (car L2)) ))) 
              )
           )
        )(loop L (list 1 5 10 20 50 100) 0) ;initial values of loop
    )
)

;send in your list of numbers, plus the value place you want to skip
(sumSkip (list 3 1 2 0 2) 20) ; ==> 228



;calculate sum, filling in 0 for all unwanted values
(define sum
    (lambda (one five ten twenty fifty hundred)
        (+ (* 1 one) (* 5 five) (* 10 ten) (* 20 twenty) (* 50 fifty) (* 100 hundred) )
    )
)

(sum 3 1 2 0 0 2)