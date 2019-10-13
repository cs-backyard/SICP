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


(exit)
