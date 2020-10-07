(define (domain blocks-room)
(:predicates (room ?r) (block ?b) (robotIn ?r)
(at ?b ?r) (faka) (holding ?b) 
(on ?x ?y) (ontable ?x)  (clear ?x))

(:action pick-up
	     :parameters (?x ?r)
	     :precondition (and (clear ?x) (ontable ?x) (faka)(block ?x) (room ?r)(at ?x ?r) (robotIn ?r))
	     :effect
	     (and (not (ontable ?x))
		   (not (clear ?x))
		   (not (faka))
			 (not (at ?x ?r))
		   (holding ?x)))

(:action put-down
	     :parameters (?x ?r)
	     :precondition (and (block ?x) (room ?r) (holding ?x) (robotIn ?r))
	     :effect
	     (and (not (holding ?x))
			 (at ?x ?r)
		   (clear ?x)
		   (faka)
		   (ontable ?x)))
			
  (:action stack
	     :parameters (?x ?y ?r)
	     :precondition (and (holding ?x) (clear ?y)
			 (block ?x) (room ?r)(at ?y ?r) (robotIn ?r))
	     :effect
	     (and (not (holding ?x))
			 (at ?x ?r)
		   (not (clear ?y))
		   (clear ?x)
		   (faka)
		   (on ?x ?y)))
			
  (:action unstack
	     :parameters (?x ?y ?r)
	     :precondition (and (on ?x ?y) (clear ?x) (faka)
			 (block ?x) (room ?r) (at ?x ?r) (robotIn ?r))
	     :effect
	     (and (holding ?x)
			 (not (at ?x ?r))
		   (clear ?y)
		   (not (clear ?x))
		   (not (faka))
		   (not (on ?x ?y))))

	(:action move
			:parameters (?from ?to)
			:precondition (and (room ?from) (room ?to) (robotIn ?from))
			:effect (and (robotIn ?to) (not (robotIn ?from)))))