(defun set-member (set item)
(cond
((null set) nil)
((equal (car set) item) t)
(t (set-member (cdr set) item))
)
)