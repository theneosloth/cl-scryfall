;;;; cl-scryfall.asd

(asdf:defsystem #:cl-scryfall
  :description "API wrapper for scryfall.com"
  :author "Stefan Kuznetsov <neosloth@posteo.net>"
  :license "LGPL-3.0"
  :depends-on (#:jonathan
               #:drakma)
  :in-order-to ((test-op (test-op "cl-scryfall/tests")))
  :components ((:module :src
                        :serial t
                        :components ((:file "package")
                                     (:file "util")
                                     (:file "cl-scryfall")
                                     (:file "card-struct")
                                     (:file "cards")
                                     (:file "sets")
                                     (:file "rulings")))))

(asdf:defsystem #:cl-scryfall/tests
    :depends-on (:cl-scryfall :fiveam)
    :perform (test-op (o s)
                      (uiop:symbol-call :cl-scryfall-tests :test-scryfall))
    :components ((:module "t"
                          :serial t
                          :components ((:file "package")
                                       (:file "main")))))
