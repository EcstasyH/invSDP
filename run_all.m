function result = run_all()

    % cd into the current directory
    full_path = which('run_all.m');
    [path, name, ext] = fileparts(full_path);
    cd(path);

    % Cluster benchmark
    benchmarks = ["freire1", "freire12", "freire13", "cohencu", "cohencu2", "cohencu3",  "example", "circuit", "unicycle",  "overview"];
    D = [1,2,1,2,3,3,3,2,6,7];
    for i = 1:10
        tic
        disp(strcat("========",benchmarks(i),"========"))
        for d = 1:D(i)
            fprintf("d = %d", d);
            algo_cluster(benchmarks(i), d);
        end
        toc
    end
    
    % Masked benchmark
    benchmarks = ["berkeley","cohencu","cohendiv", "euclidex2","fermat2","firefly","freire1","freire2", "illinois","lcm","mannadiv","mesi","moesi","petter","readerswriters","sqrt","wensley", "z3sqrt","sum2power10","sum2power15","sum3power6","sum3power8","sum5power4","sum5power5","sum8power3"];  
    for i = 1:length(benchmarks)
        disp(strcat("========",benchmarks(i),"========"))
        algo_mask(benchmarks(i)); 
    end
end
