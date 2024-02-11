"""
    EasyModule

Module containing "easy" tier questions from HackerRank
"""

module EasyModule

__precompile__(true)

using ..UtilityFunctionsModule: getIntDigits, getDigitAt, reverseInt

"""
    beautifulDays(
        i::Int32, 
        j::Int32, 
        k::Int32
    )::Int32

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

"""
    findDigits(n::Int32)::Int32

Given an integer, for each digit that makes up the integer determine 
whether it is a divisor. Count the number of divisors occurring within the integer.

# Arguments
- `n` = The integer to scan.

# Output
The number of digits in n that are divisors of n.
"""
function findDigits(n::Int32)::Int32
    count::Int32 = 0
    digit_count = getIntDigits(n)
    for i = 1:digit_count
        ith_digit = getDigitAt(n, i)
        if ith_digit != 0 && n % ith_digit == 0
            count += 1
        end
    end
    
    return count
end

"""
    cutTheSticks(arr::Array{Int32})::Array{Int32}

You are given a number of sticks of varying lengths. You will iteratively cut 
the sticks into smaller sticks, discarding the shortest pieces until there are none left. 
At each iteration you will determine the length of the shortest stick remaining, cut that 
length from each of the longer sticks and then discard all the pieces of that shortest length. 
When all the remaining sticks are the same length, they cannot be shortened so discard them.
Given the lengths of n sticks, print the number of sticks that are left before each iteration 
until there are none left.

# Arguments
- `arr` = List of stick lengths

# Output
List containing the number of sticks before each iteration of "cutting"
"""
function cutTheSticks(arr::Array{Int32})::Array{Int32}
    ret_arr = Int[]
    # Sort it in desc order first
    sort!(arr, rev=true)
    
    # While we have elements to pop
    while length(arr) > 0
        # Record current length
        push!(ret_arr, length(arr))
        
        # Pop smallest and cut
        smallest = pop!(arr)
        for i = 1:length(arr)
            arr[i] -= smallest
        end
        # Pop sticks that got cut out completely
        while !isempty(arr) && last(arr) < 1
            pop!(arr)
        end    
    end
    
    return ret_arr
end

"""
    circularArrayRotation(
        a::Array{Int32}, 
        k::Int32, 
        queries::Array{Int32}
    )::Array{Int32}

John Watson knows of an operation called a right circular rotation on an array of integers. 
One rotation operation moves the last array element to the first position and shifts all 
remaining elements right one. To test Sherlock's abilities, Watson provides Sherlock with 
an array of integers. Sherlock is to perform the rotation operation a number of times then 
determine the value of the element at a given position.
For each array, perform a number of right circular rotations and return the values of the 
elements at the given indices.

# Arguments
- `a` = The array to rotate
- `k` = Number of rotation to perform on a
- `queries` = Indeces of the rotated array to report (Note: 0-based indeces)

# Output
List of values in the rotated array a, as specified by the indices given in array queries 
"""
function circularArrayRotation(
    a::Array{Int32}, 
    k::Int32, 
    queries::Array{Int32}
)::Array{Int32}
    res = Int32[]
    new_array_start = ((length(a) - (k%length(a)) ) % length(a))
    for q in queries
        new_array_q = (q + new_array_start) % length(a)
        push!(res, a[new_array_q+1]) # Julia indexing
    end
    return res
end

end # module EasyModule