function result = run_all()
    % masked benchmark

    benchmarks = ["berkeley","cohencu","cohendiv", "euclidex2","fermat2","firefly","freire1","freire2", "illinois","lcm","mannadiv","mesi","moesi","petter","readerswriters","sqrt","wensley", "z3sqrt"];  
    %benchmarks = ["illinois"];  

    for i = 1:length(benchmarks)
        disp(strcat("========",benchmarks(i),"========"))
        algo_mask(benchmarks(i)); 

    %     % pp = parfeval(@algo_mask,0,benchmarks(i)); 
    %     % ok = wait(pp, 'finished', 600); 
    %     % if ~ok
    %     %     disp('Did not finish in time.')
    %     % else
    %     %     disp('Did finish in time.')
    %     %     fetchOutputs(fut)            
    %     % end

    end

    
    % Cluster benchmark

    % benchmarks = ["freire1", "freire12", "freire13", "cohencu", "cohencu2", "cohencu3",  "example", "circuit", "unicycle",  "overview"];
    % hdegs = [1,2,1,2,3,3,3,2,6,7];
    % for i = 1:10
    %     for d = 1:hdegs(i)
    %     % i=10;
    %        algo_cluster(benchmarks(i), d)
    %     end
    % end
end
