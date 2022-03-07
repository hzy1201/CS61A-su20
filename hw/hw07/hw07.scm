(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  (car (cdr s))
)

(define (caddr s)
  (car (cddr s))
)


(define (sign num)
  (cond
    ((> num 0) 1)
    ((< num 0) -1)
    (else 0)
  )
)


(define (square x) (* x x))

(define (pow x y)
  (if (= y 1) x
    (if (even? y)
      (square (pow x (/ y 2)))
      (* x (pow x (- y 1)))
    )
  )
)


(define (unique s)

  (define (not_equal x)
    (if (equal? x (car s))
      #f
      #t
    )
  )

  (if (null? s) nil
    (cons (car s) (unique(filter not_equal (cdr s))))
  )
)


(define (replicate x n)

  (define (helper ans x n)
    (if (= n 0) ans
      (helper (cons x ans) x (- n 1))
    )
  )

  (helper nil x n)
)


(define (accumulate combiner start n term)

  (define (helper ans combiner start n term)
    (if (= n 0) ans
      (helper (combiner ans (term n)) combiner start (- n 1) term)
    )
  )

  (helper start combiner start n term)
)


(define (accumulate-tail combiner start n term)

  (define (helper ans combiner start n term)
    (if (= n 0) ans
      (helper (combiner ans (term n)) combiner start (- n 1) term)
    )
  )

  (helper start combiner start n term)
)


(define-macro (list-of map-expr for var in lst if filter-expr)
  `(map (lambda (,var) ,map-expr) (filter (lambda (,var) ,filter-expr) ,lst))
)

