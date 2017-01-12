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
      member(X, T), hasdups(T).
    
    prod([X], X).
    prod([X | T], P) :-
      prod(T, Y),
      P is Y * X.

    % L2 is a sublist of list L1 starting from pos N
    % Count positions 1..N
    contains(L1, L2, N) :-
      append(L3, _1, L1), append(YS, L2, L3), length(YS, M), N is M + 1.
    
    sorting_add_poly(P1, P2, P) :-
  	sort(P1, P1sorted), sort(P2, P2sorted), add_poly(P1sorted, P2sorted, P).      

    add_poly([], P, P).
    add_poly(P, [], P).
    add_poly([(C1, I1) | PS], [(C2, I2) | PSS],[ (C, I1) | P]) :-
          I1 =:= I2, C is C1 + C2, add_poly(PS, PSS, P).
    add_poly([(C1, I1) | PS], [(C2, I2) | PSS], [ (C1, I1) | P]) :-
	  I2 < I1, add_poly(PS, [(C2, I2) | PSS], P).
    add_poly([(C1, I1) | PS], [(C2, I2) | PSS], [(C2, I2) | P]) :-
          I1 < I2, add_poly([(C1, I1) | PS], PSS, P). 			  
