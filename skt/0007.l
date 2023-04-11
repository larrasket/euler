;;;; solution for 10001st prime
;;;; https://projecteuler.net/problem=7

(load "../src/0003.l")

(defun nst-prime (n)
  (do ((i 1 (+ i 1))
       (c 0))
      ((>= c n) i)
    (if (isPrime i)
      (setf c (+ c 1)))))


(defun find-nth-prime (n)
  (let ((count 0) (i 2))
    (loop while (< count n)
          do (when (isPrime i)
               (setq count (+ count 1)))
             (setq i (+ i 1)))
    (- i 1)))

(find-nth-prime 10001)
