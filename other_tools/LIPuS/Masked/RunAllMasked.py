from main import main
from SMT_Solver.Config import config


if __name__ == "__main__":

    result_file = open(r"Result/Masked.txt", "w")
    benchmarks_c_path = r"Benchmarks/Masked/c/"
    benchmarks_g_path = r"Benchmarks/Masked/c_graph/"
    benchmarks_s_path = r"Benchmarks/Masked/c_smt/"
    results = []
    for name in ['berkeley','cohencu','cohendiv','euclidex2','fermat2','firefly','freire1','illinois','lcm','mannadiv','mesi',
              'moesi','petter','readerswriters','sqrt']:
        gfilename = name + ".c.json"
        path_g = benchmarks_g_path + gfilename
        sfilename = name + ".c.smt2"
        path_s = benchmarks_s_path + sfilename
        cfilename = name + ".c"
        path_c = benchmarks_c_path + cfilename
        timeUsed, answer = main(path_c, path_g, path_s)
        results.append(timeUsed)
        result_file.write(name+':'+str(timeUsed) + '\t' + str(answer) + '\n')
        result_file.flush()

    result_file.close()
    print(results)
