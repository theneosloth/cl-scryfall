;;;; card-struct.lisp

(in-package #:cl-scryfall)

(defstruct card
  ;; Core Card Fields
  (arena_id nil :type (or integer null))
  (id nil :type string)
  (lang nil :type string)
  (mtgo_id nil :type (or integer null))
  (mtgo_foil_id nil :type (or integer null))
  (multiverse_ids nil :type (or list null))
  (object "card" :type string)
  (oracle_id nil :type string)
  (prints_search_uri nil :type string)
  (rulings_uri nil :type string)
  (scryfall_uri nil :type string)
  (uri nil :type string)
  ;; Gameplay Fields
  (all_parts nil :type (or list null))
  (card_faces nil :type (or list null)))
