LuaNLopt API documentation
==========================

Abstract
--------
This Lua module exposes the NLopt C API as documented in the [NLopt Reference] [NLoptRef].
The original author of this module is Rochus Keller, rkeller@nmr.ch, dated 2012-10-14.
I, Victor Liu, victor.liu@gmail.com, am the current maintainer of this module since April, 2016.

Definitions
-----------

* `nlopt`: This is the module object name assumed to be generated by the statement `require("LuaNLopt")`.
* `nlopt_opt`: This is an object of the type `nlopt_opt` generated by `nlopt.create` or `nlopt_opt:copy()`. Note the colon (":") syntax in contrast to dot (".").
* `nlopt.algorithm`: Arguments of this type are integers which are members of the enumeration `nlopt.algorithm`. The elements `NLOPT_GN_DIRECT`, etc. of the enumeration of the C API are mapped to `nlopt.algorithm.GN_DIRECT`, etc.
* `array`: A Lua table used as an array of `double`s; remember indices in Lua start with 1, not with 0!
* `nlopt.result`: Arguments of this type are integers which are members of the enumeration `nlopt.result`. The elements `NLOPT_FAILURE`, etc. of the enumeration of the C API are mapped to `nlopt.result.FAILURE`, etc.
* `n`: The number of dimensions passed to `nlopt.create`.

API signature
-------------
For a description of the functions, see the [NLopt Reference] [NLoptRef].

### Functions of module `nlopt`

#### `nlopt.create(nlopt.algorithm algorithm, integer n)`

Returns an `nlopt_opt` object.

#### `nlopt.algorithm_name(nlopt.algorithm algorithm)`

Returns a string describing the algorithm

#### `nlopt.srand(integer seed)`

#### `nlopt.srand_time()`
#### `nlopt.version()`

Returns major, minor, bugfix

### Methods of `nlopt_opt` objects

#### `nlopt_opt:copy()`

Returns an `nlopt_opt` object.

#### `nlopt_opt:get_algorithm()`

Returns an integer (a member of `nlopt.algorithm`) corresponding to the select algorithm used.

#### `nlopt_opt:get_dimension( nlopt_opt opt)`

Returns integer.

#### `nlopt_opt:set_min_objective( function func ) `

Returns `nlopt.result`.
`func` is a Lua function with the following signature:

    f(array x[1..n], want_grad)
    
The function returns the objective function result (a single number), and also the gradient vector (length `n`) when `want_grad` is true.

#### `nlopt_opt:set_max_objective( function func )`

Returns `nlopt.result`.

#### `nlopt_opt:set_lower_bounds( array lb[1..n] )`

Returns `nlopt.result`.

#### `nlopt_opt:set_upper_bounds( array ub[1..n] )`

Returns `nlopt.result`.

#### `nlopt_opt:set_lower_bounds1( double lb )`

Returns `nlopt.result`.

#### `nlopt_opt:set_upper_bounds1( double ub )`

Returns `nlopt.result`.

#### `nlopt_opt:get_lower_bounds()`

Returns `nlopt.result`, `array[ 1..n]`.

#### `nlopt_opt:get_upper_bounds()

Returns `nlopt.result`, `array[ 1..n]`.

#### `nlopt_opt:add_inequality_constraint( function func, any fc_data, double tol)`

Returns `nlopt.result`.

#### `nlopt_opt:add_equality_constraint( function func, any fc_data, double tol)`

Returns `nlopt.result`.

#### `nlopt_opt:remove_inequality_constraints()`

Returns `nlopt.result`.

#### `nlopt_opt:remove_equality_constraints()`

Returns `nlopt.result`.

#### `nlopt_opt:add_inequality_mconstraint( integer m, function mfunc, array tol[1..m] | nil)

Returns `nlopt.result`.

`mfunc` is a Lua function with the following signature:

    c( integer m, array x[1..n], want_grad)
 
The function returns the `m` constraints (a table of length `m`), and also the gradient matrix `grad` (length `m*n`) when `want_grad` is true.
The derivative of the i-th constraint with respect to the j-th element of `x` is located at `grad[(i-1)*n + j]` for `i` and `j` starting at 1.

#### `nlopt_opt:add_equality_mconstraint( integer m, function mfunc, any c_data, array tol[1..m] | nil)`

Returns `nlopt.result`.

#### `nlopt_opt:set_stopval( double stopval )`

Returns `nlopt.result`.

#### `nlopt_opt:get_stopval()`

Returns double.

#### `nlopt_opt:set_ftol_rel( double tol)`

Returns `nlopt.result`.

#### `nlopt_opt:get_ftol_rel()`

Returns double.

#### `nlopt_opt:set_ftol_abs( double tol )`

Returns `nlopt.result`.

#### `nlopt_opt:get_ftol_abs()`

Returns double.

#### `nlopt_opt:set_xtol_rel( double tol )`

Returns `nlopt.result`.

#### `nlopt_opt:get_xtol_rel()`

Returns double.

#### `nlopt_opt:set_xtol_abs( array tol[1..n] )`

Returns `nlopt.result`.

#### `nlopt_opt:get_xtol_abs()`

Returns `nlopt.result`, `array[1..n]`.

#### `nlopt_opt:set_xtol_abs1( double tol )`

Returns `nlopt.result`.

#### `nlopt_opt:set_maxeval( integer maxeval )`

Returns `nlopt.result`.

#### `nlopt_opt:get_maxeval()`

Returns integer.

#### `nlopt_opt:set_maxtime( double maxtime )`

Returns `nlopt.result`.

#### `nlopt_opt:get_maxtime()`

Returns double.

#### `nlopt_opt:force_stop()`

Returns `nlopt.result`.

#### `nlopt_opt:set_force_stop( integer val )`

Returns `nlopt.result`.

#### `nlopt_opt:get_force_stop()`

Returns integer.

#### `nlopt_opt:optimize( array x[1..n] )`

Returns `nlopt.result`, double.

#### `nlopt_opt:set_local_optimizer( nlopt_opt local_opt )`

Returns `nlopt.result`.

#### `nlopt_opt:set_initial_step( array dx[1..n] )`

Returns `nlopt.result`.

#### `nlopt_opt:set_initial_step1( double dx )`

Returns `nlopt.result`.

#### `nlopt_opt:get_initial_step( array x[1..n] )

Returns `nlopt.result`, `array[1..n]`.

#### `nlopt_opt:set_population( integer pop )`

Returns `nlopt.result`.

#### `nlopt_opt:set_vector_storage( integer M )`

Returns `nlopt.result`.

#### `nlopt_opt:get_vector_storage()`

Returns `nlopt.result`, integer.

[NLoptRef]: http://ab-initio.mit.edu/wiki/index.php/NLopt_Reference "NLopt Reference"
