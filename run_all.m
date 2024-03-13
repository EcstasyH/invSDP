function result = run_all()
    % masked benchmark

    % benchmarks = ["berkeley","cohencu","cohendiv", "euclidex2","fermat2","firefly","freire1","freire2", "illinois","lcm","mannadiv","mesi","moesi","petter","readerswriters","sqrt","wensley", "z3sqrt", "sum2power10", "sum2power15", "sum2power20", "sum2power22", "sum2power8","sum2power10"];  
    % for i = 1:length(benchmarks)
    %    disp(strcat("========",benchmarks(i),"========"))
    %    algo_mask(benchmarks(i)); 

    %     pp = parfeval(@algo_mask,0,benchmarks(i)); 
    %     ok = wait(pp, 'finished', 600); 
    %     if ~ok
    %         disp('Did not finish in time.')
    %     else
    %         disp('Did finish in time.')
    %         fetchOutputs(fut)
            
    %     end
    % end

    
    % Cluster benchmark

    % benchmarks = ["cohencu", "cohencu2", "cohencu3", "freire1", 
    % "freire12", "freire13", "example", "unicycle", "circuit", "overview"]
    benchmark = "partition";
    adeg = 3;
    algo_cluster(benchmark, adeg) 
end
