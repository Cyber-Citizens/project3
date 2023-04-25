;; Return T if item is a member of set.
;; Return NIL if item is not a member of set.
;; The type of set is list.
;; Examples:
;; (set-member '(1 2) 1) => T
;; (set-member '(1 2) 3) => NIL
(defun set-member (set item)
  (cond
    ((null set) NIL)
    ((equal (car set) item) T)
    (t (set-member (cdr set) item))
  )
)

(print 1)
(print (set-member '(1 2) 1))
(print (set-member '(1 2) 3))
(print "end method")
;; Return the union of set-1 and set-2.
;; The result should contain no duplicates.
;; Assume set-1 contains no duplicates and set-2 contains no duplicates.
;; Examples:
;; (set-union '(1 2) '(2 4)) => '(1 2 4)
(defun set-union (set-1 set-2)
  (cond
    ((null set-1) set-2)
    ((set-member set-2 (car set-1))
     (set-union (cdr set-1) set-2))
    (t (cons (car set-1) (set-union (cdr set-1) set-2)))
  )
)

(print 2)
(print (set-union '(1 2) '(2 4)))
(print (set-union '(1 2) '(3 4)))
(print "end method")

;; Return the intersection of set-1 and set-2.
;; The result should contain no duplicates.
;; Assume set-1 contains no duplicates and set-2 contains no duplicates.
;; Examples:
;; (set-intersection '(1 2) '(2 4)) => '(2)
(defun set-intersection (set-1 set-2)
  (cond
    ((null set-1) NIL)
    ((set-member set-2 (car set-1))
     (cons (car set-1) (set-intersection (cdr set-1) set-2)))
    (t (set-intersection (cdr set-1) set-2))
  )
)

(print 3)
(print (set-intersection '(1 2) '(2 4)))
(print (set-intersection '(1 4) '(2 4)))
(print "end method")

;; Return the difference of set-1 and set-2.
;; The result should contain no duplicates.
;; Assume set-1 contains no duplicates and set-2 contains no duplicates.
;;
;; Examples:
;; (set-diff '(1 2) '(2 4)) => '(1)
(defun set-diff (set-1 set-2)
  (cond
    ((null set-1) NIL)
    ((set-member set-2 (car set-1))
    (set-diff (cdr set-1) set-2))
    (t (cons (car set-1) (set-diff (cdr set-1) set-2)))
  )
)

(print 4)
(print (set-diff '(1 2) '(2 4)))
(print "end method")

;; Return the exclusive or of a and b
;;
;; Examples:
;; (boolean-xor t nil) => t
;; (boolean-xor nil nil) => nil
(defun boolean-xor (a b)
  (if (eq a b)
      NIL
      T
  )
)

(print 5)
(print (boolean-xor t nil))
(print (boolean-xor nil nil))
(print "end method")

;; Return the implication of a and b
;;
;; Examples:
;; (boolean-implies t nil) => nil
;; (boolean-implies nil nil) => t
(defun boolean-implies (a b)
  (if a
      b
      T
  )
)

(print 6)
(print (boolean-implies t nil))
(print (boolean-implies nil nil))
(print (boolean-implies nil t))
(print "end method")

;; Return the bi-implication (if and only if) of a and b
;;
;; Examples:
;; (boolean-iff t nil) => nil
;; (boolean-iff nil nil) => t
(defun boolean-iff (a b)
  (eq a b)
)

(print 7)
(print (boolean-iff t nil))
(print (boolean-iff nil nil))
(print "end method")

;; Evaluate a boolean expression.
;; Handle NOT, AND, OR, XOR, IMPLIES, and IFF.
;;
;; Examples:
;; (boolean-eval '(and t nil)) => nil
;; (boolean-eval '(and t (or nil t)) => t
; (defun boolean-eval (exp)
; ;;<Your implementation go here >
; )
(defun boolean-eval (exp)
  (cond ((null exp) t)
        ((atom exp) exp)
        ((eq (car exp) 'not)
         (not (boolean-eval (cadr exp))))
        ((eq (car exp) 'and)
         (let ((result t)
               (rest (cdr exp)))
           (loop for x in rest
                 unless (boolean-eval x)
                 do (return nil)
                 finally (return t))))
        ((eq (car exp) 'or)
         (let ((result nil)
               (rest (cdr exp)))
           (loop for x in rest
                 when (boolean-eval x)
                 do (return t)
                 finally (return nil))))
        ((eq (car exp) 'xor)
         (let ((result nil)
               (rest (cdr exp)))
           (loop for x in rest
                 with temp = t
                 do (setf temp (if (boolean-eval x)
                                   (not temp)
                                   temp))
                 finally (return temp))))
        ((eq (car exp) 'implies)
         (let ((p (cadr exp))
               (q (caddr exp)))
           (or (not (boolean-eval p))
               (boolean-eval q))))
        ((eq (car exp) 'iff)
         (let ((p (cadr exp))
               (q (caddr exp)))
           (equal (boolean-eval p)
                  (boolean-eval q))))
        (t (error "Unknown operator: ~A" (car exp)))))

(print (boolean-eval '(and t nil)))
(print (boolean-eval '(and t (or nil t))))
(print "end method")
