(define (split-at lst n)
  'YOUR-CODE-HERE
  (define (helper ans rem n)
    (if (= n 0) (cons ans rem)
      (if (null? rem) (cons ans nil)
        (helper (append ans (cons (car rem) nil)) (cdr rem) (- n 1))
      )
    )
  )

  (helper nil lst n)

)

(define-macro (switch expr cases)
	(cons 'cond
		(map (lambda (case) (cons ___(cdr case)))
    			cases)
    )
)

