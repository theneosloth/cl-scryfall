;;;; util.lisp

(in-package #:cl-scryfall)

(defun build-url (&key path args)
  (format nil "~a~a~a" *scryfall* path (drakma:url-encode args :utf-8)))

(defun load-url-as-json (url &optional)
  "Load a given url into an alist"
  (jonathan:parse
   (flexi-streams:octets-to-string
    (drakma:http-request url :method :get :user-agent *user-agent*))))
