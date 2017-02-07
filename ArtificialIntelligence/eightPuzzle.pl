goal([1, 2, 3, 4, 5, 6, 7, 8, 0]).

arc(State, NewState) :-
  newState(State, NewState).

/* newState(+OldState, ?NewState) */
newState(State, NewState) :- 
  findElemCoordinates(0, State, L, C),
  C > 0,
  moveLeft(State, NewState, L, C).

newState(State, NewState) :- 
  findElemCoordinates(0, State, L, C),
  C < 2,
  moveRight(State, NewState, L, C).

newState(State, NewState) :- 
  findElemCoordinates(0, State, L, C), 
  L < 2,
  moveDown(State, NewState, L, C).

newState(State, NewState) :- 
  findElemCoordinates(0, State, L, C),
  L > 0,
  moveUp(State, NewState, L, C).


moveDown(State, NewState, L, C) :-
  L1 is L + 1,
  getPosition(L1, C, Pos),
  getPosition(L, C, PosZero),
  swap(State, NewState, PosZero, Pos).

moveUp(State, NewState, L, C) :-
  L1 is L - 1,
  getPosition(L1, C, Pos),
  getPosition(L, C, PosZero),
  swap(State, NewState, PosZero, Pos).

moveLeft(State, NewState, L, C) :-
  C1 is C - 1,
  getPosition(L, C1, Pos),
  getPosition(L, C, PosZero),
  swap(State, NewState, PosZero, Pos).

moveRight(State, NewState, L, C) :-
  C1 is C + 1,
  getPosition(L, C1, Pos),
  getPosition(L, C, PosZero),
  swap(State, NewState, PosZero, Pos).


findElemCoordinates(X, State, L, C) :-
  append(List, _, State),
  append(L1, [X | _], List),
  length(L1, Pos),
  getCoordinates(Pos, L, C), !.


getCoordinates(Position, L, C) :-
  L is div(Position, 3),
  C is mod(Position, 3),
  inBounds(L),
  inBounds(C).

inBounds(Coord) :-
  Coord >= 0,
  Coord < 3.

getPosition(L, C, Pos) :-
  Pos is 3 * L + C.


swap(State, NextState, I, J) :-
   same_length(State, NextState),
   append(BeforeI,[AtI|PastI], State),
   append(BeforeI,[AtJ|PastI], Bs),
   append(BeforeJ,[AtJ|PastJ], Bs),
   append(BeforeJ,[AtI|PastJ], NextState),
   length(BeforeI, I),
   length(BeforeJ, J).

