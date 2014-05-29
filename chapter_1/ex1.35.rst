Exercise 1.35
=====================

========
解答
========

フィボナッチ数列の以下の式を考える.

.. math::
   
   x^2 - x - 1 = 0
   x は黄金比 0 でないので, 両辺を x で割って
   x - 1 - \flac{1}{x} = 0
   x = 1 + \flac{1}{x}
   ここで, f(x) = x の時,
   f(x) = x = 1 + \flac{1}{x}

よって, :math:`x \mapsto 1 + \flac{1}{x}` が示せた.
   x |-> 1 + 1/x has proven.

.. sourcecode:: scheme

    (fixed-point
      (lambda (x) (+ 1 (/ 1 x)))
      1.0))
    ;; => 1.6180327868852458

=================
実行コード
=================

.. sourcecode:: scheme
    
    (define (close-enough? x y)
      (< (abs (- x y)) 0.001))

    (define tolerance 0.00001)

    (define (fixed-point f first-guess)
      (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance))
      (define (try guess)
        (let ((next (f guess)))
          (if (close-enough? guess next)
              next
              (try next))))
      (try first-guess))

    (fixed-point
      (lambda (x) (+ 1 (/ 1 x)))
      1.0)
    ;; => 1.6180327868852458
