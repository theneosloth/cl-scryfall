;;;; cl-scryfall.lisp

(in-package #:cl-scryfall)

;;; "cl-scryfall" goes here. Hacks and glory await!

(define-condition scryfall-response-error (warning)
  ((status :initarg :status :reader status)
   (code :initarg :code :reader code)
   (details :initarg :details :reader details)
   ;; Can be null
   (type :initarg :type :initform nil :reader type)
   (warnings :initarg :warnings :initform nil :reader warnings)))

(defun search-card (query)
  "Find a card and return it as a plist. Returns nil if no cards are found."
  (let* ((url (build-url :path "/cards/search?q=" :args query))
         (json (load-url-as-json url)))
    (cond
      ((equalp (getf json :|object|) "error") (warn 'scryfall-response-error
                                                    :status (getf json :|status|)
                                                    :code (getf json :|code|)
                                                    :details (getf json :|details|)
                                                    :type (getf json :|type|)
                                                    :warnings (getf json :|warnings|)))
      (t (getf json :|data|))
      ;; TODO: More cards handling
      ((getf json :|has_more|) nil))))
