/* choose initial state: a  */

/* all arcs have step-cost 1:
*/

arc(X,Y,1) :- arc(X,Y).

arc(a,b).
arc(a,f).
arc(b,c).
arc(b,e).
arc(b,f).

/* or set step-cost of arcs as needed/wanted, e.g. 
arc(a,b,1).
arc(a,f,10).
arc(b,c,1).
arc(b,e,1).
arc(b,f,1).
*/


goal(f).
