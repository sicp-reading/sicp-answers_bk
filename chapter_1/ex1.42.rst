Exercise 1.42
=====================

------
解答
------

.. sourcecode:: scheme 

  (define (composition f g)
    (lambda (x) (f (g x)))  
  )

  ((compose square inc) 6) ; 49