function multiplex_close = multiplex_close(A,B,C,D)
n = size((A),1);
mat_comb = A + B + C + D + eye(n);
binary_mat = mat_comb ~= 0;
Closeness_centrality_of_each_node = centrality(graph(binary_mat),'closeness')
