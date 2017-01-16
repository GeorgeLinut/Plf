(defun or_list (l)
(cond
((null l) nil)
(T (or (car l) (or_list (cdr l))))
)
)

(defun in_list(l e)
(cond
((null l) nil)
((and (atom l) (equal l e)) T)
((and (atom l)) Nil)
(T (apply #'or_list (mapcar #'(lambda (v)
                           (in_list v e)) l)))

)
)