
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


(define (map-re produce items)
    (reduce (lambda (x y) (cons (produce x) y)) (list ) items)
)
; test map-re
(display (map-re (lambda (item) (* item item)) (list 6 -2 -3)))
(newline)

(define (append seq-1 seq-2)
    (reduce cons seq-2 seq-1)
)
; test append
(display (append (list 1 2) (list 3 4)))
(newline)

(define (length items)
    (reduce (lambda (x y) (+ 1 y)) 0 items)
)
; test length
(display (length (list (list 1 2) 3 4)))
(exit)
