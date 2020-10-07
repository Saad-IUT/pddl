(define (domain blocks-room)
(:predicates (room ?r) (ball ?b) (position ?r)
(at ?b ?r) (faka) (holding ?o))

(:action move
:parameters (?from ?to)
:precondition (and (room ?from) (room ?to) (position ?from))
:effect (and (position ?to) (not (position ?from))))

(:action pick
:parameters (?obj ?room)
:precondition (and (ball ?obj) (room ?room) 
(at ?obj ?room) (position ?room) (faka))
:effect (and (holding ?obj) (not (at ?obj ?room))
(not (faka))))

(:action drop
:parameters (?obj ?room)
:precondition (and (ball ?obj) (room ?room)
(holding ?obj) (position ?room))
:effect (and (at ?obj ?room) (faka)
(not (holding ?obj)))))

