(in-package :cl-user)
(defpackage cl-scryfall.card-struct
  (:use :cl)
  (:export
   #:card-arena_id
   #:card-tcgplayer_id
   #:card-id
   #:card-lang
   #:card-mtgo_id
   #:card-mtgo_foil_id
   #:card-multiverse_ids
   #:card-object
   #:card-oracle_id
   #:card-prints_search_uri
   #:card-rulings_uri
   #:card-scryfall_uri
   #:card-uri
   #:card-all_parts
   #:card-card_faces
   #:card-cmc
   #:card-colors
   #:card-color_identity
   #:card-edhrec_rank
   #:card-foil
   #:card-list
   #:card-hand_modifier
   #:card-layout
   #:card-legalities
   #:card-life_modifier
   #:card-loyalty
   #:card-mana_cost
   #:card-name
   #:card-nonfoil
   #:card-oracle_text
   #:card-oversized
   #:card-power
   #:card-reserved
   #:card-toughness
   #:card-type_line
   #:card-artist
   #:card-border_color
   #:card-collector_number
   #:card-colorshifted
   #:card-digital
   #:card-eur
   #:card-flavor_text
   #:card-frame
   #:card-frame_effect
   #:card-full_art
   #:card-futureshifted
   #:card-highres_image
   #:card-illustration_id
   #:card-image_uris
   #:card-printed_name
   #:card-printed_type_line
   #:card-printed_text
   #:card-promo
   #:card-purchase_uris
   #:card-rarity
   #:card-related_uris
   #:card-released_at
   #:card-reprint
   #:card-scryfall_set_uri
   #:card-set
   #:card-set_name
   #:card-set_search_uri
   #:card-set_uri
   #:card-story_spotlight_number
   #:card-story_spotlight_uri
   #:card-timeshifted
   #:card-tix
   #:card-usd
   #:card-watermark))

(in-package :cl-scryfall.card-struct)

(defstruct card
  ;; Core Card Fields
  (arena_id nil :type (or integer null))
  (tcgplayer_id nil :type (or integer null))
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
  (card_faces nil :type (or list null))
  (cmc nil :type float)
  (colors nil :type (or list null))
  (color_identity nil :type list)
  (edhrec_rank nil :type (or integer null))
  (foil nil :type boolean)
  (games nil :type list)
  (hand_modifier nil :type (or string null))
  (layout nil :type string)
  (legalities nil :type list)
  (life_modifier nil :type (or string null))
  (loyalty nil :type (or string null))
  (mana_cost nil :type (or string null))
  (name nil :type string)
  (nonfoil nil :type boolean)
  (oracle_text nil :type (or string null))
  (oversized nil :type boolean)
  (power nil :type (or string null))
  (reserved nil :type boolean)
  (toughness nil :type (or string null))
  (type_line nil :type string)
  ;; Print Fields
  (artist nil :type (or string null))
  (border_color nil :type string)
  (collector_number nil :type string)
  (colorshifted nil :type boolean)
  (digital nil :type boolean)
  (eur nil :type (or string null))
  (flavor_text nil :type (or string null))
  (frame nil :type string)
  (frame_effect nil :type string)
  (full_art nil :type boolean)
  (futureshifted nil :type boolean)
  (highres_image nil :type boolean)
  (illustration_id nil :type (or string null))
  (image_uris nil :type (or list null))
  (printed_name nil :type (or string null))
  (printed_type_line nil :type (or string null))
  (printed_text nil :type (or string null))
  (promo nil :type boolean)
  (purchase_uris nil :type list)
  (rarity nil :type string)
  (related_uris nil :type list)
  (released_at nil :type string)
  (reprint nil :type boolean)
  (scryfall_set_uri nil :type string)
  (set nil :type string)
  (set_name nil :type string)
  (set_search_uri nil :type string)
  (set_uri nil :type string)
  (story_spotlight nil :type boolean)
  (timeshifted nil :type boolean)
  (tix nil :type (or string null))
  (usd nil :type (or string null))
  (watermark nil :type (or string null)))
