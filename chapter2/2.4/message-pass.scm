; 消息传递
; make-complex 返回一个过程，该过程根据op返回数据

(define (square x) (* x x))

(define (make-complex-from-real-weak real weak)
    (define (dispath op)
        (cond
            ((eq? op 'real-part) real)
            ((eq? op 'weak-part) weak)
            ((eq? op 'length-part) (sqrt (+ (square real) (square weak))))
            ((eq? op 'angle-part) (atan weak real))
            (else (diaplay "unkonw op: ") (display op)) 
        )
    )
    dispath
)

(define (make-complex-from-length-angle length angle)
    (define (dispath op)
        (cond
            ((eq? op 'real-part) (* length (cos angle)))
            ((eq? op 'weak-part) (* length (sin angle)))
            ((eq? op 'length-part) length)
            ((eq? op 'angle-part) angle)
            (else (display "unknow op: ") (display op))  
        )
    )
    dispath
)


(define (apply-gengal op complex-number) (complex-number op))

(define (real-part complex-number) (apply-gengal 'real-part complex-number))
(define (weak-part complex-number) (apply-gengal 'weak-part complex-number))
(define (length-part complex-number) (apply-gengal 'length-part complex-number))
(define (angle-part complex-number) (apply-gengal 'angle-part complex-number))

(define z (make-complex-from-real-weak 1 (sqrt 3)))
(display (real-part z))
(newline)
(display (weak-part z))
(newline)
(display (length-part z))
(newline)
(display (* (/ (angle-part z) 3.1415926) 180))



(newline)
(newline)
(define x (make-complex-from-length-angle 2 (/ 3.1415926 6)))
(display (real-part x))
(newline)
(display (weak-part x))
(newline)
(display (length-part x))
(newline)
(display (* (/ (angle-part x) 3.1415926) 180))

(exit)
