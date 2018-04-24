;;;; cl-scryfall.lisp

(in-package #:cl-scryfall)

;;; "cl-scryfall" goes here. Hacks and glory await!

(defun search-card (query)
  "Find a card and return it as an alist. Returns nil if no cards are found."
  (let* ((url (build-url :path "/cards/search?q=" :args query))
         (json (load-url-as-json url)))
    (cond
      ((equalp (cdr (sassoc "object" json)) "error") nil)
      (t (cadr (sassoc "data" json))))))
