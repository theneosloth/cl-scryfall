;;;; cl-scryfall.lisp

(in-package #:cl-scryfall)

;;; "cl-scryfall" goes here. Hacks and glory await!

(define-condition scryfall-response-error (warning)
  ((response-status :initarg :status :reader response-status)
   (response-code :initarg :code :reader response-code)
   (response-details :initarg :details :reader response-details)
   ;; Can be null
   (response-type :initarg :type :initform nil :reader response-type)
   (response-warnings :initarg :warnings :initform nil :reader response-warnings)))

(defmacro with-api-call (path args &rest body)
  "Make an api call at url"
  (let ((tempargs (gensym))
        (temppath (gensym)))
    `(let* ((,temppath ,path)
            (,tempargs ,args)
            (url (build-url :path ,temppath :args ,tempargs))
            (json (load-url-as-json url)))
       (cond
         ((equalp (getf json :|object|) "error") (warn 'scryfall-response-error
                                                       :status (getf json :|status|)
                                                       :code (getf json :|code|)
                                                       :details (getf json :|details|)
                                                       :type (getf json :|type|)
                                                       :warnings (getf json :|warnings|)))
         (t ,@body)))))
