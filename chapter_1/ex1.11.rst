Exercise 1.11
=====================

.. math::

   n<3
   f(n) = n

   n\geq3
   f(n) = f(n-1) + 2f(n-2) + 3f(n-3)

再帰的プロセス

.. code-block:: scheme

   (define (f n)
     (if (< n 3)
         n
         (+ (f (- n 1))
            (* 2 (f (- n 2)))
            (* 3 (f (- n 3))))))


反復的プロセス

.. code-block:: scheme

   (define (f n)
     (define (iter a b c n)
       (cond
        [(< n 0) n]
        [(zero? n) a]
        [else (iter b c (+ c (* 2 b) (* 3 a)) (- n 1))]))
     (iter 0 1 2 n))
