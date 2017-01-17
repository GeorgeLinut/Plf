;a 
(defun insertpos(l i e)
(cond
((null l ) nil)
((= (mod i 2) 0) (cons e (insertpos l (+ i 1)  e) ))
(T (cons (car l) (insertpos (cdr l) (+ i 1) e)))
)
)

;b
(defun flat(l)
(cond 
((null l) nil)
((atom (car l)) (cons (car l) (flat (cdr l))))
(T (append (flat (car l)) (flat (cdr l))))
)
)

(defun reversel(l)
(cond 
((null l) nil)
(T (cons (reversel (cdr l)) (car l)))
)
)

(defun mainB(l)
(reverse (flat l))
)

;c

(defun gcd(a b)
(cond
((= a 0) b)
((= b 0) a)
(T (gcd b (mod a b)))
)
)

(defun lingcd(l)
(cond
((null l) 0)
((listp (car l)) (gcd (lingcd (car l)) (lingcd (cdr l))))
((numberp (car l)) (gcd (car l) (lingcd (cdr l))))
(T (lingcd (cdr l)))
)
)

;d
(DEFUN occurences(l e)
  (COND 
   ((NULL l) 0)
   ((listp (car l)) ( + (occurences  (car l) e) (occurences (cdr l) e)))
   ((and (atom (car l)) (EQUAL e (car l))) ( + 1 (occurences (cdr l) e)))
   (T (occurences (cdr l) e))
  )
)