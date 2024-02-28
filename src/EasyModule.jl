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

"""
    viralAdvertising(n::Int)::Int

HackerLand Enterprise is adopting a new viral advertising strategy. When they launch a new product, they 
advertise it to exactly 5 people on social media.
On the first day, half of those 5 people (i.e., floor(5/2)=2) like the advertisement and each shares it with 3 of 
their friends. At the beginning of the second day, floor(5/2)*3 = 2*3 = 6 people receive the advertisement.
Each day, floor(recipients/2) of the recipients like the advertisement and will share it with 3 friends on the 
following day. Assuming nobody receives the advertisement twice, determine how many people have liked the ad by the 
end of a given day, beginning with launch day as day 1.

# Arguments
- `n` = Number of days to count cumulative likes for
    
# Output
The number of cumulative likes by day `n`
"""
function viralAdvertising(n::Int)::Int
    shared_with = 5
    all_likes_by_day_n = 0

    for day = 1:n
        likes_today = floor(Int, shared_with/2)
        all_likes_by_day_n += likes_today

        shared_with = likes_today * 3
    end

    return all_likes_by_day_n
end

"""
    libraryFine(
        d1::Int,
        m1::Int,
        y1::Int,
        d2::Int,
        m2::Int,
        y2::Int
    )

Your local library needs your help! Given the expected and actual return dates for a library book, create a program that 
calculates the fine (if any). The fee structure is as follows:
- If the book is returned on or before the expected return date, no fine will be charged (i.e.: fine = 0).
- If the book is returned after the expected return day but still within the same calendar month and year as the expected 
  return date, fine = 15 Hackos x (the number of days late).
- If the book is returned after the expected return month but still within the same calendar year as the expected 
  return date, the fine = 500 Hackos x (the number of months late).
- If the book is returned after the calendar year in which it was expected, there is a fixed fine of  10_000 Hackos.
Charges are based only on the least precise measure of lateness. For example, whether a book is due January 1, 2017 or December 31, 2017, 
if it is returned January 1, 2018, that is a year late and the fine would be 10_000 Hackos.

# Arguments
- `d1` = returned day
- `m1` = returned month
- `y1` = returned year
- `d2` = due day
- `m2` = due month
- `y2` = due year

# Output
The fine
"""
function libraryFine(
    d1::Int,
    m1::Int,
    y1::Int,
    d2::Int,
    m2::Int,
    y2::Int
)
    # Late or early by year/s
    (y1 > y2) && return 10_000
    (y1 < y2) && return 0

    # Late or early by month/s
    (m1 > m2) && return ((m1 - m2) * 500)
    (m1 < m2) && return 0

    # Late by day/s
    (d1 > d2) && return ((d1 - d2) * 15)

    return 0
end

"""
    maximizingXor(l::Int, r::Int)

Given two integers, l and r, find the maximal value of a xor b, where l <= a <= b <= r

# Arguments
- `l` = lower bound
- `r` = upper bound

# Output
The max value of a xor b, where a & b are within the range l to r
"""
function maximizingXor(l::Int, r::Int)
    max_xor = 0
    for i = l:(r-1)
        for j = (i+1):r
            xored = i ⊻ j
            if xored > max_xor
                max_xor = xored
            end
        end
    end
    return max_xor
end

"""
    appendAndDelete(s::String, t::String, k::Int)

You have two strings of lowercase English letters. You can perform two types of operations on the first string:
1. Append a lowercase English letter to the end of the string.
2. Delete the last character of the string. Performing this operation on an empty string results in an empty string.
Given an integer, k, and two strings, s and t, determine whether or not you can convert s to t by performing exactly k of the 
above operations on s.

# Arguments
- `s` = first string
- `t` = second string
- `k` = number of deletions and additions to perform on t to make it == s

# Output
If the opperation is possible given the 2 strings and number of operations k
"""
function appendAndDelete(
    s::String,
    t::String,
    k::Int
)
    # First find the overlap between s and t, from left to right
    overlap_length = 0
    for i = 1:min(length(s), length(t))
        if s[i] == t[i]
            overlap_length += 1
        else
            break
        end
    end

    # Special case where t needs to be fully deleted
    if 2*length(t) < k
        return true
    end

    # How many chars to trim
    to_delete = length(t) - overlap_length
    # How many chars to append once trimmed
    to_append = length(s) - overlap_length

    # Check if it's even feasible
    operations_to_make = to_delete + to_append
    (operations_to_make > k) && return false

    # to_delete + to_append == k + x*2 
    # (a multiple of 2 signifies `empty` operations e.g. add a char and delete repeatedly)
    return ((to_delete + to_append - k) % 2 == 0)
end

end # module EasyModule