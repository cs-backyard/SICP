;complex-numner system : 标志类型

; first represent-rectangular (real weak)
; choose functions
(define (real-part-rectangular z)
    (car z)
)
(define (weak-part-rectangular z)
    (cdr z)
)
(define (length-part-rectangular z)
    (sqrt (+ (square (real-part-rectangular z)) (square (weak-part-rectangular z))))
)
(define (angle-part-rectangular z)
    (atan (weak-part-rectangular z) (real-part-rectangular z))
)
; construct functions
(define (make-complex-from-real-weak-rectangular real weak)
    (attach-tag 'rectangular (cons real weak))
)
(define (make-complex-from-length-angle-rectangular length angle)
    (attach-tag 'rectangular (cons (* (cos angle) length) (* (sin angle) length)))
)
(define (attach-tag tag number)
    (cons tag number)
)


; second represent-polar (length angle)
; choose functions in polar
(define (real-part-polar z)
    (* (length-part-polar z) (cos (angle-part-polar z)))
)
(define (weak-part-polar z) 
    (* (length-part-polar z) (sin (angle-part-polar z)))
)
(define (length-part-polar z)
    (car z)
)
(define (angle-part-polar z)
    (cdr z)
)
; construct functions in polar
(define (make-complex-from-real-weak-polar real weak)
    (attach-tag 'polar (cons (sqrt (+ (square real) (square weak))) (atan weak real)))
)
(define (make-complex-from-length-angle-polar length angle)
    (attach-tag 'polar (cons length angle))
)

(define (square x) (* x x))


; choose functions and construct functions in common use
(define (rectangular? z)
    (if (pair? z)
        (eq? (car z) 'rectangular)
        (eq? z 'rectangular)
    )
)
(define (polar? z)
    (if (pair? z)
        (eq? (car z) 'polar)
        (eq? z 'polar)
    )   
)
    
(define (content z)
    (cdr z)
)

(define (real-part z)
    (if (pair? z)
        (cond 
            ((rectangular? z) (real-part-rectangular (content z)))
            ((polar? z) (real-part-polar (content z)))
            (else (display "unknow type: ") (display z))
        )
        (display "param must be pair!\n")
    )
)
(define (weak-part z)
    (if (pair? z)
        (cond 
            ((rectangular? z) (weak-part-rectangular (content z)))
            ((polar? z) (weak-part-polar (content z)))
            (else (display "unknow type: ") (display z))
        )
        (display "param must be pair!\n")
    )
)
(define (length-part z)
    (if (pair? z)
        (cond 
            ((rectangular? z) (length-part-rectangular (content z)))
            ((polar? z) (length-part-polar (content z)))
            (else (display "unknow type: ") (display z))
        )
        (display "param must be pair!\n")
    )
)
(define (angle-part z)  
    (if (pair? z)
        (cond 
            ((rectangular? z) (angle-part-rectangular (content z)))
            ((polar? z) (angle-part-polar (content z)))
            (else (display "unknow type: ") (display z))
        )
        (display "param must be pair!\n")
    )
)
(define (make-complex tag num-1 num-2)
    (cond 
        ((rectangular? tag) (make-complex-from-real-weak-rectangular num-1 num-2))
        ((polar? tag) (make-complex-from-length-angle-polar num-1 num-2))
        (else (display "unknow type: ") (display z))
    )   
)




(define x (make-complex 'rectangular 1 2))
(display x)
(define y (make-complex 'polar 2 (/ 3.1415926 3)))
(display y)
(newline)
(display (real-part y))
(display "\t")
(display (weak-part y))
; (newline)
; (display (make-complex-from-real-weak-polar 1 (sqrt 3)))
; (newline)

; (display (* 180 (/ (atan (sqrt 3) 1) 3.1415926)))
; (newline)
; (display (cdr (cons 1 2)))
(exit)

