(in-package :cl-user)
(defpackage cl-scryfall.util
  (:use :cl)
  (:export
   :build-url
   :load-url-as-json
   :mapcard
   :make-objects))

(in-package :cl-scryfall.util)

;;Globals
(defvar +scryfall+ "https://api.scryfall.com")

(defvar +user-agent+ "cl-scryfall 0.1 (common lisp api wrapper)")

(defun build-url (path)
  "Adds path to the base url. TODO: Argument support"
  (format nil "~a~a" +scryfall+ path))

(defun epairlis (keys data)
  "Returns a drakma compatible alist based on given keys and data."
  (remove-if #'(lambda (x) (or
                            (not (cdr x))
                            (string= (cdr x) "NIL")))
             (pairlis keys
                      (mapcar #'(lambda(x) (format nil "~A" x)) data))))

(defun load-url-as-json (url &optional &key params type)
  "Load a given url into a plist"
  (jonathan:parse
   (flexi-streams:octets-to-string
    (drakma:http-request url :method :get :user-agent +user-agent+ :parameters params) :external-format :utf-8) :as type :keyword-normalizer #'string-upcase :normalize-all t))

(defun mapcard (func list &optional (continue t))
  "Apply FUNC to all the elements of a scryfall LIST. If CONTINUE is set, call the function again on the next page of scryfall results"
  (if (and (getf list :has-more) continue)
      (append
       (mapcard func (load-url-as-json (getf list :next-page)))
       (mapcar #'(lambda (l) (apply func l)) (getf list :data)))
      (mapcar #'(lambda (l) (apply func l)) (getf list :data))))

(defun make-objects (constructor)
  "Returns a function that uses CONSTRUCTOR to create any number of objects from LIST"
  #'(lambda (list)
      (mapcard constructor list)))
