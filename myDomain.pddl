(define (domain blocks-room)
(:predicates (room ?r) (ball ?b) (position ?r)
(at ?b ?r) (faka) (holding ?o) 
(on ?x ?y) (ontable ?x)  (clear ?x))


(:action pick-up
	     :parameters (?x ?r)
	     :precondition (and (clear ?x) (ontable ?x) (faka)(ball ?x) (room ?r)(at ?x ?r) (position ?r))
	     :effect
	     (and (not (ontable ?x))
		   (not (clear ?x))
		   (not (faka))
			 (not (at ?x ?r))
		   (holding ?x)))


  (:action put-down
	     :parameters (?x ?r)
	     :precondition (and (ball ?x) (room ?r)
(holding ?x) (position ?r))
	     :effect
	     (and (not (holding ?x))
			 (at ?x ?r)
		   (clear ?x)
		   (faka)
		   (ontable ?x)))
			 ; (:action drop
; :parameters (?obj ?room)
; :precondition (and (ball ?obj) (room ?room)
; (holding ?obj) (position ?room))
; :effect (and (at ?obj ?room) (faka)
; (not (holding ?obj))))
  (:action stack
	     :parameters (?x ?y ?r)
	     :precondition (and (holding ?x) (clear ?y)
			 (ball ?x) (room ?r)
  (position ?r)
			 )
	     :effect
	     (and (not (holding ?x))
			 (at ?x ?r)
		   (not (clear ?y))
		   (clear ?x)
		   (faka)
		   (on ?x ?y)))
			 ; (:action pick
; :parameters (?obj ?room)
; :precondition (and (ball ?obj) (room ?room) 
; (at ?obj ?room) (position ?room) (faka))
; :effect (and (holding ?obj) (not (at ?obj ?room))
; (not (faka))))
  (:action unstack
	     :parameters (?x ?y ?r)
	     :precondition (and (on ?x ?y) (clear ?x) (faka)
			 (ball ?x) (room ?r) 
 (at ?x ?r) (position ?r)			 
			 )
	     :effect
	     (and (holding ?x)
			 (not (at ?x ?r))
		   (clear ?y)
		   (not (clear ?x))
		   (not (faka))
		   (not (on ?x ?y))))
(:action move
:parameters (?from ?to)
:precondition (and (room ?from) (room ?to) (position ?from))
:effect (and (position ?to) (not (position ?from))))


)


