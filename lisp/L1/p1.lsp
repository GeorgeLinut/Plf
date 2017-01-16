;a
(defun nthList(l n)
(cond 
 ((null l ) nil)
 ((equal n 1) (car l))
 (T (nthList (cdr l) (- n 1)))
)
)
;b
(defun in_List(l e)
(cond 
 ((null l) nil)
 ((listp (car l)) (or(in_List (car l)) (in_List (cdr l)) ))
 ((equal (car l) e) T)
 (T (in_List(cdr l)))
)
)
;c
(defun sublists(l)
(cond
((null l) nil)
((listp (car l)) (cons (car l) (append (sublists (cdr l)) (sublists (car l))))) 
(T (sublists (cdr l)))
)
)

;c main

(defun mainC(l)
(cons l (sublists l))
)

;d

(defun linset(l)
(cond 
(( null l) nil)
((not (in_List (cdr l) (car l))) (cons (car l) (linset (cdr l))))
(T (linset (cdr l)))
)
)

