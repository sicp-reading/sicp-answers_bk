Exercise 1.8
=====================

.. sourcecode:: scheme

   (define (cubic-root-iter old-guess new-guess x)
     (if (good-enough? old-guess new-guess x)
         new-guess
         (cubic-root-iter new-guess (improve new-guess x)
   		       x)))

   (define (improve new-guess x)
     (/ (+ (/ x (square new-guess)) (* 2 new-guess)) 3))

   (define (square x) (* x x))

   (define (good-enough? old-guess new-guess x)
     (< (abs (- 1.0 (/ old-guess new-guess))) 0.001))

   (define (cubic-root x)
     (cubic-root-iter 1.0 x x))
