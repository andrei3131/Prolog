    /*

        C2-  Module 276: Laboratory (Prolog)

	graph for Exercise 2 - part II cjh/mjs

    */


    % --------------------- Question 1 --------------------------------

    % 1.    An acyclic directed graph is represented by the following facts:
    
    % ?X, ?Z can be given or be unbound variables
    path( X, Z ) :-
      arc( X, Z ).
    path( X, Z ) :-
      arc( X, Y ), path( Y, Z ).

    arc( a, b ).
    arc( b, c ).
    arc( b, d ).
    arc( c, f ).
    arc( d, f ).
    arc( c, e ).
    arc( f, e ).

    % plus(?X, ?Y, ?Z) iff X + Y = Z
    plus(X, 0, X).
    plus(X, s(Y), s(Z)) :-
      plus(X, Y, Z). 
   
    % odd(?X)
    odd(X) :-
     plus(Y, s(Y), X). 

    % ones_zeros( ?X )
    ones_zeros([]).
    ones_zeros([0 | T]) :-
      ones_zeros(T).
    ones_zeros([1 | T]) :-
      ones_zeros(T).

    % hasdups(?X)
    hasdups([X | T]) :- 
      member(X, T).
    
    prod([X | T], P) :- TODO
