(in-package :cl-scryfall)

<<<<<<< HEAD
(defvar create-sets (make-objects #'make-mtg-set))
=======
(defun create-set (list)
  (apply #'make-mtg-set list))

(defun create-sets (list)
  (mapcard #'create-set list))

>>>>>>> 03492e19f0df074e06c575fed3ec9003fc5fe475

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

(defun sets-sets ()
  "Returns all sets"
  (with-api-call "/sets/" nil
                 (create-sets json)))

(defun sets-set (code)
  "Returns a set with the given set CODE. CODE can either be the code or the mtgo_code for the set"
  (with-api-call (format nil "/sets/~a" code) nil
                 (apply #'make-set json)))
