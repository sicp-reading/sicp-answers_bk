.. comment

   SICP Chapter1
   Exercise 1.18

解法
-----

1.16, 1.17 を使って解く.

.. sourcecode:: scheme

   (define (multi-iter n a b)
     (cond ((= b 0) n)
           ((even? b) (multi-iter n (double a) (halve b)))
           (else (multi-iter (+ n a) a (- b 1)))))
   
   (define (multi a b)
     (multi-iter 0 a b))

実行コード
------------

.. sourcecode:: scheme

   (define (double x) (+ x x))

   (define (halve x) (/ x 2))

   (define (multi-iter n a b)
     (cond ((= b 0) n)
           ((even? b) (multi-iter n (double a) (halve b)))
           (else (multi-iter (+ n a) a (- b 1)))))
   
   (define (multi a b)
     (multi-iter 0 a b))

   (multi 7 8)
   ; 56

また, この例であげた (multi 7 8) の計算ステップは以下のようになる.

- (multi 7 8) 
- (multi-iter 0 7 8)
- (multi-iter 0 (double 7) (halve 8))
- (multi-iter 0 (+ 7 7) (/ 8 2))
- (multi-iter 0 14 4)
- ...
- (multi 56 1)
- (multi-iter (+ 0 56) 56 (- 1 1))
- (multi-iter 56 56 0)
- 56
