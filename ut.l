;; some small utilities used over the codebase



(defun ut/primep (n)
  (cond ((<= n 1) nil)
        ((= n 2) t)
        ((evenp n) nil)
        (t (do ((i 3 (+ i 2)))
               ((> (* i i) n) t)
               (when (= (mod n i) 0) (return nil))))))
