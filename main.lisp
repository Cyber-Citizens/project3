;; Return T if item is a member of set.
;; Return NIL if item is not a member of set.
;; The type of set is list.
;; Examples:
;; (set-member '(1 2) 1) => T
;; (set-member '(1 2) 3) => NIL
(defun set-member (set item)
(cond
((null set) nil)
((equal (car set) item) t)
(t (set-member (cdr set) item))
)
)


;; Return the union of set-1 and set-2.
;; The result should contain no duplicates.
;; Assume set-1 contains no duplicates and set-2 contains no duplicates.
;; Examples:
;; (set-union '(1 2) '(2 4)) => '(1 2 4)
(defun set-union (set-1 set-2)
;;Your implementation go here
)


;; Return the intersection of set-1 and set-2.
;; The result should contain no duplicates.
;; Assume set-1 contains no duplicates and set-2 contains no duplicates.
;; Examples:
;; (set-intersection '(1 2) '(2 4)) => '(2)
(defun set-intersection (set-1 set-2)
;;Your implementation go here
)


;; Return the difference of set-1 and set-2.
;; The result should contain no duplicates.
;; Assume set-1 contains no duplicates and set-2 contains no duplicates.
;;
;; Examples:
;; (set-diff '(1 2) '(2 4)) => '(1)
(defun set-diff (set-1 set-2)
;;Your implementation go here
)


;; Return the exclusive or of a and b
;;
;; Examples:
;; (boolean-xor t nil) => t
;; (boolean-xor nil nil) => nil
(defun boolean-xor (a b)
;;Your implementation go here
)

;; Return the implication of a and b
;;
;; Examples:
;; (boolean-implies t nil) => nil
;; (boolean-implies nil nil) => t
(defun boolean-implies (a b)
;;<Your implementation go here >
)

;; Return the bi-implication (if and only if) of a and b
;;
;; Examples:
;; (boolean-iff t nil) => nil
;; (boolean-iff nil nil) => t
(defun boolean-iff (a b)
;;<Your implementation go here >
)


;; Evaluate a boolean expression.
;; Handle NOT, AND, OR, XOR, IMPLIES, and IFF.
;;
;; Examples:
;; (boolean-eval '(and t nil)) => nil
;; (boolean-eval '(and t (or nil t)) => t
(defun boolean-eval (exp)
;;<Your implementation go here >
)
