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
  (card_faces nil :type (or list null))
  (cmc nil :type float)
  (colors nil :type (or list null))
  (color_identity nil :type list)
  (edhrec_rank nil :type (or integer null))
  (foil nil :type boolean)
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
  (full_art nil :type boolean)
  (futureshifted nil :type boolean)
  (highres_image nil :type boolean)
  (illustration_id nil :type (or string null))
  (image_uris nil :type (or list null))
  (printed_name nil :type (or string null))
  (printed_type_line nil :type (or string null))
  (printed_text nil :type (or string null))
  (purchase_uris nil :type list)
  (rarity nil :type string)
  (related_uris nil :type list)
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
