module matrixRotation_test

using JHRank
using JHRank.HardModule
using Test

function test()
    # HR
    m1 = Array{Array{Int, 1}, 1}(
        [[1, 2, 3, 4],
         [12, 1, 2, 5],
         [11, 4, 3, 6],
         [10, 9, 8, 7]]
    )
    m1_rot_once = [
        2 3 4 5;
        1 2 3 6;
        12 1 4 7;
        11 10 9 8
    ]
    m1_rot_twice = [
        3 4 5 6;
        2 3 4 7;
        1 2 1 8;
        12 11 10 9
    ]
    @test matrixRotation(m1, 1) === m1_rot_once
    @test matrixRotation(m1, 2) === m1_rot_twice

    m2 = Array{Array{Int, 1}, 1}(
        [[1, 2, 3, 4],
         [5, 6, 7, 8],
         [9, 10, 11, 12],
         [13, 14, 15, 16]]
    )
    m2_rot_once = [
        2 3 4 8;
        1 7 11 12;
        5 6 10 16;
        9 13 14 15
    ]
    m2_rot_twice = [
        3 4 8 12;
        2 11 10 16;
        1 7 6 15;
        5 9 13 14
    ]
    @test matrixRotation(m2, 1) === m2_rot_once
    @test matrixRotation(m2, 2) === m2_rot_twice

    m3 = Array{Array{Int, 1}, 1}(
        [[1, 2, 3, 4],
         [7, 8, 9, 10],
         [13, 14, 15, 16],
         [19, 20, 21, 22],
         [25, 26, 27, 28]]
    )
    m3_rot_matrices = [
        [
            2 3 4 10;
            1 9 15 16;
            7 8 21 22;
            13 14 20 28;
            19 25 26 27
        ],
        [
            3 4 10 16;
            2 15 21 22;
            1 9 20 28;
            7 8 14 27;
            13 19 25 26
        ],
        [
            4 10 16 22;
            3 21 20 28;
            2 15 14 27;
            1 9 8 26;
            7 13 19 25
        ],
        [
            10 16 22 28;
            4 20 14 27;
            3 21 8 26;
            2 15 9 25;
            1 7 13 19
        ],
        [
            16 22 28 27;
            10 14 8 26;
            4 20 9 25;
            3 21 15 19;
            2 1 7 13
        ],
        [
            22 28 27 26;
            16 8 9 25;
            10 14 15 19;
            4 20 21 13;
            3 2 1 7
        ],
        [
            28 27 26 25;
            22 9 15 19;
            16 8 21 13;
            10 14 20 7;
            4 3 2 1
        ]
    ]
    for (i, expected_m) in enumerate(m3_rot_matrices)
        @test matrixRotation(m3, i) === expected_m
    end
end

end # module matrixRotation_test

using .matrixRotation_test
matrixRotation_test.test()