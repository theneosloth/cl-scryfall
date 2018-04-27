(in-package :cl-scryfall)

(defun sets-sets ()
  "Returns all sets"
  (with-api-call "/sets/" nil
                 (getf json :|data|)))

(defun sets-set (code)
  "Returns a set with the given set CODE. CODE can either be the code or the mtgo_code for the set"
  (with-api-call "/sets/" code
                 json))
