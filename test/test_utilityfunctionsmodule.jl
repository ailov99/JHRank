module getIntDigits_test 

    using JHRank
    using JHRank.UtilityFunctionsModule
    using Test

    function test() 
        for i = -9:9
            @test getIntDigits(i) == 1
        end

        @test getIntDigits(3636) == 4
        @test getIntDigits(-624746353) == 9
        @test getIntDigits(123) == 3
        @test getIntDigits(typemax(Int32)) == 10
        @test getIntDigits(typemin(Int32)) == 10
        @test getIntDigits(typemax(Int64)) == 19
        @test_throws DomainError getIntDigits(typemin(Int64))
    end

end # module getIntDigits_test

using .getIntDigits_test
getIntDigits_test.test()


module reverseInt_test

    using JHRank
    using JHRank.UtilityFunctionsModule
    using Test

    function test()
        for i = -9:9
            @test reverseInt(i) == i
        end

        @test reverseInt(12345) == 54321
        @test reverseInt(-123) == -321
        @test reverseInt(54367) == 76345
        @test reverseInt(-666) == -666
        @test reverseInt(typemin(Int32)) == -8463847412
        @test reverseInt(typemax(Int32)) == 7463847412
        @test reverseInt(typemax(Int64)) == 7085774586302733229
        @test_throws DomainError reverseInt(typemin(Int64))
    end

end # module reverseInt_test

using .reverseInt_test
reverseInt_test.test()

module getDigitAt_test

    using JHRank
    using JHRank.UtilityFunctionsModule
    using Test

    function test()
        @test getDigitAt(523464, 4) == 4
        @test getDigitAt(typemin(Int32), 8) == 6
        @test getDigitAt(typemax(Int32), 9) == 4
        @test_throws DomainError getDigitAt(typemin(Int64), 12) == 5
        @test getDigitAt(typemax(Int64), 14) == 7
        @test getDigitAt(typemax(Int64), 8) == 0
        @test_throws DomainError getDigitAt(12345, -5)
        @test_throws DomainError getDigitAt(12345, 0)
        @test_throws DomainError getDigitAt(12345, 6)
    end

end # module getDigitAt_test

using .getDigitAt_test
getDigitAt_test.test()

module matrixReadWrite_test

    using JHRank
    using JHRank.UtilityFunctionsModule
    using Test

    function test()
        # Define
        m1 = rand(Int, 3, 3)
        m1_meta = [3, 3]
        m1_f = joinpath(@__DIR__, "m1.data")
        m1_meta_f = joinpath(@__DIR__, "m1_meta.data")
        try
            # Write
            @test_nowarn writeMatrixToFile(m1, m1_f)
            @test_nowarn writeMatrixAndMetadataToFile(m1, m1_meta, m1_meta_f)
            # Read
            @test_throws ArgumentError readMatrixFromFile("doesnt_exist.data")
            @test_throws ArgumentError readMatrixWithMetadataFromFile("doesnt_exist.data")
            @test m1 == readMatrixFromFile(m1_f)
            @test (m1, m1_meta) == readMatrixWithMetadataFromFile(m1_meta_f)
        finally
            isfile(m1_f) && rm(m1_f)
            isfile(m1_meta_f) && rm(m1_meta_f)
        end

        # Define
        m2 = rand(3,3)
        m2_meta = [3, 3]
        m2_f = joinpath(@__DIR__, "m2.data")
        m2_meta_f = joinpath(@__DIR__, "m2_meta.data")
        try
            # Write
            @test_nowarn writeMatrixToFile(m2, m2_f)
            @test_nowarn writeMatrixAndMetadataToFile(m2, m2_meta, m2_meta_f)
            # Read
            @test m2 == readMatrixFromFile(m2_f)
            @test (m2, m2_meta) == readMatrixWithMetadataFromFile(m2_meta_f)
        finally
            isfile(m2_f) && rm(m2_f)
            isfile(m2_meta_f) && rm(m2_meta_f)
        end

        # Define
        m3 = rand(Int, 99, 99)
        m3_meta = [99, 99]
        m3_f = joinpath(@__DIR__, "m3.data")
        m3_meta_f = joinpath(@__DIR__, "m3_meta.data")
        try
            # Write
            @test_nowarn writeMatrixToFile(m3, m3_f)
            @test_nowarn writeMatrixAndMetadataToFile(m3, m3_meta, m3_meta_f)
            # Read
            @test m3 == readMatrixFromFile(m3_f)
            @test (m3, m3_meta) == readMatrixWithMetadataFromFile(m3_meta_f)
        finally
            isfile(m3_f) && rm(m3_f)
            isfile(m3_meta_f) && rm(m3_meta_f)
        end

        # Define
        m4 = rand(99, 99)
        m4_meta = [99, 99]
        m4_f = joinpath(@__DIR__, "m4.data")
        m4_meta_f = joinpath(@__DIR__, "m4_meta.data")
        try
            # Write
            @test_nowarn writeMatrixToFile(m4, m4_f)
            @test_nowarn writeMatrixAndMetadataToFile(m4, m4_meta, m4_meta_f)
            # Read
            @test m4 == readMatrixFromFile(m4_f)
            @test (m4, m4_meta) == readMatrixWithMetadataFromFile(m4_meta_f)
        finally
            isfile(m4_f) && rm(m4_f)
            isfile(m4_meta_f) && rm(m4_meta_f)
        end

        # Define
        m5 = rand(Int, 500, 299)
        m5_meta = [500, 299]
        m5_f = joinpath(@__DIR__, "m5.data")
        m5_meta_f = joinpath(@__DIR__, "m5_meta.data")
        try
            # Write
            @test_nowarn writeMatrixToFile(m5, m5_f)
            @test_nowarn writeMatrixAndMetadataToFile(m5, m5_meta, m5_meta_f)
            # Read
            @test m5 == readMatrixFromFile(m5_f)
            @test (m5, m5_meta) == readMatrixWithMetadataFromFile(m5_meta_f)
        finally
            isfile(m5_f) && rm(m5_f)
            isfile(m5_meta_f) && rm(m5_meta_f)
        end

        # Define
        m6 = rand(1, 5)
        m6_meta = [1, 5]
        m6_f = joinpath(@__DIR__, "m6.data")
        m6_meta_f = joinpath(@__DIR__, "m6_meta.data")
        try
            # Write
            @test_nowarn writeMatrixToFile(m6, m6_f)
            @test_nowarn writeMatrixAndMetadataToFile(m6, m6_meta, m6_meta_f)
            # Read
            @test m6 == readMatrixFromFile(m6_f)
            @test (m6, m6_meta) == readMatrixWithMetadataFromFile(m6_meta_f)
        finally
            isfile(m6_f) && rm(m6_f)
            isfile(m6_meta_f) && rm(m6_meta_f)
        end

        # Define
        m7 = rand(666, 888)
        m7_meta = [666, 888]
        m7_f = joinpath(@__DIR__, "m7.data")
        m7_meta_f = joinpath(@__DIR__, "m7_meta.data")
        try
            # Write
            @test_nowarn writeMatrixToFile(m7, m7_f)
            @test_nowarn writeMatrixAndMetadataToFile(m7, m7_meta, m7_meta_f)
            # Read
            @test m7 == readMatrixFromFile(m7_f)
            @test (m7, m7_meta) == readMatrixWithMetadataFromFile(m7_meta_f)
        finally
            isfile(m7_f) && rm(m7_f)
            isfile(m7_meta_f) && rm(m7_meta_f)
        end

    end

