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

"""
    equalizeArray(arr::Vector{Int})

Given an array of integers, determine the minimum number of elements to delete to leave only elements of equal value.

# Arguments
- `arr` = input array of integers

# Output
Min number of elements to delete from `arr` to leavy only elements of equal size
"""
function equalizeArray(arr::Vector{Int})
    # Keep track of occurrences for each integer
    freqs = Dict{Int, Int}()
    # And the max occurency (frequency) so we can do everything in 1 pass (0(n) + dict access)
    max_freq = 0

    # Scan the array
    for i in arr
        # Update dict record
        if haskey(freqs, i)
            freqs[i] += 1
        else
            freqs[i] = 1
        end
        # Update max
        if freqs[i] > max_freq
            max_freq = freqs[i]
        end
    end

    return (length(arr) - max_freq)
end

"""
    repeatedString(s::String, n::Int)

There is a string s of lowercase English letters that is repeated infinitely many times. 
Given an integer n find and return the number of letter 'a's in the first n letters of the infinite string.

# Arguments
- `s` = input string
- `n` = number of characters to scan, in s, for 'a's

# Output
The number of 'a' letters found in the first n letters of s repeated infinitely
"""
function repeatedString(s::String, n::Int)
    # First find how many a's in s and how many full s's we have
    s_repeated = div(n, length(s))
    a_in_s = sum([1 for x in s if x == 'a'])

    # Then take care of the remainder
    counter = a_in_s * s_repeated
    for i = 1:(n % length(s))
        (s[i] == 'a') && (counter += 1)
    end

    return counter
end

"""
    serviceLane(widths::Vector{Int}, cases::Vector{Vector{Int}})

A driver is driving on the freeway. The check engine light of his vehicle is on, and the driver wants to get service immediately. 
Luckily, a service lane runs parallel to the highway. It varies in width along its length.
You will be given an array of widths at points along the road (indices), then a list of the indices of entry and exit points. 
Considering each entry and exit point pair, calculate the maximum size vehicle that can travel that segment of the service lane safely.

# Arguments
- `n` = widths of the service lane along the road
- `cases` = each element contains the entry and exit indices for a segment of the road/service lane to consider, inclusive

# Output
The maximum width vehicle that can pass through each segment of the service lane, as described in `cases`
"""
function serviceLane(widths::Vector{Int}, cases::Vector{Vector{Int}})
    vehicles = []
    
    for case in cases
        segment_start = case[1] + 1 # Julia indexing
        segment_end = case[2] + 1 # Julia indexing
        push!(vehicles, minimum(widths[segment_start:segment_end]))
    end

    return vehicles
end

"""
    jumpingOnClouds(c::Vector{Int})

There is a new mobile game that starts with consecutively numbered clouds. Some of the clouds are thunderheads and 
others are cumulus. The player can jump on any cumulus cloud having a number that is equal to the number of the current cloud 
plus 1 or 2. The player must avoid the thunderheads. Determine the minimum number of jumps it will take to jump from the starting 
postion to the last cloud. It is always possible to win the game.
For each game, you will get an array of clouds numbered 0 if they are safe or 1 if they must be avoided.

# Arguments
- `c` = list of clouds, where 1 signifies thunderheads

# Output
The minimum number of jumps of length 1 or 2 needed to reach the last cloud
"""
function jumpingOnClouds(c::Vector{Int})
    pos = 1
    jumps = 0
    
    while pos != length(c)
        # First try to jump by 2 (minding jump-past-end)
        if ((pos+2) <= length(c)) && (c[pos+2] == 0)
            jumps += 1
            pos += 2
        elseif c[pos+1] == 0
            jumps += 1
            pos += 1
        else
            # Problem doesn't specify what to do here so just return
            # (ie destination unreachable)
            return jumps
        end
    end
    
    return jumps
end

"""
    taumBday(b, w, bc, wc, z)

Taum is planning to celebrate the birthday of his friend, Diksha. There are two types of gifts that Diksha 
wants from Taum: one is black and the other is white. To make her happy, Taum has to buy  black gifts and  white gifts.
- The cost of each black gift is  units.
- The cost of every white gift is  units.
- The cost to convert a black gift into white gift or vice versa is  units.
Determine the minimum cost of Diksha's gifts.

# Arguments
- `b` = Number of black gifts Diksha wants
- `w` = Number of white gifts Diksha wants
- `bc` = Cost of a black gift
- `wc` = Cost of a white gift
- `z` = Cost to convert a gift black<->white

# Output
The minimum cost of Diksha's black + white gifts
"""
function taumBday(b, w, bc, wc, z)
    min_price_b = Int64(min(bc, wc+z))
    min_price_w = Int64(min(wc, bc+z))
    return (b*min_price_b + w*min_price_w)
end

"""
    kaprekarNumbers(p, q)

A modified Kaprekar number is a positive whole number with a special property. If you square it, then split 
the number into two integers and sum those integers, you have the same value you started with.
Consider a positive whole number `n` with `d` digits. We square `n` to arrive at a number that is either `2*d` digits 
long or `2*d - 1` digits long. Split the string representation of the square into two parts, `l` and `r`. 
The right hand part, `r` must be `d` digits long. The left is the remaining substring. Convert those two 
substrings back to integers, add them and see if you get .

# Arguments
- `p` = lower limit of range to scan for Kaprekar numbers (incl) 
- `q` = upper limit of range to scan for Kaprekar numbers (incl)

# Output
A list of Kaprekar numbers in the range p-q
"""
function kaprekarNumbers(p, q)
    kaprekar_nums = []
    
    for n = p:q
        digits_in_n = getIntDigits(n)
        n_squared = n*n
        
        # Build `l` and `r`
        digits_in_n_squared = getIntDigits(n_squared)
        digits_in_r = digits_in_n
        digits_in_l = digits_in_n_squared - digits_in_r

        r = 0
        l = 0
        # Just scan `n_squared` left-right to derive `l` and `r`
        multiplier_l = 10^(max(digits_in_l,1) - 1)
        multiplier_r = 10^(max(digits_in_r,1) - 1)
        for i = 1:digits_in_n_squared
            # Note: getDigitAt indexes left to right
            digit = getDigitAt(n_squared, i)
            if i <= digits_in_l
                l += multiplier_l*digit
                multiplier_l = div(multiplier_l, 10)
            else
                r += multiplier_r*digit
                multiplier_r = div(multiplier_r, 10)
            end
        end

        # It's a Kaprekar num if the 2 parts sum up to n
        if (r+l) == n
            push!(kaprekar_nums, n)
        end
    end
    
    return kaprekar_nums
end

end # module EasyModule