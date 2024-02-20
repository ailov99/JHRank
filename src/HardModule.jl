"""
    HardModule

Module containing "hard" tier questions from HackerRank
"""

module HardModule

__precompile__(true)

"""

You are given a 2D matrix of dimension M x N and a positive integer `r`. You have to rotate 
the matrix `r` times and return the resultant matrix. Rotation should be in anti-clockwise direction.
e.g. For `r` == 1:
 1 2 3 4      2  3 4 5
12 1 2 5  ->  1  2 3 6
11 4 3 6     12  1 4 7
10 9 8 7     11 10 9 8

Note:
- 2 <= m, n <= 300
- 1 <= r <= 10^9
- min(m,n) % 2 = 0
- 1 <= matrix[i][j] <= 10^8 where i in [1...m] and j in [1...n]

# Arguments
- `matrix` = an M x N matrix (represented as a 2d vector)
- `r` = number of anti-clockwise rotations

# Output
The rotated matrix
"""
function matrixRotation(
    matrix::Vector{Vector{Int}}, 
    r::Int
)::Matrix{Int}
    # Convert 2d Vector into a Matrix
    # (use transpose as we want vectors to be rows)
    input_m = vcat([x' for x in matrix]...)

    return input_m
end

end # module HardModule