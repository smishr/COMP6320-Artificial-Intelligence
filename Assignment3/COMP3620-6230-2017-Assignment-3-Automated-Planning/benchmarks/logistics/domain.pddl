;; logistics domain typed version.
;;

(define (domain logistics)
  (:requirements :strips :typing) 
  (:types truck
          airplane - vehicle
          package
          vehicle - physobj
          airport
          location - place
          city
          place 
          physobj - object)
  
  (:predicates 	(in-city ?loc - place ?city - city)
		(located ?obj - physobj ?loc - place)
		(in ?pkg - package ?veh - vehicle))
  
(:action load-truck
   :parameters    (?pkg - package ?truck - truck ?loc - place)
   :precondition  (and (located ?truck ?loc) (located ?pkg ?loc))
   :effect        (and (not (located ?pkg ?loc)) (in ?pkg ?truck)))

(:action load-airplane
  :parameters   (?pkg - package ?airplane - airplane ?loc - place)
  :precondition (and (located ?pkg ?loc) (located ?airplane ?loc))
  :effect       (and (not (located ?pkg ?loc)) (in ?pkg ?airplane)))

(:action unload-truck
  :parameters   (?pkg - package ?truck - truck ?loc - place)
  :precondition (and (located ?truck ?loc) (in ?pkg ?truck))
  :effect       (and (not (in ?pkg ?truck)) (located ?pkg ?loc)))

(:action unload-airplane
  :parameters    (?pkg - package ?airplane - airplane ?loc - place)
  :precondition  (and (in ?pkg ?airplane) (located ?airplane ?loc))
  :effect        (and (not (in ?pkg ?airplane)) (located ?pkg ?loc)))

(:action drive-truck
  :parameters (?truck - truck ?loc-from - place ?loc-to - place ?city - city)
  :precondition
   (and (located ?truck ?loc-from) (in-city ?loc-from ?city) (in-city ?loc-to ?city))
  :effect
   (and (not (located ?truck ?loc-from)) (located ?truck ?loc-to)))

(:action fly-airplane
  :parameters (?airplane - airplane ?loc-from - airport ?loc-to - airport)
  :precondition
   (located ?airplane ?loc-from)
  :effect
   (and (not (located ?airplane ?loc-from)) (located ?airplane ?loc-to)))
)
