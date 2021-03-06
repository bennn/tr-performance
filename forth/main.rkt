#lang typed/racket/base

(require
  require-typed-check
  "command-types.rkt")
(require/typed/check "eval.rkt"
  (forth-eval* (-> Input-Port (Values Any Any)))
)

;; =============================================================================

(define (main)
  (call-with-input-file* (ann "history.txt" Path-String)
    (lambda ([p : Input-Port])
      (let-values ([(_e _s) (forth-eval* p)]) (void))))
  (void))

(time (main))
