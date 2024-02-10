"""
    EasyModule

Module containing "easy" tier questions from HackerRank
"""

module EasyModule

__precompile__(true)

using ..UtilityFunctionsModule: getIntDigits, reverseInt

"""
    beautifulDays(
        i::Int32, 
        j::Int32, 
        k::Int32
    )

'Beautiful Days at the movies'
Lily likes to play games with integers. She has created a new game where she determines the difference between a number and its reverse. For instance, 
given the number 12, its reverse is 21. Their difference is 9. The number 120 reversed is 21, and their difference is 99.
She decides to apply her game to decision making. She will look at a numbered range of days and will only go to a movie on a beautiful day.
Given a range of numbered days, [i..j] and a number k, determine the number of days in the range that are beautiful. Beautiful numbers are defined as 
numbers where |i - reverse(i)| is evenly divisible by k. If a day's value is a beautiful number, it is a beautiful day. Return the number of beautiful 
days in the range.

# Arguments
- `i` = the starting day number
- `j` = the ending day number
- `k` = divisor

# Output
The number of beautiful days in the range
"""
function beautifulDays(
    i::Int32, 
    j::Int32, 
    k::Int32
)::Int32
    # n - permutation(n) is always divisible by 9
    (k == 9) || (k == 3) && return (j - i + 1)

    # n - reverse(n) is always dibisible by 99 if n has odd number of digits
    i_digits = getIntDigits(i)
    j_digits = getIntDigits(j)
    (i_digits % 2 != 0) && (i_digits == j_digits) && (k == 99 || k == 33 || k == 11) && return (j - i + 1)

    # Count beautiful day
    n_beautiful_days::Int32 = 0
    for day = i:j
        reversed_day = reverseInt(day)
        if abs(day - reversed_day) % k == 0
            n_beautiful_days += 1
        end
    end

    return n_beautiful_days
end





end # module EasyModule