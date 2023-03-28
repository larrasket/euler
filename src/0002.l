;;;; solution for Even Fibonacci numbers
;;;; https://projecteuler.net/problem=2

(defun sol (limit)
  "Returns the sum of even Fibonacci numbers below the given limit."
  (labels ((fib (a b sum)
             (if (> b limit)
                 sum
                 (let ((new-sum (if (evenp b) (+ sum b) sum)))
                   (fib b (+ a b) new-sum)))))
    (fib 1 2 0)))


(sol 4e6)
