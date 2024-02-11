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

end # module UtilityFunctionsModule
