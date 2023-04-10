;;;; solution for Smallest multiple
;;;; https://projecteuler.net/problem=5

;; it's an lcd problem. lcd can be calculated using the full muliplication
;; divised by the gcd for the all numbers.


(defun lgcd (lst)
  (cond ((>= (length lst) 2 ) (let* ((g (gcd (first lst) (second lst)))
                                     (c (* (/ (abs (* (first lst)
                                                      (second lst)))
                                              g))))
                                (lgcd (cons c (cdr (cdr lst))))))
        ((= (length lst) 1) (car lst))
        (t 1)))


(defun solve (n)
  (let* ((lst (do ((i 1 (+ i 1))
                   (result ()))
                  ((> i n) (reverse result))
                (push i result))))
    (lgcd lst)))


(solve 20)                              ;; => 232792560 (28 bits, #xDE021F0)
