# README

## Basic Setup:
1. Install **Matlab** on your computer.
2. Download **YALMIP** from https://yalmip.github.io/ and add the directories to your MATLAB path.
3. Download and install the **MOSEK Optimization Toolbox** for MATLAB following the steps in https://docs.mosek.com/10.0/toolbox/install-interface.html.
4. clone this repository and add it to the path of MATLAB.

## Running Commands

The `algo_cluster.m` and `algo_mask.m` files correspond to our algorithms in Sec. 3 and Sec.5 respectively.
The benchmarks are provided in the `Benchmarks` folder.

## Run Benchmarks for Other Tools
We provide benchmarks for LIPuS (https://github.com/Santiago-Yu/LIPuS), Polysynth (in our paper, referred to as QP https://github.com/hitarths/polysynth) and Z3. 
Please refer to their instructions and the files in `other_tools` to run these benchmarks.