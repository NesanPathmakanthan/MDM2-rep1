function multiplex_deg = multiplex_deg(mat_1,mat_2,mat_3,mat_4)
n = size((mat_1),1);
A = mat_1 + mat_2 + mat_3 + mat_4 + eye(n);
mat_ones = n.* ones(1,n);
for i = 1:n
    numZeros = sum(A(:, i) == 0);
    mat_ones(1,i)  = mat_ones(1,i) - numZeros;
end
Degree_Of_Each_Node = mat_ones - 1
