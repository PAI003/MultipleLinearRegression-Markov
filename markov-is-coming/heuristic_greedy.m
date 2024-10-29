function [path] = heuristic_greedy (start_position, probabilities, Adj)
	% start_position -> the starting point in the labyrinth
	% probabilities -> vector of associated probabilities: including WIN and LOSE
	% Adj -> adjacency matrix
	
	% path -> the states chosen by the algorithm
  
    path(1) = start_position;

    vect_visited = zeros(size(Adj, 1), 1);			% creez si initializez un vector de vizitare
    vect_visited(start_position) = 1;
    
	  status = 1; % variabila prin care verific daca mai exista stari nevizitate sau nu

    while status > 0
        actual_status = path(status);

        
        if (probabilities(actual_status, 1) == 1)			% verific daca cumva starea mea actuala este de WIN 
            break;
        endif

        max_position = -1;
        max_probability = -1;

        for j = 1 : size(Adj, 2)
            if (Adj(actual_status, j) == 1 && max_probability < probabilities(j) && vect_visited(j) == 0)
                max_probability = probabilities(j, 1);
                max_position = j;																			% parcurg vecinii starii curente
            endif																							% retin pe cel cu probabilitatea maxima
        endfor

        if (max_probability == -1)
            status = status - 1;			% verific daca cumva nu mai exista vecini nevizitati 
        endif

        if (max_probability > 0)
            status = status + 1;
            path(status) = max_position;			% adaug in path starea cu probabilitate maxima
            vect_visited(max_position) = 1;
        endif
    endwhile

    path = path(1:status)';

endfunction

