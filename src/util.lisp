;;;; util.lisp

(in-package #:cl-scryfall)

(defun build-url (path)
  "Adds path to the base url."
  (format nil "~a~a" +scryfall+ path))

(defun epairlis (keys data)
  "Returns a drakma compatible alist based on given keys and data"
  ;; TODO: Optimize this or maybe just stop using it at all
  (remove-if #'(lambda(x) (or
                           (not (cdr x))
                           (string= (cdr x) "NIL")))
             (pairlis keys
                      (mapcar #'(lambda(x) (format nil "~A" x))
                              data))))

(defun load-url-as-json (url &optional &key params)
  "Load a given url into a plist"
  (jonathan:parse
   (flexi-streams:octets-to-string
    (drakma:http-request url :method :get :user-agent +user-agent+ :parameters params) :external-format :utf-8)))

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
