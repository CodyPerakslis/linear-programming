using JuMP
using GLPK

m = Model(with_optimizer(GLPK.Optimizer))

@variable(m, x >= 0)
@variable(m, y >= 0)
@variable(m, z >= 0)

@objective(m, Max, 3x + 2y + z)
@constraint(m, 2x + 2y + z <= 40)
@constraint(m, 2x + y + z <= 30)

println("Optimizing")
optimize!(m)
println("optimal: ", JuMP.objective_value(m))
println("x = ", JuMP.value(x))
println("y = ", JuMP.value(y))
println("z = ", JuMP.value(z))
