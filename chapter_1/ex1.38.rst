Exercise 1.38
=====================

========
解答
========

まず 1, 2, 1, 1, 4, 1, 1, 6, 1, 1, ... の一般項 :math:`a_{n}` を考える. (n は自然数とする)

.. math::

   \begin{cases}
    & n + 1 が 3 で割り切れる時 a_{n} = (n + 1) * \frac{2}{3} \\ 
    & それ以外の時 a_{n} = 1
   \end{cases}

これが :math:`e - 2` と等しいので, 求める解 e は :math:`e = a_{n} + 2` である. 
これを S 式に書き換える. 

.. sourcecode:: scheme 

   (define (e k)
     (+
       (cont-franc
         (lambda (i) 1.0)
         (lambda (i)
           (if (= (remainder (+ i 1) 3) 0)
               (* (+ i 1) (/ 2 3))
               1))
          k)
       2))

=================
実行コード
=================

k の値を 100 として実行する.

.. sourcecode:: scheme 

   (define (cont-franc n d k)
     (define (cont-franc-iter i)
       (if (= k i)
           (/ (n i) (d i))
           (/ (n i) (+ (d i) (cont-franc-iter (+ i 1))))))
     (cont-franc-iter 1))
   
   (define (e k)
     (+
       (cont-franc
         (lambda (i) 1.0)
         (lambda (i)
           (if (= (remainder (+ i 1) 3) 0)
               (* (+ i 1) (/ 2 3))
               1))
          k)
       2))

   (e 100)  ;; => 2.7182818284590455
