Exercise 1.46
=====================

------
解答
------

.. sourcecode:: scheme 

  (define (iterative-improve enough? improve)
    (lambda (guess)
      (define (iter guess)
        (let ((next (improve guess)))
          (if (enough? next guess)
            next
            (iter next))))
      (iter guess)))

iterative-improveを使用した平方根の手続きは以下のようになる.

.. sourcecode:: scheme 

  (define (sqrt x)
    (define (close-enough? v1 v2)
      (< (abs (- v1 v2)) 0.0000001))
    (iterative-improve
      close-enough?
      (lambda (y) (average y (/ x y)))))

  ((sqrt 3) 1.0); 1.7320508075688772

また, iterative-improveを使用したfixed-pointの手続きは以下のようになる.

.. sourcecode:: scheme 

  (define (fixed-point-improved f)
    (define (close-enough? v1 v2)
      (< (abs (- v1 v2)) 0.0000001))
    (iterative-improve
      close-enough?
      (lambda (x) (average x (f x)))))

また, 実際に fixed-point-improved手続きを使用したsqrt手続きは以下のように記述することができる.

.. sourcecode:: scheme 

  (define (sqrt x)
      (fixed-point-improved (lambda (y) (/ x y))))

  ((sqrt 3) 1.0) ; 1.7320508075688772

なお, sqrt手続きにおいて渡している 1.0 という数値は 最初の guess にあたる. guessを関数の外に出しておくことに関して, プログラムとしての可読性は下がってしまうが, 例えば guessの際に対数などがからんでくる場合( guess が 1だと log(1) = 0 となってしまう )などを考慮して 外に出しておくとつぶしがきく場合がある.