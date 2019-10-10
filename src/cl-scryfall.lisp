;;;; cl-scryfall.lisp
(in-package :cl-user)
(defpackage cl-scryfall.scryfall
  (:use :cl)
  (:import-from :cl-scryfall.util :build-url :load-url-as-json))

(in-package :cl-scryfall.scryfall)

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
   ;; Can be either a string or a null
   (response-type :initarg :type
                  :initform nil
                  :reader response-type
                  :documentation "A computer-friendly string that provides additional context for the main error. For example, an endpoint many generate HTTP 404 errors for different kinds of input. This field will provide a label for the specific kind of 404 failure, such as ambiguous.")

   (response-warnings :initarg :warnings
                      :initform nil
                      :reader response-warnings
                      :documentation "If your input also generated non-failure warnings, they will be provided as human-readable strings in this array.")))

(defun get-from-api (path &optional params)
  "Load a json from a url built by BUILD-PATH. Signals a warning if the call returns an error."
  (let* ((url (build-url path))
         (json (load-url-as-json url :params params)))
    (if (equalp (getf json :object) "error")
        (warn 'scryfall-response-error
              :status (getf json :status)
              :code (getf json :code)
              :type (getf json :type)
              :warnings (getf json :warnings))
        json)))
