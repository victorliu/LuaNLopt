nlopt = require("LuaNLopt")
print('NLopt version:', nlopt.version())

function myfunc(x, want_grad)
	local fval = math.sqrt(x[2])
	print(x[1], x[2], want_grad, fval)
	if want_grad then
		return fval, { 0, 0.5/math.sqrt(x[2]) }
	else
		return fval
	end
end

function myconstraint(x, want_grad, a, b)
	print(x[1], x[2], a, b)
	local fval = (a*x[1]+b)^3 - x[2]
	if want_grad then
		return fval, { 3*a*(a*x[1]+b)^2, -1 }
	else
		return fval
	end
end

opt = nlopt.create(nlopt.algorithm.LD_MMA, 2 )
opt:set_lower_bounds({-1e99, 0})
opt:set_min_objective(myfunc)
opt:add_inequality_constraint(function(x, want_grad) return myconstraint(x, want_grad, 2, 0) end, 1e-8)
opt:add_inequality_constraint(function(x, want_grad) return myconstraint(x, want_grad, -1, 1) end, 1e-8)
opt:set_xtol_rel(1e-4)
status, x,f = opt:optimize({1.234, 5.678})
print(nlopt.status_string(status), x[1], x[2], f)
