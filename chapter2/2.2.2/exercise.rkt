; ; begin coding in scheme also in my life (today 2019-10-09)
; (define x (list "333" 2 3 4 5))
; (display (car x))
; (newline)
; (display (cdr x))
; (newline)

; length return list's sum(item)
(define (length items) 
    (if (null? items)
        0
        (+ 1 (length (cdr items))))
)

; define the print
(define (print argv split)
    (cond ((null? argv) (newline))
        ((not (pair? argv)) (display argv))
        (else 
            (cond ((= 1 (length argv)) (display (car argv)))
                 (else 
                    (display (car argv))
                    (display split)
                    (print (cdr argv) split)
                 ))
        )
    )    
)



(print (list "display items[[1,2], 3, 4]: " (length (list (list 1 2) 3 4))) " ")

(newline)
(print (pair? (cdr (list 1 2))) "")
(exit)