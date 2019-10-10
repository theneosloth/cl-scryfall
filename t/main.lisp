(in-package :cl-scryfall-tests)

(def-suite all-tests
    :description "Suite of all the tests.")

(in-suite all-tests)

;; For now the tests are just the sample queries given by the scryfall api

(defun do-tests ()
  (run! 'all-tests))

(test signal-test
  (signals cl-scryfall.scryfall::scryfall-response-error (cl-scryfall.cards:cards-search "is:slick cmc>cmc")))

(test search-test
  (let* ((results (cl-scryfall.cards:cards-search "c:red pow<3" :order "cmc"))
         ;; Need to reimplement it to check every card in the list instead
         (card (nth (random (length results)) results)))
    (is
     (and
      (< (cl-scryfall.card-struct:card-cmc card) 3)
      (member "R" (cl-scryfall.card-struct:card-colors card) :test #'string=)))))

(test fuzzy-test
  (let ((fuzzy-search (cl-scryfall.cards:cards-named-fuzzy "aust com")))
    ;; The id is for austere command
    (is (string= (cl-scryfall.card-struct:card-id fuzzy-search) "bef16a71-5ed2-4f30-a844-c02a0754f679"))))

(test autocomplete-test
  (let ((autocomplete-card (cl-scryfall.cards:cards-autocomplete "thal"))
        (results (list "Thallid" "Thalakos Seer" "Thalakos Scout" "Thalakos Sentry"
                       "Thalia's Lancers" "Thallid Devourer" "Thallid Omnivore" "Thalakos Drifters"
                       "Thalakos Mistfolk" "Thalakos Lowlands" "Thalakos Deceiver"
                       "Thallid Soothsayer" "Thallid Germinator" "Thalia's Lieutenant"
                       "Thalia's Geistcaller" "Thallid Shell-Dweller" "Thalia, Heretic Cathar"
                       "Thalakos Dreamsower" "Thalia, Guardian of Thraben" "Thorn Thallid")))

    (is-true (every #'string= autocomplete-card results))))

(test random-test
  (let ((random-card (cl-scryfall.cards:cards-random)))
    (is (string= (cl-scryfall.card-struct:card-object random-card) "card"))))

(test transform-test
  (let ((transform-card (cl-scryfall.cards:cards-named-exact "Delver of Secrets")))
    (is (string= (cl-scryfall.card-struct:card-name transform-card) "Delver of Secrets // Insectile Aberration"))))

;; TODO: add the rest
