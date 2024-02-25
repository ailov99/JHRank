"""
    UtilityFunctionsModule

Module including various utility functions needed in some problems
"""

module UtilityFunctionsModule

__precompile__(true)

"""
Get the number of digits in an integer, without string conversion
"""
function getIntDigits(i::Union{Int64, Int32})::Int
    # Work with 64-bit integers in case of i32 overflowing
    i64::Int64 = i
    (i64 == 0) && return 1
    i64 = abs(i64)
    
    i64 < 0 && throw(DomainError(i, "Integer too large to abs. Consider BigInt."))
    
    return (floor(Int, log10(i64)) + 1)
end

"""
Get the nth digit of an integer
Note: This assumes (Julia standard) indexing starting from 1
Note: Digits are indexed left->right
"""
function getDigitAt(i::Union{Int64, Int32}, n::Int)::Int
    n <= 0 && throw(DomainError(n, "Invalid digit index"))

    digits_in_i = getIntDigits(i)
    digits_in_i < n && throw(DomainError(i, "Integer has less than $n digits."))

    i64::Int64 = i
    i64 = abs(i64)
    nth_left_to_right = digits_in_i - n
    nth_digit_left_to_right = floor(Int, i64/(10^(nth_left_to_right))) % 10

    return nth_digit_left_to_right
end

"""
Reverse an integer without string conversion 
"""
function reverseInt(i::Union{Int64, Int32})::Int
    # Return same number if only 1 digit
    i_digits = getIntDigits(i)
    (i_digits == 1) && return i

    # Decompose digit-by-digit and add up powers of 10
    reversed_i::Int64 = 0
    for digit_position = 0:(i_digits-1)
        digit_at_position = div(i, 10 ^ digit_position) % 10
        reversed_pow_of_10 = i_digits - digit_position - 1
        to_add = (10 ^ reversed_pow_of_10) * digit_at_position
        reversed_i += to_add
    end

    return reversed_i
end

"""
Write a matrix to file. Each row is a line of space-separated numbers.
If the file doesn't exist, it will be created. If it does, it will be overwritten.
"""
function writeMatrixToFile(
    m::Matrix{T},
    path::String
) where T <: Number
    m_height = size(m)[1]

    try
        open(path, "w") do file
            for row = 1:m_height
                line = join(m[row, :], " ")
                println(file, line)
            end
        end
    catch e
        println("Failed to write to file $path: $e")
    end
end

"""
Write a matrix to file, with metadata. The metadata is written first as space-separated numbers.
Each row of the matrix is a new line of space-separated numbers.
"""
function writeMatrixAndMetadataToFile(
    m::Matrix{T},
    metadata::Vector{Int},
    path::String
) where T <: Number
    m_height = size(m)[1]

    try
        open(path, "w") do file
            metadata_string = join(metadata, " ")
            println(file, metadata_string)
            for row = 1:m_height
                line = join(m[row, :], " ")
                println(file, line)
            end
        end
    catch e
        println("Failed to write to file $path: $e")
    end
end

"""
Read in a matrix from a file. Each row is a line of space-separated numbers.
"""
function readMatrixFromFile(
    path::String
)::Matrix{Number}
    isfile(path) || throw(ArgumentError("File not found at $path"))

    matrix_as_vector = Vector{Vector{Number}}();
    tryparse_int_xform = x -> tryparse(Int, x)
    tryparse_float_xform = x -> tryparse(Float64, x)

    try
        for line in eachline(path)
            tokenised_line = split(line, " ")
            parsed_line = tryparse_int_xform.(tokenised_line)
            if parsed_line[1] == nothing
                parsed_line = tryparse_float_xform.(tokenised_line)
            end
            push!(matrix_as_vector, parsed_line)
        end
    catch e
        println("Failed to parse $path: $e")
    end

    # Convert 2d vector to a matrix (transpose as each vector is a row)
    return vcat([x' for x in matrix_as_vector]...)
end

"""
Read in a matrix from a file. 
Each row is a line of space-separated numbers.
The first line contains metadata about the matrix, also as space-separated numbers.
"""
function readMatrixWithMetadataFromFile(
    path::String
)::Tuple{Matrix{Number}, Vector{Number}}
    isfile(path) || throw(ArgumentError("File not found at $path"))

    matrix_as_vector = Vector{Vector{Number}}();
    metadata_as_vector = Vector{Number}();
    tryparse_int_xform = x -> tryparse(Int, x)
    tryparse_float_xform = x -> tryparse(Float64, x)

    try
        open(path) do io
            metadata_line = readline(io)
            tokenised_metadata_line = split(metadata_line, " ")
            metadata_as_vector = tryparse_int_xform.(tokenised_metadata_line)
            if metadata_as_vector[1] == nothing
                metadata_as_vector = tryparse_float_xform.(tokenised_metadata_line)
            end
            while !eof(io)
                line = readline(io)
                tokenised_line = split(line, " ")
                parsed_line = tryparse_int_xform.(tokenised_line)
                if parsed_line[1] == nothing
                    parsed_line = tryparse_float_xform.(tokenised_line)
                end
                push!(matrix_as_vector, parsed_line)
            end
        end
    catch e
        println("Failed to parse $path: $e")
    end

    # Convert 2d vector to a matrix (transpose as each vector is a row)
    return (
        vcat([x' for x in matrix_as_vector]...), 
        metadata_as_vector
    )
end


"""
Semi-optimised primality check
"""
function isPrime(n::Int)
    (1 < n <= 3) && return true
    (n <= 1 || n % 2 == 0 || n % 3 == 0) && return false
    
    i = 3
    while i*i <= n
        (n % i == 0 || n % (i+2) == 0) && return false
        i += 6
    end

    return true
end

"""
The well-known "Sieve of Eratosthenes"
"""
function findPrimesUpTo(up_to::Int)::Vector{Int}
    primes = Vector{Int}(undef, 0)
    is_prime_list = [true for i=1:up_to]

    for n = 2:(up_to-1)
        if is_prime_list[n]
            push!(primes, n)
            for i = n*n:n:(up_to-1)
                is_prime_list[i] = false
            end
        end
    end

    return primes
end

end # module UtilityFunctionsModule
