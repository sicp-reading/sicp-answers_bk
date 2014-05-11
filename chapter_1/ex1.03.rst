Exercise 1.3
=====================

.. sourcecode:: scheme

   (define (square n) (* n n))

   (define (sum-square x y)
     (+ (square x) (square y)))

   (define (fact a b c) 
      (if (>= a b) 
          (sum-square a (if (>= b c) b c)) 
          (sum-square b (if (>= a c) a c)))) 
