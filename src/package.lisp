;;;; package.lisp

(defpackage #:cl-scryfall
  (:use #:cl #:asdf)
  (:export
   #:cards-cards
   #:cards-search
   #:cards-named-exact
   #:cards-named-fuzzy
   #:cards-autocomplete
   #:cards-random
   #:cards-multiverse
   #:cards-mtgo
   #:cards-arena
   #:cards-code-number
   #:cards-id
   #:sets-sets
   #:sets-set
   #:rulings-multiverse
   #:rulings-mtgo
   #:rulings-number
   #:rulings-id))
