Exercise 1.44
=====================

------
解答
------

Exercise 1.43 の repeated では square関数に 5という数値が引数として渡ったが, 今回は cube という手続きを引数として渡している点に注目.
表現の広さに最初は若干混乱するが, 「引数」を渡しているという観点で考えると理解しやすい.

.. sourcecode:: scheme 

  (define (smooth f)
    (lambda (x) (/ (+ (f (+ x dx)) (f x) (f (- x dx))) 3) )
  )

  ((smooth cube) 3)

  (define (n-fold-smooth n f)
    ((repeated smooth n) f)
  )

  ((n-fold-smooth 5 cube) 3) ; smoothを5回適用する