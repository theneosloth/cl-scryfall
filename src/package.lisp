;;;; package.lisp

(defpackage #:cl-scryfall
  (:use #:cl #:asdf)
  (:export
   #:cards-cards
   #:cards-search
   #:cards-named-exact
   #:cards-named-fuzzy
   #:cards-autocomplet
   #:cards-random
   #:cards-multiverse
   #:cards-mtgo
   #:cards-code-number))
