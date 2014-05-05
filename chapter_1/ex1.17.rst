.. comment

   SICP Chapter1
   Exercise 1.17

問
------

乗算が無いと仮定する条件下において, :math:`a*b = a + a * (b - 1)` を考える.

.. sourcecode:: scheme

   (define (* a b)
     (if (= b 0)
         0
         (+ a (* a (- b 1)))))

double 演算と halve 演算使い, fast-expt と類似の対数的ステップ数の乗算手続きを考える問題.

解法
-----

まず前提として与えられた式を定義しておく.

.. sourcecode:: scheme
  
   (define (double x) (+ x x))

   (define (halve x) (/ x 2))

与えられた以上の式を用いて乗算手続きを考えていく.

:math:`a*b` において,

- b = 0 の時, :math:`a*0 = 0`
- b が偶数の時, :math:`2a * b/2`
- b が奇数の時, :math:`a + a * (b - 1)`

を S 式に置き換える.

.. sourcecode:: scheme

   (define (multi a b)
     (cond ((= b 0) 0)
           ((even? b) (multi (double a) (halve b)))
           (else (+ a (multi a (- b 1))))))

実行コード
------------

.. sourcecode:: scheme

   (define (double x) (+ x x))

   (define (halve x) (/ x 2))

   (define (multi a b)
     (cond ((= b 0) 0)
           ((even? b) (multi (double a) (halve b)))
           (else (+ a (multi a (- b 1))))))

   (multi 7 8)
   ; 56

また, この例であげた (multi 7 8) の計算ステップは以下のようになる.

- (multi 7 8)
- (multi (double 7) (halve 8))
- (multi (* 7 2) (/ 8 2))
- (multi 14 4)
- (multi (double 14) (halve 4))
- (multi (* 14 2) (/ 4 2))
- (multi 28 2)
- (multi (double 28) (halve 2))
- (multi (* 28 2) (/ 2 2))
- (multi 56 1)
- (+ 56 (multi 56 (- 1 1)))
- (+ 56 (multi 56 0))
- (+ 56 0)
- 56
