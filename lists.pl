% all_members(+X, +Y)
  all_members([], _).
  all_members([H | T], Y) :-
    member(H, Y), all_members(T, Y). 

% pairs(+X, ?Y)
  pairs([], []).
  pairs([H | T], [(U, V) | TP]) :-
    U is H - 1, V is H + 1, pairs(T, TP).

% arb_pairs(+X, ?Y)
  arb_pairs([], []).
  arb_pairs([H | T], [(N, L) | TP]) :-
    N is H, L is N, arb_pairs(T, TP).
  arb_pairs([H | T], [(N, L) | TP]) :-
    N is H, L is 2 * N, arb_pairs(T, TP).

% replace_wrap(+X, +Res)
  replace_wrap([], []).
  replace_wrap([H | T], [wrap(H) | WS]) :-
    replace_wrap(T, WS).
  
  replace_wrap_findall([], []).
  replace_wrap_findall(X, L) :-
    findall(wrap(H), member(H, X), L).

% even_members(+X, ?Y)
  even_members([], []).
  even_members([_], []).
  even_members([_, Y | T], [Y | P]) :-
    even_members(T, P).
    	

% odd_even_members(+X, ?Y, ?Z)
  odd_even_members([], [], []).
  odd_even_members([X], [X], []).
  odd_even_members([X, Y], [X], [Y]).
  odd_even_members([X, Y | T], [X | Odds], [Y | Evens]) :-
    odd_even_members(T, Odds, Evens).


% number OR a(X, Y) OR m(X, Y)
  numval(N, V) :-
    number(N), V is N.
  numval(a(Lhs, Rhs), V) :-
    numval(Lhs, L), numval(Rhs, R), V is L + R.
  numval(m(Lhs, Rhs), V) :-
    numval(Lhs, L), numval(Rhs, R), V is L * R.


% Challenge
  node(b).
  node(g).
  node(m).
  node(n).
  node(p).
  node(t).
 
  edge(na, t).
  edge(t, p).
  edge(n, m).
  edge(m, p).
  edge(g, b).

  connected_parts(Components) :-
    findall([N], node(N), Initial),
    join_components(Initial, Components).
/*  
  join_components(Now, Now) :-
    \+ join_two_components(Now, _).
  join_components(Now, Components) :-
    join_two_components(Now, Reduced),
    join_components(Reduced, Components).
*/  
  join_two_components(Now, [Combined | Rest]) :-
    pick_pair(Now, Comp1, Comp2, Rest),
    member(X, Comp1),
    member(Y, Comp2),
    (edge(X, Y); edge(Y, X)),
    merge_lists(Comp1, Comp2, Combined).

  pick_pair(List, X, Y, Rest) :-
    select(X, List, Rem),
    select(Y, Rem, Rest).
  
  % select(?Element, ?List, ?List2) (As implemented in Sicstus)
  % The result of removing Element from List is List2
  % Implementation is as follows:

  select(X, [X | Y], Y).
  select(X, [U | Y], [U | Z]) :-
    select(X, Y, Z).
 
  % Merge two ordered lists
  merge_lists(Comp1, Comp2, Merged) :-
    append(Comp1, Comp2, Both),
    sort(Both, Merged).	      


  % More efficient
  join_components(Initial, Components) :-
    join_components(go, Initial, Components).
       
  join_components(stop, Now, Now).
  join_components(go, Now, Components) :-
    (join_two_components(Now, Reduced)
     ->
     Next = go
     ;
     Next = stop, Reduced = Now
    ), join_components(Next, Reduced, Components).


