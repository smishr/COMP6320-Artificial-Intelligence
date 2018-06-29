;;  #######
;; ##  .  ##
;; # .$$$. #
;; # $. .$ #
;; #.$ @ $.#
;; # $. .$ #
;; # .$$$. #
;; ##  .  ##
;;  #######

(define (problem p146-microban-sequential)
  (:domain sokoban-sequential)
  (:objects
    dir-down - direction
    dir-left - direction
    dir-right - direction
    dir-up - direction
    player-01 - player
    pos-1-1 - location
    pos-1-2 - location
    pos-1-3 - location
    pos-1-4 - location
    pos-1-5 - location
    pos-1-6 - location
    pos-1-7 - location
    pos-1-8 - location
    pos-1-9 - location
    pos-2-1 - location
    pos-2-2 - location
    pos-2-3 - location
    pos-2-4 - location
    pos-2-5 - location
    pos-2-6 - location
    pos-2-7 - location
    pos-2-8 - location
    pos-2-9 - location
    pos-3-1 - location
    pos-3-2 - location
    pos-3-3 - location
    pos-3-4 - location
    pos-3-5 - location
    pos-3-6 - location
    pos-3-7 - location
    pos-3-8 - location
    pos-3-9 - location
    pos-4-1 - location
    pos-4-2 - location
    pos-4-3 - location
    pos-4-4 - location
    pos-4-5 - location
    pos-4-6 - location
    pos-4-7 - location
    pos-4-8 - location
    pos-4-9 - location
    pos-5-1 - location
    pos-5-2 - location
    pos-5-3 - location
    pos-5-4 - location
    pos-5-5 - location
    pos-5-6 - location
    pos-5-7 - location
    pos-5-8 - location
    pos-5-9 - location
    pos-6-1 - location
    pos-6-2 - location
    pos-6-3 - location
    pos-6-4 - location
    pos-6-5 - location
    pos-6-6 - location
    pos-6-7 - location
    pos-6-8 - location
    pos-6-9 - location
    pos-7-1 - location
    pos-7-2 - location
    pos-7-3 - location
    pos-7-4 - location
    pos-7-5 - location
    pos-7-6 - location
    pos-7-7 - location
    pos-7-8 - location
    pos-7-9 - location
    pos-8-1 - location
    pos-8-2 - location
    pos-8-3 - location
    pos-8-4 - location
    pos-8-5 - location
    pos-8-6 - location
    pos-8-7 - location
    pos-8-8 - location
    pos-8-9 - location
    pos-9-1 - location
    pos-9-2 - location
    pos-9-3 - location
    pos-9-4 - location
    pos-9-5 - location
    pos-9-6 - location
    pos-9-7 - location
    pos-9-8 - location
    pos-9-9 - location
    stone-01 - stone
    stone-02 - stone
    stone-03 - stone
    stone-04 - stone
    stone-05 - stone
    stone-06 - stone
    stone-07 - stone
    stone-08 - stone
    stone-09 - stone
    stone-10 - stone
    stone-11 - stone
    stone-12 - stone
  )
  (:init
    (is-goal pos-2-5)
    (is-goal pos-3-3)
    (is-goal pos-3-7)
    (is-goal pos-4-4)
    (is-goal pos-4-6)
    (is-goal pos-5-2)
    (is-goal pos-5-8)
    (is-goal pos-6-4)
    (is-goal pos-6-6)
    (is-goal pos-7-3)
    (is-goal pos-7-7)
    (is-goal pos-8-5)
    (is-nongoal pos-1-1)
    (is-nongoal pos-1-2)
    (is-nongoal pos-1-3)
    (is-nongoal pos-1-4)
    (is-nongoal pos-1-5)
    (is-nongoal pos-1-6)
    (is-nongoal pos-1-7)
    (is-nongoal pos-1-8)
    (is-nongoal pos-1-9)
    (is-nongoal pos-2-1)
    (is-nongoal pos-2-2)
    (is-nongoal pos-2-3)
    (is-nongoal pos-2-4)
    (is-nongoal pos-2-6)
    (is-nongoal pos-2-7)
    (is-nongoal pos-2-8)
    (is-nongoal pos-2-9)
    (is-nongoal pos-3-1)
    (is-nongoal pos-3-2)
    (is-nongoal pos-3-4)
    (is-nongoal pos-3-5)
    (is-nongoal pos-3-6)
    (is-nongoal pos-3-8)
    (is-nongoal pos-3-9)
    (is-nongoal pos-4-1)
    (is-nongoal pos-4-2)
    (is-nongoal pos-4-3)
    (is-nongoal pos-4-5)
    (is-nongoal pos-4-7)
    (is-nongoal pos-4-8)
    (is-nongoal pos-4-9)
    (is-nongoal pos-5-1)
    (is-nongoal pos-5-3)
    (is-nongoal pos-5-4)
    (is-nongoal pos-5-5)
    (is-nongoal pos-5-6)
    (is-nongoal pos-5-7)
    (is-nongoal pos-5-9)
    (is-nongoal pos-6-1)
    (is-nongoal pos-6-2)
    (is-nongoal pos-6-3)
    (is-nongoal pos-6-5)
    (is-nongoal pos-6-7)
    (is-nongoal pos-6-8)
    (is-nongoal pos-6-9)
    (is-nongoal pos-7-1)
    (is-nongoal pos-7-2)
    (is-nongoal pos-7-4)
    (is-nongoal pos-7-5)
    (is-nongoal pos-7-6)
    (is-nongoal pos-7-8)
    (is-nongoal pos-7-9)
    (is-nongoal pos-8-1)
    (is-nongoal pos-8-2)
    (is-nongoal pos-8-3)
    (is-nongoal pos-8-4)
    (is-nongoal pos-8-6)
    (is-nongoal pos-8-7)
    (is-nongoal pos-8-8)
    (is-nongoal pos-8-9)
    (is-nongoal pos-9-1)
    (is-nongoal pos-9-2)
    (is-nongoal pos-9-3)
    (is-nongoal pos-9-4)
    (is-nongoal pos-9-5)
    (is-nongoal pos-9-6)
    (is-nongoal pos-9-7)
    (is-nongoal pos-9-8)
    (is-nongoal pos-9-9)
    (move-dir pos-2-3 pos-2-4 dir-down)
    (move-dir pos-2-3 pos-3-3 dir-right)
    (move-dir pos-2-4 pos-2-3 dir-up)
    (move-dir pos-2-4 pos-2-5 dir-down)
    (move-dir pos-2-4 pos-3-4 dir-right)
    (move-dir pos-2-5 pos-2-4 dir-up)
    (move-dir pos-2-5 pos-2-6 dir-down)
    (move-dir pos-2-5 pos-3-5 dir-right)
    (move-dir pos-2-6 pos-2-5 dir-up)
    (move-dir pos-2-6 pos-2-7 dir-down)
    (move-dir pos-2-6 pos-3-6 dir-right)
    (move-dir pos-2-7 pos-2-6 dir-up)
    (move-dir pos-2-7 pos-3-7 dir-right)
    (move-dir pos-3-2 pos-3-3 dir-down)
    (move-dir pos-3-2 pos-4-2 dir-right)
    (move-dir pos-3-3 pos-2-3 dir-left)
    (move-dir pos-3-3 pos-3-2 dir-up)
    (move-dir pos-3-3 pos-3-4 dir-down)
    (move-dir pos-3-3 pos-4-3 dir-right)
    (move-dir pos-3-4 pos-2-4 dir-left)
    (move-dir pos-3-4 pos-3-3 dir-up)
    (move-dir pos-3-4 pos-3-5 dir-down)
    (move-dir pos-3-4 pos-4-4 dir-right)
    (move-dir pos-3-5 pos-2-5 dir-left)
    (move-dir pos-3-5 pos-3-4 dir-up)
    (move-dir pos-3-5 pos-3-6 dir-down)
    (move-dir pos-3-5 pos-4-5 dir-right)
    (move-dir pos-3-6 pos-2-6 dir-left)
    (move-dir pos-3-6 pos-3-5 dir-up)
    (move-dir pos-3-6 pos-3-7 dir-down)
    (move-dir pos-3-6 pos-4-6 dir-right)
    (move-dir pos-3-7 pos-2-7 dir-left)
    (move-dir pos-3-7 pos-3-6 dir-up)
    (move-dir pos-3-7 pos-3-8 dir-down)
    (move-dir pos-3-7 pos-4-7 dir-right)
    (move-dir pos-3-8 pos-3-7 dir-up)
    (move-dir pos-3-8 pos-4-8 dir-right)
    (move-dir pos-4-2 pos-3-2 dir-left)
    (move-dir pos-4-2 pos-4-3 dir-down)
    (move-dir pos-4-2 pos-5-2 dir-right)
    (move-dir pos-4-3 pos-3-3 dir-left)
    (move-dir pos-4-3 pos-4-2 dir-up)
    (move-dir pos-4-3 pos-4-4 dir-down)
    (move-dir pos-4-3 pos-5-3 dir-right)
    (move-dir pos-4-4 pos-3-4 dir-left)
    (move-dir pos-4-4 pos-4-3 dir-up)
    (move-dir pos-4-4 pos-4-5 dir-down)
    (move-dir pos-4-4 pos-5-4 dir-right)
    (move-dir pos-4-5 pos-3-5 dir-left)
    (move-dir pos-4-5 pos-4-4 dir-up)
    (move-dir pos-4-5 pos-4-6 dir-down)
    (move-dir pos-4-5 pos-5-5 dir-right)
    (move-dir pos-4-6 pos-3-6 dir-left)
    (move-dir pos-4-6 pos-4-5 dir-up)
    (move-dir pos-4-6 pos-4-7 dir-down)
    (move-dir pos-4-6 pos-5-6 dir-right)
    (move-dir pos-4-7 pos-3-7 dir-left)
    (move-dir pos-4-7 pos-4-6 dir-up)
    (move-dir pos-4-7 pos-4-8 dir-down)
    (move-dir pos-4-7 pos-5-7 dir-right)
    (move-dir pos-4-8 pos-3-8 dir-left)
    (move-dir pos-4-8 pos-4-7 dir-up)
    (move-dir pos-4-8 pos-5-8 dir-right)
    (move-dir pos-5-2 pos-4-2 dir-left)
    (move-dir pos-5-2 pos-5-3 dir-down)
    (move-dir pos-5-2 pos-6-2 dir-right)
    (move-dir pos-5-3 pos-4-3 dir-left)
    (move-dir pos-5-3 pos-5-2 dir-up)
    (move-dir pos-5-3 pos-5-4 dir-down)
    (move-dir pos-5-3 pos-6-3 dir-right)
    (move-dir pos-5-4 pos-4-4 dir-left)
    (move-dir pos-5-4 pos-5-3 dir-up)
    (move-dir pos-5-4 pos-5-5 dir-down)
    (move-dir pos-5-4 pos-6-4 dir-right)
    (move-dir pos-5-5 pos-4-5 dir-left)
    (move-dir pos-5-5 pos-5-4 dir-up)
    (move-dir pos-5-5 pos-5-6 dir-down)
    (move-dir pos-5-5 pos-6-5 dir-right)
    (move-dir pos-5-6 pos-4-6 dir-left)
    (move-dir pos-5-6 pos-5-5 dir-up)
    (move-dir pos-5-6 pos-5-7 dir-down)
    (move-dir pos-5-6 pos-6-6 dir-right)
    (move-dir pos-5-7 pos-4-7 dir-left)
    (move-dir pos-5-7 pos-5-6 dir-up)
    (move-dir pos-5-7 pos-5-8 dir-down)
    (move-dir pos-5-7 pos-6-7 dir-right)
    (move-dir pos-5-8 pos-4-8 dir-left)
    (move-dir pos-5-8 pos-5-7 dir-up)
    (move-dir pos-5-8 pos-6-8 dir-right)
    (move-dir pos-6-2 pos-5-2 dir-left)
    (move-dir pos-6-2 pos-6-3 dir-down)
    (move-dir pos-6-2 pos-7-2 dir-right)
    (move-dir pos-6-3 pos-5-3 dir-left)
    (move-dir pos-6-3 pos-6-2 dir-up)
    (move-dir pos-6-3 pos-6-4 dir-down)
    (move-dir pos-6-3 pos-7-3 dir-right)
    (move-dir pos-6-4 pos-5-4 dir-left)
    (move-dir pos-6-4 pos-6-3 dir-up)
    (move-dir pos-6-4 pos-6-5 dir-down)
    (move-dir pos-6-4 pos-7-4 dir-right)
    (move-dir pos-6-5 pos-5-5 dir-left)
    (move-dir pos-6-5 pos-6-4 dir-up)
    (move-dir pos-6-5 pos-6-6 dir-down)
    (move-dir pos-6-5 pos-7-5 dir-right)
    (move-dir pos-6-6 pos-5-6 dir-left)
    (move-dir pos-6-6 pos-6-5 dir-up)
    (move-dir pos-6-6 pos-6-7 dir-down)
    (move-dir pos-6-6 pos-7-6 dir-right)
    (move-dir pos-6-7 pos-5-7 dir-left)
    (move-dir pos-6-7 pos-6-6 dir-up)
    (move-dir pos-6-7 pos-6-8 dir-down)
    (move-dir pos-6-7 pos-7-7 dir-right)
    (move-dir pos-6-8 pos-5-8 dir-left)
    (move-dir pos-6-8 pos-6-7 dir-up)
    (move-dir pos-6-8 pos-7-8 dir-right)
    (move-dir pos-7-2 pos-6-2 dir-left)
    (move-dir pos-7-2 pos-7-3 dir-down)
    (move-dir pos-7-3 pos-6-3 dir-left)
    (move-dir pos-7-3 pos-7-2 dir-up)
    (move-dir pos-7-3 pos-7-4 dir-down)
    (move-dir pos-7-3 pos-8-3 dir-right)
    (move-dir pos-7-4 pos-6-4 dir-left)
    (move-dir pos-7-4 pos-7-3 dir-up)
    (move-dir pos-7-4 pos-7-5 dir-down)
    (move-dir pos-7-4 pos-8-4 dir-right)
    (move-dir pos-7-5 pos-6-5 dir-left)
    (move-dir pos-7-5 pos-7-4 dir-up)
    (move-dir pos-7-5 pos-7-6 dir-down)
    (move-dir pos-7-5 pos-8-5 dir-right)
    (move-dir pos-7-6 pos-6-6 dir-left)
    (move-dir pos-7-6 pos-7-5 dir-up)
    (move-dir pos-7-6 pos-7-7 dir-down)
    (move-dir pos-7-6 pos-8-6 dir-right)
    (move-dir pos-7-7 pos-6-7 dir-left)
    (move-dir pos-7-7 pos-7-6 dir-up)
    (move-dir pos-7-7 pos-7-8 dir-down)
    (move-dir pos-7-7 pos-8-7 dir-right)
    (move-dir pos-7-8 pos-6-8 dir-left)
    (move-dir pos-7-8 pos-7-7 dir-up)
    (move-dir pos-8-3 pos-7-3 dir-left)
    (move-dir pos-8-3 pos-8-4 dir-down)
    (move-dir pos-8-4 pos-7-4 dir-left)
    (move-dir pos-8-4 pos-8-3 dir-up)
    (move-dir pos-8-4 pos-8-5 dir-down)
    (move-dir pos-8-5 pos-7-5 dir-left)
    (move-dir pos-8-5 pos-8-4 dir-up)
    (move-dir pos-8-5 pos-8-6 dir-down)
    (move-dir pos-8-6 pos-7-6 dir-left)
    (move-dir pos-8-6 pos-8-5 dir-up)
    (move-dir pos-8-6 pos-8-7 dir-down)
    (move-dir pos-8-7 pos-7-7 dir-left)
    (move-dir pos-8-7 pos-8-6 dir-up)
    (located player-01 pos-5-5)
    (located stone-01 pos-4-3)
    (located stone-02 pos-5-3)
    (located stone-03 pos-6-3)
    (located stone-04 pos-3-4)
    (located stone-05 pos-7-4)
    (located stone-06 pos-3-5)
    (located stone-07 pos-7-5)
    (located stone-08 pos-3-6)
    (located stone-09 pos-7-6)
    (located stone-10 pos-4-7)
    (located stone-11 pos-5-7)
    (located stone-12 pos-6-7)
    (clear pos-1-1)
    (clear pos-1-9)
    (clear pos-2-3)
    (clear pos-2-4)
    (clear pos-2-5)
    (clear pos-2-6)
    (clear pos-2-7)
    (clear pos-3-2)
    (clear pos-3-3)
    (clear pos-3-7)
    (clear pos-3-8)
    (clear pos-4-2)
    (clear pos-4-4)
    (clear pos-4-5)
    (clear pos-4-6)
    (clear pos-4-8)
    (clear pos-5-2)
    (clear pos-5-4)
    (clear pos-5-6)
    (clear pos-5-8)
    (clear pos-6-2)
    (clear pos-6-4)
    (clear pos-6-5)
    (clear pos-6-6)
    (clear pos-6-8)
    (clear pos-7-2)
    (clear pos-7-3)
    (clear pos-7-7)
    (clear pos-7-8)
    (clear pos-8-3)
    (clear pos-8-4)
    (clear pos-8-5)
    (clear pos-8-6)
    (clear pos-8-7)
    (clear pos-9-1)
    (clear pos-9-9)
    
  )
  (:goal (and
    (at-goal stone-01)
    (at-goal stone-02)
    (at-goal stone-03)
    (at-goal stone-04)
    (at-goal stone-05)
    (at-goal stone-06)
    (at-goal stone-07)
    (at-goal stone-08)
    (at-goal stone-09)
    (at-goal stone-10)
    (at-goal stone-11)
    (at-goal stone-12)
  ))
  
)
