(in-package :cl-user)
(defpackage cl-scryfall.rulings
  (:use :cl)
  (:import-from :cl-scryfall.util :make-objects)
  (:import-from :cl-scryfall.scryfall :get-from-api)
  (:export #:ruling-object
           #:ruling-source
           #:ruling-published_at
           #:ruling-comment
           #:rulings-multiverse
           #:rulings-mtgo
           #:rulings-number
           #:rulings-id))

(in-package #:cl-scryfall.rulings)

(defstruct ruling
  (object "ruling")
  (source nil :type string)
  (oracle_id nil :type string)
  (published_at nil :type string)
  (comment nil :type string))

(defvar create-rulings (make-objects #'make-ruling))

(defun rulings-multiverse (multiverseid)
  "Returns a List of rulings for a card with the given Multiverse ID. If the card has multiple multiverse IDs, this method can find either of them."
  (let ((data (get-from-api (format nil "/cards/multiverse/~a/rulings" multiverseid) nil)))
    (funcall create-rulings data)))

(defun rulings-mtgo (mtgoid)
  "Returns a List of rulings for a card with the given Mtgo ID. If the card has multiple mtgo IDs, this method can find either of them."
  (let ((data (get-from-api (format nil "/cards/mtgo/~a/rulings" mtgoid) nil)))
    (funcall create-rulings data)))

(defun rulings-number (code number)
  "Returns a List of rulings for the card with the given set CODE and collector NUMBER."
  (let ((data (get-from-api (format nil "/cards/~a/~a/rulings" code number) nil)))
    (funcall create-rulings data)))

(defun rulings-id (scryfallid)
  "Returns a List of rulings for a card with the given Scryfall ID."
  (let ((data (get-from-api (format nil "/cards/~a/rulings" scryfallid) nil)))
    (funcall create-rulings data)))
