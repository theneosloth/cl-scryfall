(in-package :cl-scryfall-tests)

(def-suite all-tests
    :description "Suite of all the tests.")

(in-suite all-tests)


(defun test-scryfall ()
  (run! 'all-tests))

(test transform-test
  (let ((transform-card (cl-scryfall.cards:cards-named-exact "Delver of Secrets")))
    (is (string= (cl-scryfall.card-struct:card-name transform-card) "Delver of Secrets // Insectile Aberration"))))

(test autocomplete-test
  (let ((autocomplete-card (cl-scryfall.cards:cards-autocomplete "Lightning B"))
        (results (list "Lightning Blow" "Lightning Bolt" "Lightning Blast" "Lightning Berserker")))
    (is-true (every #'string= autocomplete-card results))))
