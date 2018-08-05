;;;; cl-scryfall.lisp

(in-package #:cl-scryfall)

;;; "cl-scryfall" goes here. Hacks and glory await!

(define-condition scryfall-response-error (warning)
  ((response-status :initarg :status
                    :reader response-status
                    :type integer
                    :documentation "An integer HTTP status code for this error.")
   (response-code :initarg :code
                  :reader response-code
                  :type string
                  :documentation "A computer-friendly string representing the appropriate HTTP status code.")
   (response-details :initarg :details
                     :reader response-details
                     :type string
                     :documentation "A human-readable string explaining the error.")
   ;; Can be null
   (response-type :initarg :type
                  :initform nil
                  :reader response-type
                  :type string
                  :documentation "A computer-friendly string that provides additional context for the main error. For example, an endpoint many generate HTTP 404 errors for different kinds of input. This field will provide a label for the specific kind of 404 failure, such as ambiguous.")

   (response-warnings :initarg :warnings
                      :initform nil
                      :reader response-warnings
                      :documentation "If your input also generated non-failure warnings, they will be provided as human-readable strings in this array.")))

(defmacro with-api-call (path &optional params &rest body)
  "Load a json from a url built by BUILD-PATH, then execute body with local variables for the URL and loaded JSON.
   Signals a warning if the call returns an error."
  (let ((tempparams (gensym))
        (temppath (gensym)))
    `(let* ((,temppath ,path)
            (,tempparams ,params)
            (url (build-url ,temppath))
            (json (load-url-as-json url :params ,tempparams)))
       (cond
         ((equalp (getf json :object) "error") (warn 'scryfall-response-error
                                                     :status (getf json :|status|)
                                                     :code (getf json :|code|)
                                                     :details (getf json :|details|)
                                                     :type (getf json :|type|)
                                                     :warnings (getf json :|warnings|)))
         (,@body)))))
