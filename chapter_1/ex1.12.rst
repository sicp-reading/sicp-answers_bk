Exercise 1.12
=====================


パスカルの三角形の要素を求める

.. code-block:: scheme

   (define (pascal row col)
     (cond
      ((or (< col 0) (< row 0)) 0)
      ((> col row) 0)
      ((or (= row 1)(= col 1)) 1)
      (else
       (+ (pascal (- row 1) (- col 1))
          (pascal (- row 1) col)))))
