(define (domain sokoban-sequential)
  (:requirements :typing )
  (:types thing location direction - object
          player stone - thing)
  (:predicates (clear ?l - location)
	       (located ?t - thing ?l - location)
	       (at-goal ?s - stone)
	       (is-goal ?l - location)
	       (is-nongoal ?l - location)
               (move-dir ?from ?to - location ?dir - direction))
  

  (:action move
   :parameters (?p - player ?from ?to - location ?dir - direction)
   :precondition (and (located ?p ?from)
                      (clear ?to)
                      (move-dir ?from ?to ?dir)
                      )
   :effect       (and (not (located ?p ?from))
                      (not (clear ?to))
                      (located ?p ?to)
                      (clear ?from)
                      )
   )

  (:action push-to-nongoal
   :parameters (?p - player ?s - stone
                ?ppos ?from ?to - location
                ?dir - direction)
   :precondition (and (located ?p ?ppos)
                      (located ?s ?from)
                      (clear ?to)
                      (move-dir ?ppos ?from ?dir)
                      (move-dir ?from ?to ?dir)
                      (is-nongoal ?to)
                      )
   :effect       (and (not (located ?p ?ppos))
                      (not (located ?s ?from))
                      (not (clear ?to))
                      (located ?p ?from)
                      (located ?s ?to)
                      (clear ?ppos)
                      (not (at-goal ?s))
                      
                      )
   )

  (:action push-to-goal
   :parameters (?p - player ?s - stone
                ?ppos ?from ?to - location
                ?dir - direction)
   :precondition (and (located ?p ?ppos)
                      (located ?s ?from)
                      (clear ?to)
                      (move-dir ?ppos ?from ?dir)
                      (move-dir ?from ?to ?dir)
                      (is-goal ?to)
                      )
   :effect       (and (not (located ?p ?ppos))
                      (not (located ?s ?from))
                      (not (clear ?to))
                      (located ?p ?from)
                      (located ?s ?to)
                      (clear ?ppos)
                      (at-goal ?s)
                      
                      )
   )
)
