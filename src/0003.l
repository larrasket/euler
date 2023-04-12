;;;; solution for Largest prime factor
;;;; https://projecteuler.net/problem=3

(load "../ut.l")
(defun solve (n)
  (do ((s (floor (/ n 2))
          (if (evenp s)
              (- s 1)
              (- s 2))))
      ((and (helpers/primep s) (eq (mod n s) 0)) s)))

;; (solve 600851475143)
