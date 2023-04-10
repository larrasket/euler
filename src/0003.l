;;;; solution for Largest prime factor
;;;; https://projecteuler.net/problem=3

(defun isPrime (n)
  (cond ((or (eq n 2)) t)
        ((or (evenp n) (eq (mod n 3) 0) (<= n 1)) nil)
        (t (do ((i 5 (+ i 2)))
               ((>= (* i i) n) t)
             (cond ((eq (mod n i) 0) (return nil)))))))

(defun solve (n)
  (do ((s (floor (/ n 2))
          (if (evenp s)
              (- s 1)
              (- s 2))))
      ((and (isPrime s) (eq (mod n s) 0)) s)))

;; (solve 600851475143)
