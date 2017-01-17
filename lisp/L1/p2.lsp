(DEFUN len(l c)
  (COND
   ((NULL l) c)
   (T (len (CDR l) (+ 1 c)))
  )
)


(DEFUN prod(l1 l2 s)
  (COND
   ((not(EQUAL (len l1 0) (len l2 0))) NIL)
   ((NULL l1) s)
   ((NULL l2) s)
   (T (prod (CDR l1) (CDR l2) (+ s (* (CAR l1) (CAR l2)))))
  )
)

(DEFUN main2a(l1 l2)
  (prod l1 l2 0)
)

;2.b) - write a function to return the depth of a linear list
(DEFUN depth(l)
  (COND
   ((NULL l) 1)
   ;((ATOM (CDR l)) 1)
   ((LISTP (CAR l)) (max (+ 1 (depth (CAR l))) (depth (CDR l))))
   ;((ATOM (CAR l))  (depth (CDR l)))
   (T (depth (CDR l)))
  )
)


;2.c) -write  a funtion to sort a linear list list without keeping the double values


(DEFUN insertV(e l)
  (COND
   ((NULL l) (CONS e NIL))
   ((< e (CAR l)) (CONS e l))
   (T (CONS (CAR l) (insertV e (CDR l))))
  )
)

(DEFUN removeV(e l)
  (COND
   ((NULL l) NIL)
   ((EQUAL e (CAR l)) (removeV e (CDR l)))
   (T (CONS (CAR l) (removeV e (CDR l))))
  )
)

(DEFUN sortL(l)
  (COND
   ((NULL l) NIL)
   (T (insertV (CAR l) (sortL (removeV (CAR l) (CDR l)))))
  )
)

;sort without removing the duplicates
(defun insert(L e )
	( cond
		( ( null L ) ( cons e nil ) )
		( ( < e ( car L ) ) ( cons e L  ))
		( t ( cons ( car L ) ( insert ( cdr L ) e )) )
	)
)

(defun sortare(l)
	(cond
		( ( null l ) nil )
		( t ( insert ( sortare ( cdr l ) ) ( car l ) ) )
	)
)

;2.d) - write a function to return the intersection of two sets

(DEFUN memberg(l1 e)
(cond 
((null l1) nil)
((equal (car l1) e) T)
(T (memberg (cdr l1) e))
)
)

(defun intersect(l1 l2)
(cond 
((null l1) nil)
((null l2) nil)
((memberg l2 (car l1)) (cons (car l1) (intersect (cdr l1) l2)))
(T (intersect (cdr l1) l2))
)
)