;;;; cards.lisp

(in-package #:cl-scryfall)

;; TODO: Add documentation

(defun cards-cards (&optional page)
  (with-api-call "/cards/?page=" page
                 json))

(defun cards-search (query &optional unique order dir include_extras page)
  (with-api-call "/cards/search?q=" query
                 (cond
                   (t (getf json :|data|))
                   ;; TODO: Handle has_more
                   ((getf json :|has_more| nil)))))

(defun cards-named-exact (name &optional set)
  (with-api-call "/cards/named?exact=" name
                 json))

(defun cards-named-fuzzy (name &optional set)
  (with-api-call "/cards/named?fuzzy=" name
                 json))

(defun cards-autocomplete (q)
  (with-api-call "/cards/autocomplete?q=" q
                 (getf json :|data|)))

(defun cards-random ()
  (with-api-call "/cards/random/" nil
                 json))

(defun cards-multiverse (id)
  (with-api-call "/cards/multiverse/" id
                 json))

(defun cards-mtgo (id)
  (with-api-call "/cards/mtgo/" id
                 json))

;; TODO: Clean this up
(defun cards-code-number (code number)
  (with-api-call (format nil "/cards/~a/~a" code number) nil
                 json))