end # module matrixReadWrite_test

using .matrixReadWrite_test
matrixReadWrite_test.test()

module isPrime_test 

    using JHRank
    using JHRank.UtilityFunctionsModule
    using Test

    function test() 
        @test isPrime(2) == true
        @test isPrime(3) == true
        @test isPrime(4) == false
        @test isPrime(5) == true
        @test isPrime(6) == false
        @test isPrime(7) == true
        @test isPrime(11) == true
        @test isPrime(13) == true
        @test isPrime(4_634_343) == false
        @test isPrime(32_647) == true
    end

end # module isPrime_test

using .isPrime_test
isPrime_test.test()

module findPrimesUpTo_test

    using JHRank
    using JHRank.UtilityFunctionsModule
    using Test
    
    function test() 
        @test findPrimesUpTo(15) == [2, 3, 5, 7, 11, 13]
        @test findPrimesUpTo(100) == [
            2, 3, 5, 7, 11, 13, 17, 19, 23, 
            29, 31, 37, 41, 43, 47, 53, 59, 
            61, 67, 71, 73, 79, 83, 89, 97
        ]
        @test findPrimesUpTo(1_000) == [
            2, 3, 5, 7, 11, 13, 17, 19, 23, 
            29, 31, 37, 41, 43, 47, 53, 59, 
            61, 67, 71, 73, 79, 83, 89, 97,
            101, 103, 107, 109, 113, 127, 
            131, 137, 139, 149, 151, 157, 
            163, 167, 173, 179, 181, 191, 
            193, 197, 199,211, 223, 227, 229, 
            233, 239, 241, 251, 257, 263, 269, 
            271, 277, 281, 283, 293,307, 311, 
            313, 317, 331, 337, 347, 349, 353, 
            359, 367, 373, 379, 383, 389, 397,
            401, 409, 419, 421, 431, 433, 439, 
            443, 449, 457, 461, 463, 467, 479, 
            487, 491, 499,503, 509, 521, 523, 541, 
            547, 557, 563, 569, 571, 577, 587, 593, 
            599, 601, 607, 613, 617, 619, 631, 641, 
            643, 647, 653, 659, 661, 673, 677, 683, 
            691, 701, 709, 719, 727, 733, 739, 743, 
            751, 757, 761, 769, 773, 787, 797,  809, 
            811, 821, 823, 827, 829, 839, 853, 857, 
            859, 863, 877, 881, 883, 887, 907, 911, 
            919, 929, 937, 941, 947, 953, 967, 971, 
            977, 983, 991, 997
        ]
    end

end # module findPrimesUpTo_test

using .findPrimesUpTo_test
findPrimesUpTo_test.test()