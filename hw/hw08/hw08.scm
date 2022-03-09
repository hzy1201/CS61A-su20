(define (rle s)
  'YOUR-CODE-HERE
  (define (helper x num s)
    (if (null? s) (cons-stream `(,x ,num) nil)
      (if (= x (car s))
        (helper x (+ 1 num) (cdr-stream s))
        (cons-stream `(,x ,num) (helper (car s) '1 (cdr-stream s)))
      )
    )
  )

  (if (null? s) nil
    (helper (car s) '1 (cdr-stream s))
  )
)


(define (group-by-nondecreasing s)
    'YOUR-CODE-HERE
  (define (helper lst last s)
    (if (null? s) (cons lst nil)
      (if (< (car s) last)
        (cons lst (helper (cons (car s) nil) (car s) (cdr s)))
        (helper (append lst (cons (car s) nil)) (car s) (cdr s))
      )
    )
  )

  (if (null? s) nil
    (helper (cons (car s) nil) (car s) (cdr s))
  )
)


(define finite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 3
                (cons-stream 1
                    (cons-stream 2
                        (cons-stream 2
                            (cons-stream 1 nil))))))))

(define infinite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 2
                infinite-test-stream))))

