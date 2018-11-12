(in-package :cl-user)
(defpackage cl-scryfall.cards
  (:use :cl)
  (:import-from :cl-scryfall.util :make-objects)
  (:import-from :cl-scryfall.card-struct :make-card)
  (:import-from :cl-scryfall.util :build-url)
  (:import-from :cl-scryfall.util :epairlis)
  (:import-from :cl-scryfall.scryfall :get-from-api)

  (:export #:cards-cards
           #:cards-search
           #:cards-named-exact
           #:cards-named-fuzzy
           #:cards-autocomplete
           #:cards-random
           #:cards-multiverse
           #:cards-mtgo
           #:cards-arena
           #:cards-code_number
           #:cards-id
           #:cards-tcgplayer))

(in-package #:cl-scryfall.cards)

;; Utilty functions
(defvar create-cards (make-objects #'make-card))

;; API Calls
(defun cards-cards (page)
  "Returns a List object that contains all cards in Scryfall’s database. PAGE specifies the page of the request."
  (let ((data (get-from-api "/cards" (epairlis '("page") (list page)))))
    (funcall create-cards data)))

(defun cards-search (q &optional &key unique order dir include_extras page)
  "Returns a List object containing Cards found using a fulltext search string.
   This string supports the same fulltext search system that the main site uses."
  (let ((data (get-from-api "/cards/search"
                            (epairlis '("q" "unique" "order" "dir" "include_extras" "page")
                                      (list q unique order dir include_extras page)))))
    (funcall create-cards data)))

(defun cards-named-exact (name &optional set)
  "Card with that exact NAME is returned."
  (let ((data (get-from-api "/cards/named"
                            (epairlis '("exact" "set") (list name set)))))
    (apply #'make-card data)))

(defun cards-named-fuzzy(name &optional set)
  "Execute fuzzy search on NAME."
  (let ((data (get-from-api "/cards/named"
                            (epairlis '("fuzzy" "set") (list name set)))))
    (apply #'make-card data)))

(defun cards-autocomplete (q)
  "Returns a list of strings containing up to 20 full English card names that could be autocompletions of the given string parameter."
  (let ((data (get-from-api "/cards/autocomplete" (epairlis '("q") (list q)))))
    (getf data :data)))

(defun cards-random ()
  "Returns a single random Card object."
  (let ((data (get-from-api "/cards/random/" nil)))
    (apply #'make-card data)))

(defun cards-collection ()
  "Accepts a JSON array of card identifiers, and returns a List object with the collection of requested cards. A maximum of 75 card references may be submitted per request. The request must be posted with Content-Type as application/json."
  ;; TODO: Implement
  nil)

(defun cards-multiverse (id)
  "Returns a single card with the given Multiverse ID. If the card has multiple multiverse IDs, this method can find either of them."
  (let ((data (get-from-api (format nil "/cards/multiverse/~a" id) nil)))
    (apply #'make-card data)))

(defun cards-mtgo (id)
  "Returns a single card with the given MTGO ID (also known as the Catalog ID).
 The ID can either be the card’s mtgo_id or its mtgo_foil_id."
  (let ((data (get-from-api (format nil "/cards/mtgo/~a" id) nil)))
    (apply #'make-card data)))

(defun cards-arena (id)
  "Returns a single card with the given Magic: The Gathering Arena ID."
  (let ((data (get-from-api (format nil "/cards/arena/~a" id) nil)))
    (apply #'make-card data)))

(defun cards-code-number (code number)
  "Returns a single card with the given set code and collector number."
  (let ((data (get-from-api (format nil "/cards/~a/~a" code number) nil)))
    (apply #'make-card data)))

(defun cards-id (id)
  "Returns a single card with the given Scryfall ID."
  (let ((data (get-from-api (format nil "/cards/~a" id) nil)))
    (apply #'make-card data)))

(defun cards-tcgplayer (id)
  "Returns a single card with the given TCGPlayer ID."
  (let ((data (get-from-api (format nil "/cards/tcgplayer/~a" id) nil)))
    (apply #'make-card data)))
