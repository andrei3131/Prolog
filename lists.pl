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
  arc(b, g).
  arc(g, b).
  arc(m, n).
  arc(n, m).
  arc(n, t).
  arc(t, n).
  arc(t, p).
  arc(p ,t).
  arc(p, m).
  arc(m, p).

  connected_parts(Components) :-
    findall([N], node(N), Initial),
    join_components(Initial, Components).
  
  join_components([], []).
  join_components([S | SS] , [ C | CS]) :-
    findall(X, arc(X))  % Use cut somewhere
