; map
(define (map produce items)
    (if (null? items)
        items
        (cons (produce (car items)) (map produce (cdr items))))
)

; define square-list
(define (square-list items)
    (if (null? items)
        items
        (cons (* (car items) (car items)) (square-list (cdr items))))
)

; deefine map-squre-list
(define (map-square-list items)
    (map (lambda (item) (* item item)) items)
)

(define test-list (list 1 2 6 -8))
(display (square-list test-list))
(display (map-square-list test-list))

(exit)