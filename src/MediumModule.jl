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
    for rotate in (x -> x, rotr90, rot180, rotl90)
        # Calculate cost -> Save if min -> Rotate model matrix
        matrix_abs_diff = sum(abs.(input_m - rotate(model_magic_square)))
        min_cost = min(min_cost, matrix_abs_diff)
    end

    # 2. Check vs 3x3 reflected model magic square and its 4 90-degree rotations
    # Swap columns 1 and 3 for each row to reflect
    for i = 1:3
        model_magic_square[i,1], model_magic_square[i,3] = model_magic_square[i,3], model_magic_square[i,1]
    end
    for rotate in (x -> x, rotr90, rot180, rotl90)
        # Calculate cost -> Save if min -> Rotate reflected model matrix
        matrix_abs_diff = sum(abs.(input_m - rotate(model_magic_square)))
        min_cost = min(min_cost, matrix_abs_diff)
    end

    # The minimum diff is the minimal cost for converting the 3x3 given matrix into a magic square
    return min_cost
end

"""
    nonDivisibleSubset(k::Int, s::Vector{Int})

Given a set of distinct integers S, return the size of a maximal subset of S (S') where the sum of any 2 numbers 
in S' is not evenly divisible by a number K.

# Arguments
- `k` = K
- `s` = S

# Output
The size of S'
"""
function nonDivisibleSubset(k::Int, s::Vector{Int})
    # We will "group" numbers in s by their remainder when divided by k
    # First we count frequency of remainders, for each number in s, when divided by k
    remainder_freq = zeros(Int, k-1)
    s_has_div_by_k = false
    for i in s
        remainder = i % k
        if remainder == 0
            s_has_div_by_k = true
        else
            remainder_freq[remainder] += 1
        end
    end

    max_subset_size = 0
    # Numbers divisible by k can only be in s' once (as otherwise they would form a divisible pair)
    s_has_div_by_k && (max_subset_size += 1)
    # Same for numbers divisible by k / 2
    (k % 2 == 0) && (max_subset_size += 1)

    # 2 numbers whose remainders (when divided by k) add up to k cannot be in s'
    # so we only add up the size of the bigger group
    for i=1:(div(k,2))
        # We already accounted for remainders of k / 2 if k is even
        (i == (k-i)) && continue
        max_subset_size += max(remainder_freq[i], remainder_freq[k-i])
    end

    return max_subset_size
end

end # Module MediumModule