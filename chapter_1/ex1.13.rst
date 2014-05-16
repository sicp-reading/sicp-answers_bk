Exercise 1.13
=====================

証明すべき命題は以下である.

.. math::

   Fib(n) は \frac{\phi^n}{\sqrt 5} に最も近い整数である

これを証明するにはまず :math:`Fib(n) = \frac{\phi^n - \psi^n}{\sqrt 5}` であることを帰納法とフィボナッチの定義から証明する.

.. math::

   Fib(n) = \frac{\phi^n - \psi^n}{\sqrt 5} であることの証明

   ただし \phi = \frac{1 + \sqrt 5}{\sqrt 2} であり, \phi^2 = \phi + 1 を満たす. (\psi も同様)

   [1]

   Fib(0) = 0, Fib(1) = 1 なので n = 0, 1 のとき正しい

   [2]

   n = k, k + 1 のとき与式が成り立つと仮定すると

   Fib(k) = \frac{\phi^k - \psi^k}{\sqrt 5} , Fib(k+1) = \frac{\phi^(k+1) - \psi^(k+1)}{\sqrt 5}

   n = k + 2 のとき

   Fib の定義より

   Fib(k+2) = Fib(k+1) + Fib(k)

            = \frac{\phi^(k+1) - \psi^(k+1)}{\sqrt 5} + \frac{\phi^k - \psi^k}{\sqrt 5}

            = \frac{\phi^k (k+1) - \psi^k (k+1)}{\sqrt 5}

            = \frac{\phi^k \phi^2 - \psi^k \psi^2}{\sqrt 5}

            = \frac{\phi^(k+2) - \psi^(k+2)}{\sqrt 5}

   よって [1], [2] より自然数 n について Fib(n) = \frac{\phi^n - \psi^n}{\sqrt 5} であることが証明できた.


これより本題の証明に入る.

.. math::

   Fib(n) が \frac{\phi^n}{\sqrt 5} に最も近い整数であることを証明するには

   誤差関数 Fib_d(n) = \left| \frac{\phi^n - \psi^n}{\sqrt 5} - \frac{\phi^n}{\sqrt 5} \right| < 0.5 であることが証明できればよい.

   整理すると

   \left| \frac{\phi^n - \psi^n}{\sqrt 5} - \frac{\phi^n}{\sqrt 5} \right|

   = \left| - \frac{\psi^n}{\sqrt 5} \right|

   = \left| \frac{\psi^n}{\sqrt 5} \right|

   ここで n = 1 のとき,

   Fib_d(1) = \left| \frac{\psi^1}{\sqrt 5} \right| = 0.27639 ... < 0.5

   であり, さらに

   \left| \psi \right| < 1 なので誤差関数 Fib_d(n) は減少関数となる.

   以上により題意は証明された.
