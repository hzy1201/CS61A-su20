
(define-macro (def func args body)
    'YOUR-CODE-HERE
    `(define ,(cons func args) ,body)
)


(define (map-stream f s)
    (if (null? s)
    	nil
    	(cons-stream (f (car s)) (map-stream f (cdr-stream s)))))

(define all-three-multiples
  (map-stream (lambda (x) (+ 3 x)) (cons-stream 0 all-three-multiples) )
)


(define (compose-all funcs)
  (if (null? funcs) (lambda (x) x)
    (lambda (x) ((compose-all (cdr funcs)) ((car funcs) x)))
  )
)


(define (partial-sums stream)
  (define (helper x stream)
    (if (null? stream) nil
        (cons-stream (+ x (car stream)) (helper (+ x (car stream)) (cdr-stream stream)))
    )
  )
  (helper 0 stream)
)

