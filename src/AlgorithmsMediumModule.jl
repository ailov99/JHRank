"""
    AlgorithmsMediumModule

Module containing "medium" tier algorithms questions from HackerRank
"""

module AlgorithmsMediumModule

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

"""
    countSort(arr::Array{Array{String}})

Use the counting sort to order a list of strings associated with integers. If two strings are associated with the same integer, they must be printed in their original order, 
i.e. your sorting algorithm should be stable. There is one other twist: strings in the first half of the array are to be replaced with the character - (dash, ascii 45 decimal).
Insertion Sort and the simple version of Quicksort are stable, but the faster in-place version of Quicksort is not since it scrambles around elements while sorting.
Design your counting sort to be stable.

# Arguments
- `arr` = an input array of pairs (integer : string associated with the integer)

# Output
The string resulting from stable-sorting the input array by integers and then concatenating the strings in-order 
(bearing in mind strings from the first half of the orriginal array ought to be replaced by dashes `-`)
"""
function countSort(arr::Vector{Vector{String}})
    sorted_arr = [[] for i = 1:100] # Constraint 0 <= integer in pair < 100 from problem definition

    # Linear scan of input array to group strings into buckets
    for i = 1:length(arr)
        bucket_index = parse(Int, arr[i][1]) + 1 # julia indexing requires +1
        # Note: We push strings with spaces appended so we can eventually just flatten the array
        if i <= length(arr)/2
            push!(sorted_arr[bucket_index], "- ")
        else
            push!(sorted_arr[bucket_index], "$(arr[i][2]) ")
        end
    end

    # Flatten array of arrays and concatenate all strings
    return chop(reduce(*, vcat(sorted_arr...)))
end


"""
    timeInWords(h::Int, m::Int)

Given the time in numerals we may convert it into words.
At minutes == 0, use o' clock. For 1 <= minutes <= 30, use past, and  for 30 < minutes use to. Note the space between 
the apostrophe and clock in o' clock. Write a program which prints the time in words for the input given in the format described.

# Arguments
- `h` = number of hours
- `m` = number of minutes

# Output
The time in words, as described above
"""
function timeInWords(h::Int, m::Int)
    # Num -> Word lookup
    num_to_str = Dict(
        1 => "one", 2 => "two", 3 => "three", 4 => "four",
        5 => "five", 6 => "six", 7 => "seven", 8 => "eight",
        9 => "nine", 10 => "ten", 11 => "eleven", 12 => "twelve",
        13 => "thirteen", 15 => "quarter", 20 => "twenty", 30 => "half"
    )

    # o'clock case is easy
    (m == 0) && return "$(num_to_str[h]) o' clock"

    # construct minutes part
    use_past = (m <= 30)
    minutes_part_num = use_past ? m : (60 - m)

    buffer = IOBuffer()
    if haskey(num_to_str, minutes_part_num)
        minutes_part_str = num_to_str[minutes_part_num]
        half_or_quarter = (minutes_part_num == 30) || (minutes_part_num == 15)
        minutes_word = half_or_quarter ? "" : (minutes_part_num) == 1 ? "minute " : "minutes "
        print(buffer, "$(minutes_part_str) $(minutes_word)")
    elseif 14 <= minutes_part_num <= 19
        minutes_part_str = num_to_str[minutes_part_num%10]
        print(buffer, "$(minutes_part_str)teen minutes ")
    else
        minutes_part_str = "$(num_to_str[20]) $(num_to_str[minutes_part_num%20])"
        print(buffer,  "$(minutes_part_str) minutes ")
    end

    # then hours part
    print(buffer, "$(use_past ? "past" : "to") ")
    hour_part_num = use_past ? h : h == 12 ? 1 : (h+1)
    hour_part_str = num_to_str[hour_part_num]
    print(buffer, "$(hour_part_str)")

    return String(take!(buffer))
end

"""
    hackerlandRadioTransmitters(x::Vector{Int}, k::Int)

Hackerland is a one-dimensional city with houses aligned at integral locations along a road. 
The Mayor wants to install radio transmitters on the roofs of the city's houses. Each transmitter 
has a fixed range meaning it can transmit a signal to all houses within that number of units distance away.
Given a map of Hackerland and the transmission range, determine the minimum number of transmitters so that 
every house is within range of at least one transmitter. Each transmitter must be installed on top of an existing house.

# Arguments
- `x` = list of house locations in the city 
- `k` = radius of each transmitter

# Output
The minimum number of transmitters needed to cover the whole city
"""
function hackerlandRadioTransmitters(x::Vector{Int}, k::Int)
    # Build a map of the city where TRUE represents a house needing connection
    no_coverage_map = fill(false, maximum(x))
    for house_i in x
        no_coverage_map[house_i] = true
    end

    # Now scan the map left -> right:
    # 1. Find a house needing connection
    # 2. Place a transmitter as far to the right of it as possible
    # 3. Set everything within the transmitter's radius to FALSE
    transmitters = 0
    for i = 1:length(no_coverage_map)
        # Skip if no house needing connection
        !no_coverage_map[i] && continue

        # Find the furthest location we could place a transmitter at to cover house at `i`
        location_furthest_from_i = min(length(no_coverage_map), i + k)
        transmitter_location = location_furthest_from_i
        for j = 0:k
            house_j_location = location_furthest_from_i - j
            # First house found is the "ideal" place
            if no_coverage_map[house_j_location]
                transmitter_location = house_j_location
                break
            end
        end

        # Place transmitter
        leftmost_house = max(1, transmitter_location - k)
        rightmost_house = min(length(no_coverage_map), transmitter_location + k)
        for i = leftmost_house:rightmost_house
            no_coverage_map[i] = false
        end
        transmitters += 1

    end

    return transmitters
end

"""
    organizingContainers(containers)

David has several containers, each with a number of balls in it. He has just enough containers to sort 
each type of ball he has into its own container. David wants to sort the balls using his sort method.
David wants to perform some number of swap operations such that:
- Each container contains only balls of the same type.
- No two balls of the same type are located in different containers.

# Arguments
- `containers` = A 2d vector, describing containers. Where the number of balls of type N in container M is containers[M][N]

# Output
Returns "Possible" if the sorting via swaps can be done, "Impossible" otherwise
"""
function organizingContainers(containers)
    # Since we are only allowed swaps, the size of each container won't change
    # So this can be reduced to a problem of finding a container with the exact size
    # to fit each type of balls
    cardinality = length(containers)
    container_capacities = zeros(cardinality)
    ball_types_count = zeros(cardinality)

    for container_i = 1:length(containers)
        container = containers[container_i]
        for ball_type = 1:length(container)
            ball_type_count_in_container = container[ball_type]
            ball_types_count[ball_type] += ball_type_count_in_container
            container_capacities[container_i] += ball_type_count_in_container
        end
    end

    # Problem states there are "just enough" containers for each type
    return issetequal(container_capacities, ball_types_count) ? "Possible" : "Impossible"
end

end # module AlgorithmsMediumModule