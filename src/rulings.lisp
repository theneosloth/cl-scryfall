(in-package :cl-scryfall)

(defstruct ruling
  (object "ruling")
  (source nil :type string)
  (published_at nil :type string)
  (comment nil :type string))

<<<<<<< HEAD
(defvar create-rulings (make-objects #'make-ruling))
=======
;; TODO: Combine this with the similar functions for the cards
(defun create-ruling (list)
  (apply #'make-ruling list))

(defun create-rulings (list)
  (mapcard #'create-ruling list))
>>>>>>> 03492e19f0df074e06c575fed3ec9003fc5fe475

(defun rulings-multiverse (multiverseid)
  "Returns a List of rulings for a card with the given Multiverse ID. If the card has multiple multiverse IDs, this method can find either of them."
  (with-api-call (format nil "/cards/multiverse/~a/rulings" multiverseid) nil
                 (create-rulings json)))

(defun rulings-mtgo (mtgoid)
  "Returns a List of rulings for a card with the given Mtgo ID. If the card has multiple mtgo IDs, this method can find either of them."
  (with-api-call (format nil "/cards/mtgo/~a/rulings" mtgoid) nil
                 (create-rulings json)))

(defun rulings-number (code number)
  "Returns a List of rulings for the card with the given set CODE and collector NUMBER."
  (with-api-call (format nil "/cards/~a/~a/rulings" code number) nil
                 (create-rulings json)))

(defun rulings-id (scryfallid)
  "Returns a List of rulings for a card with the given Scryfall ID."
  (with-api-call (format nil "/cards/~a/rulings" scryfallid) nil
                 (create-rulings json)))
