choose(Path, [Path | Paths], Paths).

combine(Exps,Paths,NewPaths):-
 append(Exps,Paths,UnsortedNewPaths),
 findall(c(C,[node(S,C)|Rest]),
         member([node(S,C)|Rest], UnsortedNewPaths),
         Cs),
 list_to_ord_set(Cs, OCs),
 findall(P, member(c(_,P), OCs), NewPaths).
