:-use_module(library(lists)).
:-op(900,xfx,expands).

/* 
search(Paths,Path) is true when Path is an extension of some path in Paths to a goal state 
all paths in Paths are from the initial state
Path is a list of nodes
Paths is a list of lists
Nodes are representes as node(State,Cost) where Cost is the path-cost of having travelled to the node corresponding to State
*/

/*need definition of predicates
choose(Path,Paths,RestofPaths): 
      choice of a path Path within Paths, giving a left-over of RestofPaths
combine(Successors,Paths,NewPaths):
      amalgamating a newly computed set of successors of a node
      into the current Paths to give NewPaths
arc(State,NextState,Cost) 
to define the graph being searched (Cost is the cost of the step-cost)
goal(State)
      to define which goal states the search aims at achieving
*/


/*call with search([[node(s0,0)]],X) where s0 is the initial state */

search(Paths,X):-
	choose([node(State,Cost)|Path],Paths,_),
	goal(State),
	reverse([node(State,Cost)|Path],X).

search(Paths,Path):-
        choose(P,Paths,RestofPaths),
        findall([N|P],N expands P,Exps),
        combine(Exps,RestofPaths, NewPaths),
	search(NewPaths,Path).


node(NewState,C) expands [node(State,Cost)|_]:-
	arc(State,NewState,NewCost),
        C is Cost+NewCost.
