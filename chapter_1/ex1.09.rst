Exercise 1.9
=====================

.. sourcecode:: scheme

   (define (inc n)
     (+ n 1))

   (define (dec n)
     (- n 1))

| + をそのまま定義しなおすと inc と dec の定義で使っている + と被り
循環参照してしまうので, ここでは + の代わりに plus 関数を定義する.

.. sourcecode:: scheme

   (define (plus a b)
     (if (= a 0)
         b
         (inc (plus (dec a) b))))

   (plus 4 5)

   ;; 評価の様子
   (inc (plus 3 5))
   (inc (inc (plus 2 5)))
   (inc (inc (inc (plus 1 5))))
   (inc (inc (inc (inc (plus 0 5)))))
   (inc (inc (inc (inc 5))))
   (inc (inc (inc 6)))
   (inc (inc 7))
   (inc 8)
   9

遅延演算の列を成していて, 線形に膨張と収縮をしているため, 再帰的プロセスである.

.. sourcecode:: scheme

   (define (plus a b)
     (if (= a 0)
         b
         (+ (dec a) (inc b))))

   (plus 4 5)

   ;; 評価の様子
   (plus 3 6)
   (plus 2 7)
   (plus 1 8)
   (plus 0 9)
   9

プロセスが伸縮せずに常にどの段階からでも計算を再開できるので, 反復的プロセスである.

また SLIB ライブラリを使用することによって, どのような引数でどういう順序でよばれたかトレースできる.

.. sourcecode:: scheme

   (use slib)
   (require 'trace)

   (trace plus)
   (plus 4 5)
