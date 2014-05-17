Exercise 1.4
=====================

.. sourcecode:: scheme 

   (define (a-plus-abs-b a b)
     ((if (> b 0) + -)
           a
           b))


   ;; test
   (print (a-plus-abs-b 3 -6))
   ; 9
   (print (a-plus-abs-b 3 6))
   ; 9
