using Quaternions
using Test

# Fundamental algebra of quaternion basis
@test qi * qj == qk
@test qj * qk == qi
@test qk * qi == qj
@test qj * qi == -qk
@test qk * qj == -qi
@test qi * qk == -qj

# i^2 = j^2 = k^2 = ijk = -1
@test qi * qi == Quaternion(-1,0,0,0)
@test qj * qj == Quaternion(-1,0,0,0)
@test qk * qk == Quaternion(-1,0,0,0)
@test qi * qj * qk == Quaternion(-1,0,0,0)

# Test various arithmetic operations
testq = Quaternion(-1.0, 2, pi, 4//1)
@test conj(testq) == Quaternion{Float64}(-1.0, -2.0, -pi, -4)
@test abs2(testq) == 1 + 2^2 + pi^2 + 4^2
@test abs(testq) == sqrt(1 + 2^2 + pi^2 +4^2)
@test inv(testq) == Quaternion{Float64}(-1.0, -2.0, -pi, -4) / (1 + 2^2 + pi^2 +4^2)
@test inv(testq) == Quaternion{Float64}(-1.0, -2.0, -pi, -4) / (1 + 2^2 + pi^2 +4^2)
@test inv(Quaternion(2,2,2,2)) == 1/2^3 * Quaternion(1,-1,-1,-1)
@test qi + qj == Quaternion(0,1,1,0)
@test qi - qk == Quaternion(0,1,0,-1)
@test 3*(qi - qk) == Quaternion(0,3,0,-3)
@test (Quaternion(1,0,0,0) + qi + qj + qk) / 4 == Quaternion(1/4,1/4,1/4,1/4)
@test qi / qj == qi * -qj
@test Quaternion(1,0,0,0) == Quaternion(1.0,0,0,0)
@test Quaternion(1,0,0,0) == Quaternion(1,0,0,0)
@test Quaternion(1,0,0,0) != Quaternion(2.0,0,0,0)
