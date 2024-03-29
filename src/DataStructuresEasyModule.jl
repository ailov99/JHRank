"""
    DataStructuresEasyModule

Module containing "easy" tier data structures questions from HackerRank
"""

module DataStructuresEasyModule

    __precompile__(true)
    
    """
        rotateLeft(d, arr)
    
    A left rotation operation on an array of size `n` shifts each of the array's elements 1 unit 
    to the left. Given an integer, `d`, rotate the array that many steps left and return the result.
    
    # Arguments
    - `d` = number of 1-step rotations to the left
    - `arr` = the array to rotate
    
    # Output
    The rotated array.
    """
    function rotateLeft(d, arr)
        arr_len = length(arr)
    
        # Find the start index of the rotated array:
        # it will be the start of the unrotated arr + offset accounting for
        # wrap-round
        start_offset = d % arr_len
        rotated_arr_start = 1 + start_offset
    
        # Knowing the rotated start index, we just partition the original array in 2
        # and return the concatenation
        vcat(arr[rotated_arr_start:arr_len], arr[1:rotated_arr_start-1])
    end

end # module DataStructuresEasyModule