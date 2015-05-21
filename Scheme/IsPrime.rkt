#lang racket

;This program determines whether a given number is prime.

;Code in Java:
;for (int i = 2; i < (number / 2); i++) {
;    if (number % i == 0) {;
;	    isPrime = false;
;		break;
;	 }
;}

(define prime
  (lambda (n)
    (letrec ((loop
          (lambda (n i)
            (cond 
              ((= n 2) #t)
              ((= 0 (modulo n i)) #f) ;if (number % i == 0)
              ((> i (/ n 2)) #t) ;i < (number / 2)
              (else (loop n (+ i 1)))
              )
            )))
      (loop n 2)) ;start at 2
    )
  )

;prime(5)  will evaluate to be #t
(prime 5)
;prime(6) will evaluate to be #f
(prime 6)

(quote "Should be #t:")
(prime 17)
(prime 19)
(prime 53)
(prime 2)
(prime 211)
(prime 4231)

(quote "Should be #f:")
(prime 8)
(prime 100)
(prime 21)
(prime 9)
(prime 51)