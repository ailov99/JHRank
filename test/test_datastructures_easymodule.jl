module rotateLeft_test

using JHRank
using JHRank.DataStructuresEasyModule
using Test

function test()
    # HR
    @test rotateLeft(2, [1,2,3,4,5]) == [3,4,5,1,2]
    @test rotateLeft(4, [1,2,3,4,5]) == [5,1,2,3,4]
    @test rotateLeft(5, [1,2,3,4,5]) == [1,2,3,4,5]

    # Random vectors
    for j=1:10
        # Generate
        n = rand(1:10^5)
        random_arr = rand(1:10^6,n)
        random_d = rand(1:n)
        random_arr_rotated = rotateLeft(random_d, random_arr)
        
        # Compare pre and post rotation element-by-element
        random_arr_start_index = 1
        offset = random_d % n
        random_arr_rotated_index = random_arr_start_index - offset + n

        test_pass = true
        for i = random_arr_start_index:length(random_arr)
            test_pass &= (random_arr[i] == random_arr_rotated[random_arr_rotated_index])
            random_arr_rotated_index += 1
            if random_arr_rotated_index > n
                random_arr_rotated_index %= n
            end
        end

        @test true == test_pass
    end
end

end # module rotateLeft_test

using .rotateLeft_test
rotateLeft_test.test()