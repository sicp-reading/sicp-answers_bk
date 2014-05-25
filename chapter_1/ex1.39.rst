Exercise 1.39
=====================

========
解答
========

.. sourcecode:: scheme 

   (define (tan-cf x k)
     (cont-franc
       (lambda (i)
         (if (= i 1)
             x
             (- (square x))))
       (lambda (i) (- (* 2 i) 1))
       k))

=================
実行コード
=================

.. sourcecode:: scheme 

   (define square (lambda (i) (* i i)))

   (define (cont-franc n d k)
     (define (cont-franc-iter i)
       (if (= k i)
           (/ (n i) (d i))
           (/ (n i) (+ (d i) (cont-franc-iter (+ i 1))))))
     (cont-franc-iter 1))

   (define (tan-cf x k)
     (cont-franc
       (lambda (i)
         (if (= i 1)
             x
             (- (square x))))
       (lambda (i) (- (* 2 i) 1))
       k))

   (use math.const)
   (tan-cf (/ pi 4) 100)
   ;; => 1.0
