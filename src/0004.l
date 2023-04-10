;;;; solution for Largest palindrome product
;;;; https://projecteuler.net/problem=4

(defun palindrome-p (n)
  "Check if the number is palindrome or not."
  (string= (write-to-string n) (string (reverse (write-to-string n)))))

(defun largest-palindrome (n)
  (loop with start = (expt 10 (1- n))
        and end = (1- (expt 10 n))
        for i from start to end
        maximize (loop for j from i to end
                       for num = (* i j)
                       when (palindrome-p num)
                       maximize num)))

(defun solve (n) (largest-palindrome n))

(solve 3)
