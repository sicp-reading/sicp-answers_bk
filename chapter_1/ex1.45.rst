Exercise 1.45
=====================

------
解答
------

とりあえず小さな値で試験ができるようにこんな手続きを作成する. fixed-point-of-transform で渡されている 手続きの中にあるyの階乗が「n-1」の部分である。すなわち, ここで n-1 回の階乗が行われる時, 求められる数値は x の n 乗根である.

.. sourcecode:: scheme 

  (define (n-times-average-damp n)
    (repeated average-damp n)
  )

  (define (n-sqrt x)
    (fixed-point-of-transform (lambda (y) (/ x (* y y ... )))
      (n-times-average-damp ... ))
      1.0
    )  
  )

試験的に値を渡していくと, 必要な計算回数は以下のようになる.

2乗根 y^1 = 1回  　　  
3乗根 y^2 = 1回  　　  
4乗根 y^3 = 2回  　　  
:  　　  
:  　　  
8乗根 y^7 = 3回  　　  
:  　　  
:  　　  
16乗根 y^15 = 4回  　　  

すなわち, n乗根の計算に必要となるaverage-dampの回数は log_2(n) 回となる.

続いて, n乗根を計算する手続きを作成する. この手続きは以下のようになる. 
なお, 回数は整数として渡す必要があるため, プリミティブな手続きであるfloorにより小数点以下を切り捨てる必要がある. 

.. sourcecode:: scheme 

  (define (log_2 x) (/ (log x) (log 2)))

  (define (n-sqrt x n)
    (fixed-point-of-transform
      (lambda (y) (/ x ((repeated (lambda (x) (* x y)) (- n 1)) 1)))
      (n-times-average-damp (floor (log_2 n)))
      1.0
    )  
  )


