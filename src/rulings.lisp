(in-package :cl-scryfall)

(defun rulings-multiverse (multiverseid)
  "Returns a List of rulings for a card with the given Multiverse ID. If the card has multiple multiverse IDs, this method can find either of them."
  (with-api-call (format nil "/cards/multiverse/~a/rulings" multiverseid) nil
                 json))

(defun rulings-mtgo (mtgoid)
  "Returns a List of rulings for a card with the given Mtgo ID. If the card has multiple mtgo IDs, this method can find either of them."
  (with-api-call (format nil "/cards/mtgo/~a/rulings" mtgoid) nil
                 json))

(defun rulings-number (code number)
  "Returns a List of rulings for the card with the given set CODE and collector NUMBER."
  (with-api-call (format nil "/cards/~a/~a/rulings" code number) nil
                 json))

(defun rulings-id (scryfallid)
  "Returns a List of rulings for a card with the given Scryfall ID."
  (with-api-call (format nil "/cards/~a/rulings" scryfallid) nil
                 json))
