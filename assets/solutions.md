# 10 SciML - 02 Optimization

## 4. Neural networks - special support for minibatches
```julia
x = range(-10, 10, length=128)
y = x.^2  - 2x
Plots.plot(x, y)
```

```julia
Plots.plot(x', y')
Plots.plot!(x', y_pred')
```

```julia
loss_flux(parameters_initial, x, y)
```

```
loss_flux(parameters_learned, x, y)
```

```julia
y_pred = reconstruct_nn_flux(parameters_learned)(x)
Plots.plot(x', y')
Plots.plot!(x', y_pred')
```

```julia
x = range(-100, 100, length=128)
y = x.^2 .- 2x

x = x'
y = y'

y_pred = reconstruct_nn_flux(sol.minimizer)(x)
Plots.plot(x', y')
Plots.plot!(x', y_pred')
```