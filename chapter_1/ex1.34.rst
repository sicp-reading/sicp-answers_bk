Exercise 1.34
=====================

======
解答
======

以下の手続き f を定義する.

.. sourcecode:: scheme 

   (define (f g)
     (g 2))

   (print (f square)) 
   ;; => 4

   (print (f (lambda (z) (* z (+ z 1))))) 
   ;; => 6

ここで (f f) の振る舞いを考える.

.. sourcecode:: sh

   gosh> (f f)
   *** ERROR: invalid application: (2 2)

- (f f)
- ((lambda (g) (g 2)) (lambda (g) (g 2)))
- (2 2)

処理系は (2 2) を評価することができず計算は終了する.
