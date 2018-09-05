;;;; cards.lisp

(in-package #:cl-scryfall)

;; Utilty functions

(defvar create-cards (make-objects #'make-card))

;; API Calls
(defun cards-cards (page)
  "Returns a List object that contains all cards in Scryfall’s database. PAGE specifies the page of the request."
  (with-api-call "/cards"
    (epairlis '("page") (list page))
    (create-cards json)))

(defun cards-search (q &optional &key unique order dir include_extras page)
  "Returns a List object containing Cards found using a fulltext search string.
   This string supports the same fulltext search system that the main site uses."
  (with-api-call "/cards/search"
    (epairlis '("q" "unique" "order" "dir" "include_extras" "page")
              (list q unique order dir include_extras page))
    (create-cards json)))

(defun cards-named-exact (name &optional set)
  "Card with that exact NAME is returned."
  (with-api-call "/cards/named"
    (epairlis '("exact" "set") (list name set))
    (apply #'make-card json)))

(defun cards-named-fuzzy(name &optional set)
  "Execute fuzzy search on NAME."
  (with-api-call "/cards/named"
    (epairlis '("fuzzy" "set") (list name set))
    (apply #'make-card json)))

(defun cards-autocomplete (q)
  "Returns a list of strings containing up to 20 full English card names that could be autocompletions of the given string parameter."
  (with-api-call "/cards/autocomplete"
    (epairlis '("q") (list q))
    (getf json :data)))

(defun cards-random ()
  "Returns a single random Card object."
  (with-api-call "/cards/random/" nil
                 (apply #'make-card json)))

(defun cards-multiverse (id)
  "Returns a single card with the given Multiverse ID. If the card has multiple multiverse IDs, this method can find either of them."
  (with-api-call (format nil "/cards/multiverse/~a" id) nil
                 (apply #'make-card json)))

(defun cards-mtgo (id)
  "Returns a single card with the given MTGO ID (also known as the Catalog ID).
 The ID can either be the card’s mtgo_id or its mtgo_foil_id."
  (with-api-call (format nil "/cards/mtgo/~a" id) nil
                 (apply #'make-card json)))

(defun cards-arena (id)
  "Returns a single card with the given Magic: The Gathering Arena ID."
  (with-api-call (format nil "/cards/arena/~a" id) nil
                 (apply #'make-card json)))

(defun cards-code-number (code number)
  "Returns a single card with the given set code and collector number."
  (with-api-call (format nil "/cards/~a/~a" code number) nil
                 (apply #'make-card json)))

(defun cards-id (id)
  "Returns a single card with the given Scryfall ID."
  (with-api-call (format nil "/cards/~a" id) nil
                 (apply #'make-card json)))
