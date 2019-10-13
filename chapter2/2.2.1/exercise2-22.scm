(define (append list-1 list-2)
    (if (null? list-1)
        list-2
        (cons (car list-1) (append (cdr list-1) list-2)))
)
(define (append-num list-1 list-2)
    (cond 
        ((null? list-1) list-2)
        ((not (pair? list-2)) (append-num list-1 (list list-2)))
        ((not (pair? list-1)) (append-num (list list-1) list-2))
        (else
            (cons (car list-1) (append-num (cdr list-1) list-2))
        )    
    )
)
; (display (append (list 1 2) (list 3 4)))
; (display (append-num (list 1 2) 5))
; (display (append-num 2 5))
; (display (append-num 1 (cdr (list 1))))



; redefine square-list in exercise2-21.scm
(define (square-list items)
    (define (iter-square origins answers)
        (if (null? origins)
            answers
            (iter-square (cdr origins) 
                (append answers (list (* (car origins) (car origins))))
            ))
    )
    (iter-square items (list ))
)
(newline)
(display (square-list (list 1 2 -3 4 5)))
(exit)