;vale lisp 
;len(list) returneaza lungimea listei
;len(l1..ln) = 0 daca lista e vida
;len(l1..ln) = len(l2..ln)+1 otherwise
(defun len(l)
(cond 
(( null l) 0)
(T (+ 1 (len (cdr l))))
)
)

;vale(l-list,d-int) i i o
;l lista testata , d directie 1 cresc 0 descr
;vale (l1..ln,1) = T 
;vale (l1..ln,0) = vale(l2..ln,0 ),l1>l2
;vale (l1..ln,1) = vale(l2..ln,1 ),l1<l2
;vale (l1..ln,0) = vale(l2..ln,1 ),l1<l2
;vale (l1..ln,1) = nil,l1>l2
 
(defun vale(l d)
(cond 
((null l) nil)
((and(= (len l) 1) (= d 1)) T)
((and(= (len l) 1) (= d 0)) NIL)
;((null l) T)
;((= d 0) T)
((and (= d 0) (> (car l) (cadr l)) (vale (cdr l) 0 )))
((and (= d 1) (< (car l) (cadr l)) (vale (cdr l) 1 )))
((and (= d 0) (< (car l) (cadr l)) (vale (cdr l) 1 )))
((and (= d 1) (> (car l) (cadr l)) nil))
)
)

;main (l-list) returneaza T - l vale , Nil otherwise
;main(l)= nil l e vida
;main(l)= nil L1<L2 cazul in care e direct crescator
;main(l)= vale (l,0) otherwise
;incepe descrescator
(defun main(l)
(cond
((= (len l) 1) NIL)
((< (car l) (cadr l)) NIL)
(T(vale l 0))
)
)