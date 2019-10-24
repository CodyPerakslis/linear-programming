using JuMP
using GLPK

m = Model(with_optimizer(GLPK.Optimizer))

@variable(m, 0 <= r_YX)
@variable(m, 0 <= r_Xa <= 10)
@variable(m, 0 <= r_Xb <= 20)
@variable(m, 0 <= r_ac <= 12)
@variable(m, 0 <= r_bc <= 8)
@variable(m, 0 <= r_bd <= 10)
@variable(m, 0 <= r_dY <= 20)
@variable(m, 0 <= r_cY <= 20)

@objective(m, Max, r_YX)

@constraint(m, r_YX - (r_Xa + r_Xb) == 0)
@constraint(m, r_Xa - r_ac == 0)
@constraint(m, r_Xb - (r_bc + r_bd) == 0)
@constraint(m, (r_ac + r_bc) - r_cY == 0)
@constraint(m, r_bd - r_dY == 0)
@constraint(m, (r_cY + r_dY) - r_YX == 0)

println("Optimizing")
optimize!(m)
println("optimal: ", JuMP.objective_value(m))
println("r_Xa = ", JuMP.value(r_Xa))
println("r_Xb = ", JuMP.value(r_Xb))
println("r_ac = ", JuMP.value(r_ac))
println("r_bc = ", JuMP.value(r_bc))
println("r_bd = ", JuMP.value(r_bd))
println("r_dY = ", JuMP.value(r_dY))
println("r_cY = ", JuMP.value(r_cY))
