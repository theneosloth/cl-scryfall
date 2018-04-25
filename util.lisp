;;;; util.lisp

(in-package #:cl-scryfall)

(defun build-url (&key path args)
  "Adds path to the base url and encodes args into a proper url compatible string"
  (format nil "~a~a~a" *scryfall* path (drakma:url-encode args :utf-8)))

(defun load-url-as-json (url &optional)
  "Load a given url into a plist"
  (jonathan:parse
   (flexi-streams:octets-to-string
    (drakma:http-request url :method :get :user-agent *user-agent*) :external-format :utf-8)))
