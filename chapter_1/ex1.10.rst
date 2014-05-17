Exercise 1.10
=====================

.. sourcecode:: scheme

   (define (A x y)
     (cond ((= y 0) 0)
           ((= x 0) (* 2 y))
           ((= y 1) 2)
           (else (A (- x 1)
                    (A x (- y 1))))))

   (A 1 10) ;; => 1024
   (A 2 4) ;; => 65536
   (A 3 3) ;; => 65536

.. sourcecode:: scheme

   (define (f n) (A 0 n))

:math:`2n`

.. sourcecode:: scheme

   (define (g n) (A 1 n))

:math:`2^n`

.. sourcecode:: scheme

   (define (h n) (A 2 n))

:math:`F_0 = 0, F_1 = 2, F_n = (F_{n-1})^2`
