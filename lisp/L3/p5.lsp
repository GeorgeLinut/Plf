(defun suma (l)
  (cond 
   ((and (numberp l) (= (mod l 2) 0)) (- 0 l))
   ((and (numberp l) (= (mod l 2) 1)) (- l 0))
   ((atom l) 0)
   (T (apply #'+ ( mapcar #'suma l)))
)
)