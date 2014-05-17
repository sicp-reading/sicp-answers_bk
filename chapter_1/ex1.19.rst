Exercise 1.19
=====================

解法
-------

a ← a + b, b ← a への変換 T を以下の行列式に置き換えて計算する.

.. math::

   \begin{pmatrix}
   a+b\\ 
   b
   \end{pmatrix}
   = T 
   \begin{pmatrix}
   a\\ 
   b
   \end{pmatrix}

   \begin{pmatrix}
   a+b\\ 
   b
   \end{pmatrix}
   =
   \begin{pmatrix}
   1 & 1\\ 
   1 & 0
   \end{pmatrix}
   \begin{pmatrix}
   a\\ 
   b
   \end{pmatrix}

   よって

   T =
   \begin{pmatrix}
   1 & 1\\ 
   1 & 0
   \end{pmatrix}
   A_0 = 
   \begin{pmatrix}
   a\\ 
   b
   \end{pmatrix}


上式から :math:`A_n = T^n A_0` と導出できる.

次に, a ← bq + aq + apとb ← bp + aq への変換 T' を同様に考えて行く.

.. math::

   \begin{pmatrix}
   bq + aq + ap\\ 
   bp + aq
   \end{pmatrix}
   = T_{p,q}
   \begin{pmatrix}
   a\\ 
   b
   \end{pmatrix}

   ここで T_{p,q} を 
   \begin{pmatrix}
   x & y\\ 
   z & w
   \end{pmatrix}
   とおくと,

   \begin{pmatrix}
   bq + aq + ap\\ 
   bp + aq
   \end{pmatrix}
   = 
   \begin{pmatrix}
   x & y\\ 
   z & w
   \end{pmatrix}
   \begin{pmatrix}
   a\\ 
   b
   \end{pmatrix}
   = 
   \begin{pmatrix}
   xa + yb\\ 
   za + wb  
   \end{pmatrix}

   展開すると

   \begin{cases}
   & bq + aq + ap =  xa + yb\\ 
   & bp + aq =  za + wb 
   \end{cases}

   2 式から, x = p+q, y = q, z = q, w = p と導出できるので

   T_{p,q}
   =
   \begin{pmatrix}
   p+q & q\\ 
   q & p
   \end{pmatrix}

   また

   A_0
   =
   \begin{pmatrix}
   a\\ 
   b
   \end{pmatrix}

   とする.

上式から :math:`A_n = T_{p,q}^n A_0` が導出できる.

これを使って :math:`T_{p,q}^2` を展開し, 解が :math:`T_{p',q'}` となることを証明する.

.. math::

   T_{p,q}^2
   =
   \begin{pmatrix}
   p+q & q\\ 
   q & p
   \end{pmatrix}
   \begin{pmatrix}
   p+q & q\\ 
   q & p
   \end{pmatrix}
   =
   \begin{pmatrix}
   (p+q)^2 + q & (p+q)q + pq\\ 
   (p+q)q + pq & p^2 + q^2
   \end{pmatrix}
   =
   \begin{pmatrix}
   (p^2 + q^2) + (2pq + q^2) & (2pq + q^2)\\ 
   (2pq + q^2) & (p^2 + q^2)
   \end{pmatrix}

   ここで, p' = p^2 + q^2, q' = 2pq + q^2 とおくと
   
   T_{p,q}^2
   =
   \begin{pmatrix}
   p' + q' & q'\\ 
   q' & p'
   \end{pmatrix}

よって :math:`T_{p,q}^2 = T_{p',q'}` となることが示せた.

これらを使って命題である (fib-iter a b p q count) を定義する. 問題より,

.. math::

   \begin{cases}
   & \text{ n が奇数: }  A_n = (T^{n/2})^2 A_0 \\ 
   & \text{ n が偶数: }  A_n = T_{p,q} A_{n-1} 
   \end{cases}

   がわかっているのでさらに展開して

   n が奇数の時:

   \begin{pmatrix}
   a\\ 
   b\\ 
   p'\\ 
   q' \\
   count/2
   \end{pmatrix}
   =
   \begin{pmatrix}
   a\\ 
   b\\ 
   p^2 + q^2\\ 
   2pq + q^2 \\
   count/2
   \end{pmatrix}

   n が偶数の時:

   \begin{pmatrix}
   T_{p,q} A_{n-1} \\ 
   p\\ 
   q \\
   count-1
   \end{pmatrix}
   =
   \begin{pmatrix}
   bq + aq + ap\\ 
   bp + aq\\ 
   p\\ 
   q \\
   count-1
   \end{pmatrix}

上式を S 式に置き換えたものが解答となる.

解答
-------

.. sourcecode:: scheme

   (define (Fib n)
       (Fib-iter 1 0 0 1 n))
 
   (define (Fib-iter a b p q count)
       (cond
           ((= count 0) b)
           ((even? count) 
             (Fib-iter a b (+ (* p p) (* q q)) (+ (* 2 p q) (* q q)) (/ count 2)))
           (else
             (Fib-iter (+ (* b q) (* a q) (* a p)) (+ (* b p) (* a q)) p q (- count 1)))))
