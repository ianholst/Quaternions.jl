# Quaternions.jl

This is a package for the [Julia](https://julialang.org/) language that adds a simple quaternion type for quaternion operations. Quaternions are one of the normed division algebras, an extension of complex numbers. They can be expressed in components as

<img src="https://latex.codecogs.com/svg.latex?q=a+bi+cj+dk"/>

where the imaginary-like numbers *i*, *j*, and *k* (the quaternion units) satisfy the relations

<img src="https://latex.codecogs.com/svg.latex?i^2=j^2=k^2=ijk=-1"/>

which leads to particular non-commutative properties.


## Installation
To install the package, run this command in the Julia prompt:

```julia
Pkg.add("https://github.com/ianholst/Quaternions.jl")
```

## Usage
First, import the Quaternions module with
```julia
using Quaternions
```

To create a quaternion, specify the coefficients `a`, `b`, `c`, and `d` in the constructor `Quaternion(a,b,c,d)`:
```julia
q = Quaternion(1,2,3,4)
```
This gives the output `Quaternion{Int64}: 1 + 2i + 3j + 4k`

Quaternions may be created with coefficients of any subtype of Julia's `Real` type. The type can be specified manually, or will be inferred from the promotion of the given arguments.

```julia
q = Quaternion{Float64}(1,2,3,4)
```
`Quaternion{Float64}: 1.0 + 2.0i + 3.0j + 4.0k`

```julia
q = Quaternion(1.0,2,3,4)
```
`Quaternion{Float64}: 1.0 + 2.0i + 3.0j + 4.0k`

The components of the quaternion are stored as the parameters `q.a`, `q.b`, `q.c`, and `q.d`. The constants `qi`, `qk`, and `qk` are provided, corresponding to the quaternion units.


### Operations
Quaternion addition, subtraction, multiplication, and division are defined, as well as quaternion-scalar multiplication and division.

```julia
3 * (qi + qj)
```
`Quaternion{Int64}: 0 + 3i + 3j + 0k`

The functions `conj`, `abs`, `abs2`, and `inv` are also defined. The comparison operators `==` and `!=` will work with automatic type conversion. Here are some more examples with output:

```julia
conj(Quaternion(1,2,3,4))
```
`Quaternion{Int64}: 1 - 2i - 3j - 4k`

```julia
qi * qj
```
`Quaternion{Int64}: 0 + 0i + 0j + 1k`

```julia
qi * qj == qk
```
`true`
