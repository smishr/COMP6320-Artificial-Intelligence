(define (problem logistics-8-0)

(:domain logistics)
(:objects
  apn1 - airplane
  apt3 apt2 apt1 - airport
   pos3 pos2 pos1 - location
   cit3 cit2 cit1 - city
   tru3 tru2 tru1 - truck
   obj33 obj32 obj31 obj23 obj22 obj21 obj13 obj12 obj11 - package)

(:init 
 (located apn1 apt1) (located tru1 pos1) (located obj11 pos1) (located obj12 pos1) (located obj13 pos1)
 (located tru2 pos2) (located obj21 pos2) (located obj22 pos2) (located obj23 pos2) (located tru3 pos3)
 (located obj31 pos3) (located obj32 pos3) (located obj33 pos3) (in-city pos1 cit1)
 (in-city apt1 cit1) (in-city pos2 cit2) (in-city apt2 cit2) (in-city pos3 cit3)
 (in-city apt3 cit3))

(:goal (and (located obj11 pos3) (located obj21 pos2) (located obj31 apt3) (located obj22 pos3)
            (located obj12 pos1) (located obj23 apt2) (located obj13 apt2) (located obj32 apt1)))
)

