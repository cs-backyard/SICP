; 对一个列表的每一项做伸缩变换
(define (scale-list items factor)
    (if (null? items)
        items
        (cons (* (car items) factor) (scale-list (cdr items) factor)))
)

; (display (scale-list (list 1 2 3 4) 2)) -> (2, 4, 6, 8)




; map 映射模板
(define (map produce items)
    (if (null? items)
        items
        (cons (produce (car items)) (map produce (cdr items))))
)

; (display (map abs (list 1 -3 4 -1)))

; 使用 map 重定义 scale-list
(define (map-scale-list items factor)
    (map (lambda (item) (* item factor)) 
        items)
)

; (display (map-scale-list (list 1 2 3 4) 2))
(exit)