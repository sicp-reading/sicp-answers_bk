Exercise 1.21
=====================

.. sourcecode:: scheme

   (define (smallest-divisor n)
     (find-divisor n 2))

   (define (find-divisor n test-divisor)
     (cond ((> (square test-divisor) n) n)
           ((divides? test-divisor n) test-divisor)
           (else (find-divisor n (+ test-divisor 1)))))

   (define (square x) (* x x))

   (define (divides? a b)
     (= (remainder b a) 0))

   (smallest-divisor 199)    ;; => 199
   (smallest-divisor 1999)   ;; => 1999
   (smallest-divisor 19999)  ;; => 7

199, 1999, 19999 の最小除数はそれぞれ 199, 1999, 7 である.
よって 19999 は素数でないことが分かる.
