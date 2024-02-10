"""
    UtilityFunctionsModule

Module including various utility functions needed in some problems
"""

module UtilityFunctionsModule

__precompile__(true)

"""
Get the number of digits in an integer, without string conversion
"""
function getIntDigits(i::Union{Int64, Int32})::Int64
    # Work with 64-bit integers in case of i32 overflowing
    i64::Int64 = i
    (i64 == 0) && return 1
    i64 = abs(i64)
    
    if i64 < 0
        throw(DomainError(i, "Integer too large to abs. Consider BigInt."))
    end
    
    return (floor(Int64, log10(i64)) + 1)
end

"""
Reverse an integer without string conversion 
"""
function reverseInt(i::Union{Int64, Int32})::Int64
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
