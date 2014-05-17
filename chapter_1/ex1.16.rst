Exercise 1.16
=====================

解法
------

逐次平方を使い, 累乗を求める式を考える.

:math:`b^n` において,

- n = 0 の時, :math:`b^0 = 1`
- n が偶数の時, :math:`(b^n/2) * (b^n/2) = b^n`
- n が奇数の時, :math:`b * b^{n-1} = b^n`

を以下の fast-expt として定義する.

.. sourcecode:: scheme

   (define (fast-expt b n)
     (cond ((= n 0) 1)
           ((even? n) (square (fast-expt b (/ n 2))))
           (else (* b (fast-expt b (- n 1))))))
   
同様に逐次平方を用いて対数的ステップ数の反復的べき乗プロセスを生成する手続きを考える. ヒントを参考に, 指数 n と底 b の他にもう一つの状態変数 a を用意し計算のステップ数を少なくさせることができる.

:math:`a * b^n` において以下のように考える.

- n = 0 の時, :math:`a * b^0 = 1`
- n が偶数の時, :math:`a * (b^2)^{n/2} = a * b^n`
- n が奇数の時, :math:`ab * b^{n-1} = a * b^n`

この式を S 式に置き換える.

.. sourcecode:: scheme

   (define (fast-expt-iter a b n)
     (cond ((= n 0) 1)
           ((even? n) 
             (fast-expt-iter a (square b) (/ n 2)))
           (else 
             (fast-expt-iter (* a b) b (- n 1)))))

   (define (fast-expt b n)
     (fast-expt-iter 1 b n))

実行コード
------------

.. sourcecode:: scheme
    
   (define (square x)
     (* x x))

   (define (fast-expt-iter a b n)
     (cond ((= n 0) a)
           ((even? n) 
             (fast-expt-iter a (square b) (/ n 2)))
           (else 
             (fast-expt-iter (* a b) b (- n 1)))))

   (define (fast-expt b n)
     (fast-expt-iter 1 b n))

   (fast-expt 2 8)
   ;; => 256

また, この例であげた (fast-expt 2 8) の計算ステップは以下のようになる.

- (fast-expt 2 8)
- (fast-expt-iter 1 2 8)
- (fast-expt-iter 1 (square 2) (/ 8 2))
- (fast-expt-iter 1 4 4)
- (fast-expt-iter 1 (square 4) (/ 4 2))
- (fast-expt-iter 1 16 2)
- (fast-expt-iter 1 (square 16) (/ 2 2))
- (fast-expt-iter 1 256 1)
- (fast-expt-iter (* 1 256) 256 (- 1 1)))
- (fast-expt-iter 256 256 0))
- 256
