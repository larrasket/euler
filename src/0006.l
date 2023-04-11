;;;; solution for Sum square difference
;;;; https://projecteuler.net/problem=6

(defun sum-difference (n)
  (let ((sum 0)
        (usum 0))
    (do ((i 1 (+ i 1)))
        ((> i n))
      (setf sum (+ sum (expt i 2))
            usum (+ usum i)))
    (- (expt usum 2) sum)))

(sum-difference 100)                    ; => 25164150 (25 bits, #x17FF976)
