module matrixRotation_test

    using JHRank
    using JHRank.AlgorithmsHardModule
    using JHRank.UtilityFunctionsModule
    using Test
    
    function test()
        # HR
        m1 = Array{Array{Number, 1}, 1}(
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
        @test matrixRotation(m1, 1) == m1_rot_once
        @test matrixRotation(m1, 2) == m1_rot_twice
    
        m2 = Array{Array{Number, 1}, 1}(
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
        @test matrixRotation(m2, 1) == m2_rot_once
        @test matrixRotation(m2, 2) == m2_rot_twice
    
        m3 = Array{Array{Number, 1}, 1}(
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
            @test matrixRotation(m3, i) == expected_m
        end
    
        m4 = Array{Array{Number, 1}, 1}(
            [[1, 1],
             [1, 1]]
        )
        m4_rot = [
            1 1;
            1 1
        ]
        @test matrixRotation(m4, 99) == m4_rot
    
        m5 = Array{Array{Number, 1}, 1}(
            [[9718805 , 60013003, 5103628 , 85388216, 21884498, 38021292, 73470430, 31785927],
             [69999937, 71783860, 10329789, 96382322, 71055337, 30247265, 96087879, 93754371],
             [79943507, 75398396, 38446081, 34699742, 1408833 , 51189   , 17741775, 53195748],
             [79354991, 26629304, 86523163, 67042516, 54688734, 54630910, 6967117 , 90198864],
             [84146680, 27762534, 6331115 , 5932542 , 29446517, 15654690, 92837327, 91644840],
             [58623600, 69622764, 2218936 , 58592832, 49558405, 17112485, 38615864, 32720798],
             [49469904, 5270000 , 32589026, 56425665, 23544383, 90502426, 63729346, 35319547],
             [20888810, 97945481, 85669747, 88915819, 96642353, 42430633, 47265349, 89653362],
             [55349226, 10844931, 25289229, 90786953, 22590518, 54702481, 71197978, 50410021],
             [9392211 , 31297360, 27353496, 56239301, 7071172 , 61983443, 86544343, 43779176]]
        )
        m5_rot = [
            93754371 53195748 90198864 91644840 32720798 35319547 89653362 50410021;
            31785927 25289229 10844931 97945481 5270000 69622764 27762534 43779176;
            73470430 90786953 42430633 96642353 88915819 85669747 26629304 86544343;
            38021292 22590518 90502426 67042516 54688734 32589026 75398396 61983443;
            21884498 54702481 17112485 5932542 29446517 2218936 71783860 7071172;
            85388216 71197978 15654690 58592832 49558405 6331115 10329789 56239301;
            5103628 47265349 54630910 56425665 23544383 86523163 96382322 27353496;
            60013003 63729346 51189 1408833 34699742 38446081 71055337 31297360;
            9718805 38615864 92837327 6967117 17741775 96087879 30247265 9392211;
            69999937 79943507 79354991 84146680 58623600 49469904 20888810 55349226
        ]
        @test matrixRotation(m5, 40) == m5_rot
    
        # m6, m7, m8
        for (matrix_filename, rot_matrix_filename) in [
            ("matrixRotationM6In.data", "matrixRotationM6Out.data"),
            ("matrixRotationM7In.data", "matrixRotationM7Out.data"),
            ("matrixRotationM8In.data", "matrixRotationM8Out.data")
        ]
            m_in_path = joinpath(@__DIR__, "testcase_data", matrix_filename)
            m_rot_path = joinpath(@__DIR__, "testcase_data", rot_matrix_filename)
        
            m, m_meta = readMatrixWithMetadataFromFile(m_in_path)
            height, width, rotations = m_meta
        
            # Need to convert matrix to vector of vectors as matrix rotation requires it (only to convert it back internally)
            # (this was a HR requirement)
            m_as_v = Vector{Vector{Number}}();
            for i = 1:height
                push!(m_as_v, m[i, :])
            end
        
            m_rot = readMatrixFromFile(m_rot_path)
            @test matrixRotation(m_as_v, rotations) == m_rot
        end
    
    end

end # module matrixRotation_test

using .matrixRotation_test
matrixRotation_test.test()