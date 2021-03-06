/*

    Comp 2: 276 Introduction to Prolog

    File: family.pl - cjh

*/

mother_of(M, X) :-
  child_of(X, M), female(M).

grandparent_of(GP, X) :-
  child_of(Y, GP), child_of(X, Y).

daughter_of(D, X) :-
  child_of(D, X), female(D).

uncle_of(Unc, X) :-
  grandparent_of(GP, X), child_of(Unc, GP), \+child_of(X, Unc), male(Unc).

niece_of(N, X) :-
  female(N), grandparent_of(GP, N), child_of(X, GP), \+child_of(N, X).

great_grandfather_of(Gfx, X) :-
  grandparent_of(GP, X), child_of(GP, Gfx), male(Gfx).

ancestor_of(Anc, X) :-
  child_of(X, Anc).
ancestor_of(Anc, X) :- 
  child_of(X, Y), ancestor_of(Anc, Y).

child_of( emmeline, frank ). 
child_of( amelia, frank ).
child_of( harold, frank ).
child_of( chris, amelia ).
child_of( chris, john ).
child_of( emlyn, chris ).
child_of( emlyn, elizabeth ).
child_of( brendon, chris ).
child_of( brendon, elizabeth ). 
child_of( irene, maurice ).
child_of( les, maurice ).
child_of( elizabeth, irene ).
child_of( elizabeth, george ).
child_of( margaret, irene ).
child_of( margaret, george ).
child_of( rebecca, margaret ).
child_of( louise, margaret ).   
child_of( nick, margaret ).
child_of( rebecca, peter ).
child_of( louise, peter ).
child_of( nick, peter ).

male( frank ).   
male( harold ).
male( chris ).
male( john ).
male( emlyn ).
male( brendon ).
male( maurice ).
male( les ).
male( nick ).
male( peter ).
male( george ).

female( emmeline ).
female( amelia ).
female( elizabeth ).
female( irene ).
female( margaret ).
female( rebecca ).
female( louise ).

% end of data
