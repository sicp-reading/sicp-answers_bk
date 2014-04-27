
.. math::
   n<3
   f(n) = n

   n\leq3
   f(n) = f(n-1) + 2f(n-2) + 3f(n-3)


.. code-block:: scheme

   (define (f n)
     (if (< n 3)
         n
         (+ (f (- n 1))
            (* 2 (f (- n 2)))
            (* 3 (f (- n 3))))))

   (define (f n)
     (define (iter a b c n)
       (if (zero? n)
           a
           (iter b c (+ c (* 2 b) (* 3 a)) (- n 1))))
     (iter 0 1 2 n))
