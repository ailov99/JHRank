"""
    AlgorithmsHardModule

Module containing "hard" tier algorithms questions from HackerRank
"""

module AlgorithmsHardModule

    __precompile__(true)
    
    """
    
    You are given a 2D matrix of dimension M x N and a positive integer `r`. You have to rotate 
    the matrix `r` times and return the resultant matrix. Rotation should be in anti-clockwise direction.
    e.g. For `r` == 1:
     1 2 3 4      2  3 4 5
    12 1 2 5  ->  1  2 3 6
    11 4 3 6     12  1 4 7
    10 9 8 7     11 10 9 8
    
    Note:
    - 2 <= m, n <= 300
    - 1 <= r <= 10^9
    - min(m,n) % 2 = 0
    - 1 <= matrix[i][j] <= 10^8 where i in [1...m] and j in [1...n]
    
    # Arguments
    - `matrix` = an M x N matrix (represented as a 2d vector)
    - `r` = number of anti-clockwise rotations
    
    # Output
    The rotated matrix
    """
    function matrixRotation(
        matrix::Vector{Vector{Number}}, 
        r::Int
    )::Matrix{Number}
        # Convert 2d Vector into a Matrix
        # (use transpose as we want vectors to be rows)
        input_m = vcat([x' for x in matrix]...)
    
        # Get matrix dimensions
        matrix_height = size(input_m)[1]
        matrix_width = size(input_m)[2]
        output_m = Matrix{Number}(undef, matrix_height, matrix_width)
        
        # We will rotate ring-by-ring
        rings_in_matrix = min(floor(Int, matrix_height/2), floor(Int, matrix_width/2))
        ring_width = matrix_width
        ring_height = matrix_height
    
        for ring = 1:rings_in_matrix
            ring_length = 2*ring_height + 2*ring_width - 4
            
            # Find the offset for element (1,1) within the ring post-rotation
            # and shift all elements using that
            offset = r % ring_length
        
            # Map input matrix ring index -> Output matrix ring index
            in_ring_to_out_ring = (offset, in_ring_index) -> begin
                # Apply offset and handle wrap-rounds (backwards)
                offset_index = in_ring_index - offset
                (offset_index > 0) && return offset_index
                return ring_length + offset_index
            end
        
            # Map matrix ring index -> Matrix coordinates
            ring_to_matrix_coords = (i) -> begin
                # Need to find out where in the ring `i` lies 
                # (first/last matrix row or first last/matrix col)
                offset_within_matrix = ring - 1
                if i <= ring_width
                    # i is on first row
                    return (1 + offset_within_matrix, i + offset_within_matrix)
                elseif i <= (ring_width + ring_height - 2)
                    # i is on last col
                    offset_within_col = i - ring_width + 1
                    return (offset_within_col + offset_within_matrix, matrix_width - offset_within_matrix)
                elseif i <= (2*ring_width + ring_height - 2)
                    # i is on last row
                    offset_within_row = (2*ring_width + ring_height - 2) - i + 1
                    return (matrix_height - offset_within_matrix, offset_within_row + offset_within_matrix)
                else 
                    # i is on first col
                    offset_within_col = ring_length - i + 2
                    return (offset_within_col + offset_within_matrix, 1+offset_within_matrix)
                end
            end
            
            # Copy elements across matrices
            for i = 1:ring_length  
                out_m_i = in_ring_to_out_ring(offset, i)
                in_m_row, in_m_col = ring_to_matrix_coords(i)
                out_m_row, out_m_col = ring_to_matrix_coords(out_m_i)
                output_m[out_m_row, out_m_col] = input_m[in_m_row, in_m_col]
            end
        
            # Shrink dimensions for next ring
            ring_height -= 2
            ring_width -= 2
        end
    
        return output_m
    end

end # module AlgorithmsHardModule