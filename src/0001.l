;;;; solution for Multiples of 3 or 5
;;;; https://projecteuler.net/problem=1


(defun h (m)
  (cond ((eq m 3) 3)
        ((eq (mod m 5) 0) (+ m (h (- m 1))))
        ((eq (mod m 3) 0) (+ m (h (- m 1))))
        (t (h (- m 1)))))

(defun sol (n) (h (- n 1)))

(sol 1000)
