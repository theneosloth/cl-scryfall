(in-package :cl-user)
(defpackage cl-scryfall.sets
  (:use :cl)
  (:import-from :cl-scryfall.util :make-objects)
  (:import-from :cl-scryfall.util :build-url)
  (:import-from :cl-scryfall.scryfall :get-from-api)
  (:export
   #:mtg-set_object
   #:mtg-set_code
   #:mtg-set_mtgo_code
   #:mtg-set_name
   #:mtg-set_set_type
   #:mtg-set_released_at
   #:mtg-set_block_code
   #:mtg-set_block
   #:mtg-set_parent_set_code
   #:mtg-set_card_count
   #:mtg-set_digital
   #:mtg-set_foil_only
   #:mtg-set_icon_svg_uri
   #:mtg-set_scryfall_uri
   #:mtg-set_search_uri
   #:mtg-set_uri
   #:sets-sets
   #:sets-set))

(in-package #:cl-scryfall.sets)

(defstruct mtg-set
  (object "set" :type string)
  (code nil :type string)
  (mtgo_code nil :type (or string null))
  (name nil :type string)
  (set_type nil :type string)
  (released_at nil :type (or string null))
  (block_code nil :type (or string null))
  (block nil :type (or string null))
  (parent_set_code nil :type (or string null))
  (card_count nil :type integer)
  (digital nil :type boolean)
  (foil_only nil :type boolean)
  (icon_svg_uri nil :type string)
  (scryfall_uri nil :type string)
  (search_uri nil :type string)
  (uri nil :type string))

(defvar create-sets (make-objects #'make-mtg-set))

(defun sets-sets ()
  "Returns all sets"
  (let ((data (get-from-api "/sets")))
    (funcall create-sets data)))

(defun sets-set (code)
  "Returns a set with the given set CODE. CODE can either be the code or the mtgo_code for the set"
  (let ((data (get-from-api (format nil "/sets/~a" code))))
    (apply #'make-mtg-set data)))
