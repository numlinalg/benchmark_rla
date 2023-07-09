using RLinearAlgebra
using MatrixDepot
using BenchmarkTools

max_iter = 100

# build solver
solver = RLSSolver(
    LinSysVecRowRandCyclic(),   # Random Cyclic Sampling
    LinSysVecRowProjStd(),      # Hyperplane projection
    LSLogFull(),                # Full Logger: maintains residual history
    LSStopMaxIterations(max_iter),   # Maximum iterations stopping criterion
    nothing                     # System solution (not solved yet)
)

dim_vec = [10, 50, 100, 500, 1000]

for i=1:length(dim_vec)
    dim = dim_vec[i]

    A = matrixdepot("randcorr", dim)
    x_sol = ones(dim)
    b = A*x_sol

    println("System dimension: ", dim)
    #@btime rsolve($solver, $A, $b)
end

dim = 1000
A = matrixdepot("randcorr", dim)
x_sol = ones(dim)
b = A*x_sol
