% domains
val(1..9).
border(1;4;7).
% alldifferent rows, columns, values
1 { x(X,Y,N) : val(N) } 1 :- val(X;Y).
1 { x(X,Y,N) : val(X) } 1 :- val(N;Y).
1 { x(X,Y,N) : val(Y) } 1 :- val(N;X). 
% alldifferent: boxes
1 { x(X,Y,N) : val(X;Y):
    X1<=X:X<=X1+2:Y1<=Y:Y<=Y1+2 } 1 :- val(N), border(X1;Y1).
