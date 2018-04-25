;;;; cl-scryfall.asd

(asdf:defsystem #:cl-scryfall
  :description "API wrapper for scryfall.com"
  :author "Stefan Kuznetsov <neosloth@posteo.net>"
  :license "GPL-3.0"
  :depends-on (#:jonathan
               #:drakma)
  :serial t
  :components ((:file "package")
               (:file "globals")
               (:file "util")
               (:file "cl-scryfall")
               (:file "cards")
               ))
