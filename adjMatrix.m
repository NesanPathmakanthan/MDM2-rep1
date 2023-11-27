% Intra-layer adjacency matrices
adjMatrixLayer1 = aa; % Layer 1 adjacency matrix
adjMatrixLayer2 = bb; % Layer 2 adjacency matrix
adjMatrixLayer3 = cc;
adjMatrixLayer4 = dd;
intraLayerAdjMatrices = {adjMatrixLayer1, adjMatrixLayer2, adjMatrixLayer3,adjMatrixLayer4};

% Inter-layer adjacency matrices
interLayerAdjMatrix1 = 0; % Connections between nodes of Layer 1 and Layer 2
interLayerAdjMatrices = {interLayerAdjMatrix1};

% Flattening the multiplex network
flattenedNetwork = flatten(intraLayerAdjMatrices, interLayerAdjMatrices);

% Display the flattened network's adjacency matrix
disp(flattenedNetwork);
Matrix = flattenedNetwork;
