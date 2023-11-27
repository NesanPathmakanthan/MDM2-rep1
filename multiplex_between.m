function multiplex_between = multiplex_between(A,B,C,D)
n = size((A),1);
mat_comb = A + B + C + D + eye(n);
binary_mat = mat_comb ~= 0;
Betweenness_centrality_of_each_node = centrality(graph(binary_mat),'betweenness')