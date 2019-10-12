(define (append list-1 list-2)
    (if (null? list-1)
        list-2
        (cons (car list-1) (append (cdr list-1) list-2)))
)
; (display (append (list 1 2) (list 3 4)))

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

(display (square-list (list 1 2 -3 4 5)))
(exit)