;;;; solution for Summation of primes
;;;; https://projecteuler.net/problem=10


(load "../ut.l")

(defun summation-of-primes (n)
  (apply '+ (do ((lst '(2 3))
                 (i 4 (+ i 1)))
             ((>= i n) lst)
             (when (ut/primep i)
               (setf lst (cons i lst))))))

;; (print (summation-of-primes 2000000)) ; should print 142913828922
