; define map
(define (map produce items)
    (if (null? items)
        items
        (cons (produce (car items)) (map produce (cdr items))))
)
;(display (map (lambda (item) (* item item)) (list 1 2 3 -4)))


;define filter
(define (filter predicate items)
    (cond ((null? items) items)
        (else
            (if (predicate (car items))
                (cons (car items) (filter predicate (cdr items)))
                (filter predicate (cdr items))
                ) 
        ))
)
;(display (filter (lambda (item) (< 3 item)) (list 1 2 3 4)))

;define reduce
(define (reduce produce origin items)
    (if (null? items)
        origin
        (produce (car items) (reduce produce origin (cdr items))))
)
;(display (reduce * 1 (list 1 2 -5)))


;define enumerate
(define (enumerate begin-num end-num)
    (if (> begin-num end-num)
        (list )
        (cons begin-num (enumerate (+ begin-num 1) end-num)))
)
;(display (enumerate 0 6))

(define (count-leaves trees)
    (reduce (lambda (x y) (+ x y)) 0
        (map 
            (lambda (tree) 
                (cond ((null? tree) 0)
                    ((not (pair? tree)) 1)
                    (else (count-leaves tree))
                )) trees)
    )
)
;test count-leaves
(display (count-leaves (list (list 1 2) (list 5 6))))


(exit)