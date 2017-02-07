% ----- arc/3
%
% Edges in the state space.
% arc/3 is defined in terms of undir_arc/3, to give a symmetric
% relation.

arc(X,Y,C) :-
  undir_arc(X,Y,C).

arc(Y,X,C) :-
  undir_arc(X,Y,C).

% The third argument here is the distance by road
% between the two cities. 'Arad' is represented by 'a',
% 'Bucharest' by 'b', etc.

undir_arc(a,z,75).
undir_arc(a,s,140).
undir_arc(a,t,118).
undir_arc(b,u,85).
undir_arc(b,p,101).
undir_arc(b,g,90).
undir_arc(b,f,211).
undir_arc(c,d,120).
undir_arc(c,r,146).
undir_arc(c,p,138).
undir_arc(d,m,75).
undir_arc(e,h,86).
undir_arc(f,s,99).
undir_arc(h,u,98).
undir_arc(i,v,92).
undir_arc(i,n,87).
undir_arc(l,t,111).
undir_arc(l,m,70).
undir_arc(o,z,71).
undir_arc(o,s,151).
undir_arc(p,r,97).
undir_arc(r,s,80).
undir_arc(u,v,142).

%the goal is to reach bucharest
goal(b).

% ----- heuristic/2  defined in terms of heuristic/3 ---- needed to define greedy-best-firt and A*
%
% The heuristic for this example is the 'straight line' distance
% (the distance a crow would fly) between two cities. This is
% calculated using the predicate distance/3, using information about
% the x-y co-ordinates of the cities. (Note that this co-ordinate
% information is EXTERNAL to the problem description.)

heuristic(X,Val):-
	heuristic(X,b,Val).

heuristic(X,Y,Val) :-
        distance(X,Y,Val).

% ----- distance/3

distance(City1, City2, Distance) :-
  co_ords(City1, City1X, City1Y),
  co_ords(City2, City2X, City2Y),
  XSep is City1X - City2X,
  YSep is City1Y - City2Y,
  Distance is sqrt((XSep * XSep) + (YSep * YSep)).

% ----- co_ords/2
%
% 'Map' co-ordinates for Romanian cities.

co_ords(a,91,492).
co_ords(b,400,327).
co_ords(c,253,288).
co_ords(d,165,299).
co_ords(e,562,293).
co_ords(f,305,449).
co_ords(g,375,270).
co_ords(h,534,350).
co_ords(i,473,506).
co_ords(l,165,379).
co_ords(m,168,339).
co_ords(n,406,537).
co_ords(o,131,571).
co_ords(p,320,368).
co_ords(r,233,410).
co_ords(s,207,457).
co_ords(t,94,410).
co_ords(u,456,350).
co_ords(v,509,444).
co_ords(z,108,531).
