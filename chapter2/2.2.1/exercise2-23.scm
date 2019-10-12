; define for-each
(define (for-each produce items)
    (cond 
        ((null? items) #t)
        ((not (pair? items)) (produce items) #t)   
        (else 
            (produce (car items))
            (for-each produce (cdr items))
        )
    )
)

(display (for-each 
    (lambda (item) (newline) (display item)) 
    666
))

(display (for-each 
    (lambda (item) (newline) (display item)) 
    (list 1 2 3)
))
(newline)
(display (for-each 
    (lambda (item) (newline) (display item)) 
    (list )
))


(exit)