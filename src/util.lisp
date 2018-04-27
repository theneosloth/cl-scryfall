;;;; util.lisp

(in-package #:cl-scryfall)

(defun build-url (&key path args)
  "Adds path to the base url and encodes args into a proper url compatible string"
  (format nil "~a~a~a" *scryfall* path (drakma:url-encode args :utf-8)))

(defun load-url-as-json (url &optional)
  "Load a given url into a plist"
  (jonathan:parse
   (flexi-streams:octets-to-string
    (drakma:http-request url :method :get :user-agent *user-agent*) :external-format :utf-8)))

(defun card-to-markdown (card)
  "Converts a card plist into a pretty markdown representation"
  (destructuring-bind
        (&key |name| |mana_cost| |type_line| |oracle_text| |flavor_text| |power| |toughness| &allow-other-keys)
      card
    ;; TODO: Move the conditionals into the format string
    (format nil "**~A** ~A~&~A~A~&~A~&*~A*~&~&"
            |name|
            |mana_cost|
            |type_line|
            (if |power| (format nil "~A/~A" |power| |toughness|) "")
            (or |oracle_text| "")
            (or |flavor_text| ""))))
