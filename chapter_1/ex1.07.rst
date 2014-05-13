Exercise 1.7
=====================

テキストにある good-enough? テストは以下のようなものである.

.. sourcecode:: scheme

   (define (good-enough? guess x)
     (< (abs (- (square guess) x)) 0.001))

また一番初めの予測値を 1.0 としている.

ここで以下の2つの場合の数を考える.

小さい数字のとき, 例えば1.0e-30を計算したいとする.
   このとき答えとして1.0e-15になってほしい.
   しかし improve による改善が十分に行われないうちに good-enough? が真を返す.
   これは good-enough? テストが, 改善前の値と改善後の値を比較していないためである.
   小さい数の時に, 単純に予測値の二乗と被開平数の差をとるだけならば, すぐに真が返ってしまう.

大きい数字のとき, 例えば1.0e30を計算したいとする.
   このとき答えとして1.0e15になってほしい.
   しかし, good-enough? テストで予測値の二乗を計算すると桁溢れがおこり, 正しく計算できなくなる.

そこで guess の変化に注目して設計すると, 大きい数, 小さい数にたいして有効に働く.

.. sourcecode:: scheme

   (define (sqrt-iter old-guess new-guess x)
     (if (good-enough? old-guess new-guess x)
         new-guess
         (sqrt-iter new-guess (improve new-guess x)
                    x)))

   (define (improve x y)
     (average x (/ y x)))

   (define (average x y)
     (/ (+ x y) 2))

   (define (good-enough? old-guess new-guess x)
     (< (abs (- 1.0 (/ old-guess new-guess))) 0.001))

   (define (sqrt x)
     (sqrt-iter 1.0 x x))
