;;
;; SICP Chapter1
;; Exercise 1.5
;;


(define (p) (p))
(define (test x y)
  (if (= x 0)
    0
    y))


;; 正規順序の評価を使う解釈系
; (test 0 (p))

; (if (= 0 0)
;		0
;		y))

; 0


;; 作用的順序の評価を使う解釈系
; (test 0 (p))

; (p) を評価しようとして無限再帰呼び出しになる.
