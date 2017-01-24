goal([1, 2, 3, 4, 5, 6, 7, 8, 0]).

findElemCoordinates(X, State, L, C) :-
  append(List, _, State),
  append(L1, [X | L2], List),
  Pos is length(L1) + 1,
  L * 3 + C is Pos,
  L < 3,
  C < 3.
