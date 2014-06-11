Exercise 1.41
=====================

------
解答
------

.. sourcecode:: scheme 

  (define (double f)
    (lambda (x) (f (f x)))  
  )

  ((double square) 5) ; 625

5の二乗した数(=25)をさらに二乗するので結果は625となる.

.. sourcecode:: scheme 

  (((double (double double)) inc) 5)

こちらの関数の挙動に関しては, 実際に double を紐解いて見ていきたい.

.. sourcecode:: scheme 

  (((double (double double)) inc) 5)
  (((double f) inc) 5) ; 簡単のために (double double) = f とした
  ((f(f inc)) 5)
  ( ((double double) ((double double) inc)) 5 )
  ( ((double double) ( double (double inc) )) 5 )
  ( ((double double) ( double inc2回 )) 5 )
  ( ((double double) ( inc 4回)) 5 )
  ( (double (double (inc4回))) 5 )
  ( (double (inc8回)) 5 )
  ( (inc16回) 5 ) ; 21

よって 21 を返すことがわかる.