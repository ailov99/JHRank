"""
    MediumModule

Module containing "medium" tier questions from HackerRank
"""

module MediumModule

__precompile__(true)

"""
    formingMagicSquare(s::Vector{Vector{Int32}})::Int32

We define a magic square to be an N x N matrix of distinct positive integers from 1 to n^2 where the sum of any row, 
column, or diagonal of length  is always equal to the same number: the magic constant.

You will be given a 3x3 matrix `s`` of integers in the inclusive range [1,9]. We can convert any digit `a` to 
any other digit `b` in the range [1,9] at cost of |a-b|. Given `s`, convert it into a magic square at minimal cost. 
Print this cost on a new line.

Note: The resulting magic square must contain distinct integers in the inclusive range [1,9].

# Arguments
- `s` = A 3x3 matrix (represented as a 2d vector)

# Output
The minimal cost to transform the input matrix `s` into a 3x3 magic square
"""
function formingMagicSquare(s::Vector{Vector{Int32}})::Int
    min_cost = typemax(Int)

    # Convert 2d Vector into a Matrix
    # (use transpose as we want vectors to be rows)
    input_m = vcat([x' for x in s]...)

    # 1. Check vs 3x3 model magic square and its 4 90-degree rotations
    model_magic_square = [
        8 3 4;
        1 5 9;
        6 7 2
    ]
    for i = 1:4
        # Calculate cost -> Save if min -> Rotate model matrix
        matrix_abs_diff = sum(abs.(input_m - model_magic_square))
        min_cost = min(min_cost, matrix_abs_diff)
        model_magic_square = rotr90(model_magic_square)
    end

    # 2. Check vs 3x3 reflected model magic square and its 4 90-degree rotations
    # Swap columns 1 and 3 for each row to reflect
    for i = 1:3
        model_magic_square[i,1], model_magic_square[i,3] = model_magic_square[i,3], model_magic_square[i,1]
    end
    for i = 1:4
        # Calculate cost -> Save if min -> Rotate reflected model matrix
        matrix_abs_diff = sum(abs.(input_m - model_magic_square))
        min_cost = min(min_cost, matrix_abs_diff)
        model_magic_square = rotr90(model_magic_square)
    end

    # The minimum diff is the minimal cost for converting the 3x3 given matrix into a magic square
    return min_cost
end

end # Module MediumModule