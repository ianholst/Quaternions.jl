module Quaternions

struct Quaternion{T<:Real}
    a::T
    b::T
    c::T
    d::T
end

# Constructor that allows combining different types of reals
Quaternion(a::Real, b::Real, c::Real, d::Real) = Quaternion(promote(a,b,c,d)...)

# MATHEMATICAL OPERATIONS
Base.conj(q::Quaternion) = Quaternion(q.a, -q.b, -q.c, -q.d)
Base.abs2(q::Quaternion) = q.a^2 + q.b^2 + q.c^2 + q.d^2
Base.abs(q::Quaternion) = sqrt(abs2(q))
Base.inv(q::Quaternion) = conj(q) / abs2(q)

# Quaternion addition
Base.:+(x::Quaternion, y::Quaternion) = Quaternion(x.a+y.a, x.b+y.b, x.c+y.c, x.d+y.d)

# Quaternion subtraction
Base.:-(x::Quaternion, y::Quaternion) = Quaternion(x.a-y.a, x.b-y.b, x.c-y.c, x.d-y.d)
Base.:-(x::Quaternion) = -1 * x

# Multiplication
Base.:*(s::Real, q::Quaternion) = Quaternion(s*q.a, s*q.b, s*q.c, s*q.d)
Base.:*(q::Quaternion, s::Real) = Quaternion(s*q.a, s*q.b, s*q.c, s*q.d)
function Base.:*(q::Quaternion, p::Quaternion)
    # From Mathematica
    a = q.a * p.a - q.b * p.b - q.c * p.c - q.d * p.d
    b = p.a * q.b + q.a * p.b - p.c * q.d + q.c * p.d
    c = p.a * q.c + q.a * p.c + p.b * q.d - q.b * p.d
    d = -p.b * q.c + q.b * p.c + p.a * q.d + q.a * p.d
    Quaternion(a, b, c, d)
end


# Division
Base.:/(s::Real, q::Quaternion) = s * inv(q)
Base.:/(q::Quaternion, s::Real) = 1/s * q
Base.:/(q::Quaternion, p::Quaternion) = q * inv(p)

# Custom printing
Base.show(io::IO, q::Quaternion) = print(io, typeof(q), ": ", q.a, " + ", q.b, "i + ", q.c, "j + ", q.d, "k")

# Comparison
function Base.:(==)(q::Quaternion{T1}, p::Quaternion{T2}) where {T1<:Real, T2<:Real}
    T = promote_type(T1, T2)
    T[q.a, q.b, q.c, q.d] == T[p.a, p.b, p.c, p.d]
end

function Base.:(!=)(q::Quaternion{T1}, p::Quaternion{T2}) where {T1<:Real, T2<:Real}
    T = promote_type(T1, T2)
    T[q.a, q.b, q.c, q.d] != T[p.a, p.b, p.c, p.d]
end

# CONSTANTS
qi = Quaternion{Int64}(0,1,0,0)
qj = Quaternion{Int64}(0,0,1,0)
qk = Quaternion{Int64}(0,0,0,1)


export Quaternion, qi, qj, qk

end # module
