(define (problem logistics-6-3)
(:domain logistics)
(:objects
 apn1 - airplane
 apt2 apt1 - airport
 pos2 pos1 - location
 cit2 cit1 - city
 tru2 tru1 - truck
 obj23 obj22 obj21 obj13 obj12 obj11 - package)

(:init (located apn1 apt2) (located tru1 pos1) (located obj11 pos1)
 (located obj12 pos1) (located obj13 pos1) (located tru2 pos2) (located obj21 pos2) (located obj22 pos2)
 (located obj23 pos2) (in-city pos1 cit1) (in-city apt1 cit1) (in-city pos2 cit2)
 (in-city apt2 cit2))

(:goal (and (located obj12 pos1) (located obj23 pos1) (located obj11 apt1) (located obj22 apt1)
            (located obj13 pos2) (located obj21 pos2)))
)

