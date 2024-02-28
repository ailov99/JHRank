module beautifulDays_test

using JHRank
using JHRank.EasyModule
using Test

# i32 'macro' is needed as we only implement this function for Int32 (HR requirements)
struct i32 end
(*)(n, ::Type{i32}) = Int32(n)

function test()
    # HR
    @test beautifulDays(20i32, 23i32, 6i32) == 2
    # Invalid input (end before start)
    @test beautifulDays(23i32, 20i32, 6i32) == 0
    # All days
    @test beautifulDays(1i32, 9i32, 33i32) == 9
    # Other
    @test beautifulDays(56i32, 58i32, 3i32) == 3
    @test beautifulDays(10i32, 99i32, 9i32) == 90
    @test beautifulDays(100i32, 999i32, 99i32) == 900
    @test beautifulDays(100i32, 999i32, 11i32) == 900
    @test beautifulDays(100i32, 999i32, 9i32) == 900
    @test beautifulDays(100i32, 999i32, 3i32) == 900
    @test beautifulDays(1000i32, 9999i32, 9i32) == 9000
    @test beautifulDays(1000i32, 9999i32, 3i32) == 9000
    @test beautifulDays(998i32, 1001i32, 99i32) == 3
end

end # module beautifulDays_test

using .beautifulDays_test
beautifulDays_test.test()

module findDigits_test 

using JHRank
using JHRank.EasyModule
using Test

# i32 'macro' is needed as we only implement this function for Int32 (HR requirements)
struct i32 end
(*)(n, ::Type{i32}) = Int32(n)

function test()
    # HR
    @test findDigits(12i32) == 2
    @test findDigits(1012i32) == 3
    # Other
    @test findDigits(64523526i32) == 5
    @test findDigits(222222222i32) == 9
    @test findDigits(typemax(Int32)) == 1
    @test findDigits(typemin(Int32)) == 7
end

end # module findDigits_test

using .findDigits_test
findDigits_test.test()

module cutTheSticks_test

using JHRank
using JHRank.EasyModule
using Test

function test()
    # HR
    # Test Case 8
    # sticks-length        length-of-cut   sticks-cut
    # 5 4 4 2 2 8             2               6
    # 3 2 2 _ _ 6             2               4
    # 1 _ _ _ _ 4             1               2
    # _ _ _ _ _ 3             3               1
    # _ _ _ _ _ _           DONE            DONE
    test_case_8::Array{Int32} = [5, 4, 4, 2, 2, 8]
    @test cutTheSticks(test_case_8) == [6, 4, 2, 1]

    # Test Case 9
    # sticks-length         length-of-cut   sticks-cut
    # 1 2 3 4 3 3 2 1         1               8
    # _ 1 2 3 2 2 1 _         1               6
    # _ _ 1 2 1 1 _ _         1               4
    # _ _ _ 1 _ _ _ _         1               1
    # _ _ _ _ _ _ _ _       DONE            DONE
    test_case_9::Array{Int32} = [1, 2, 3, 4, 3, 3, 2, 1]
    @test cutTheSticks(test_case_9) == [8, 6, 4, 1]
end

end # module cutTheSticks_test

using .cutTheSticks_test
cutTheSticks_test.test()


module circularArrayRotation_test

using JHRank
using JHRank.EasyModule
using Test

# i32 'macro' is needed as we only implement this function for Int32 (HR requirements)
struct i32 end
(*)(n, ::Type{i32}) = Int32(n)

function test()
    # HR
    array_to_rotate::Array{Int32} = [1, 2, 3]
    indeces_to_report::Array{Int32} = [0, 1, 2]
    @test circularArrayRotation(array_to_rotate, 2i32, indeces_to_report) == [2, 3, 1]

    # Other
    @test circularArrayRotation(array_to_rotate, 0i32, indeces_to_report) == array_to_rotate
    @test circularArrayRotation(array_to_rotate, 3i32, indeces_to_report) == array_to_rotate
    
    array_to_rotate = [4, 6, 1, 2, 3, 5, 8, 9, 1]
    indeces_to_report = [0]
    @test circularArrayRotation(array_to_rotate, 5i32, indeces_to_report) == [3]

    indeces_to_report = [2, 4, 5, 8]
    @test circularArrayRotation(array_to_rotate, 5i32, indeces_to_report) == [8, 1, 4, 2]
end

end # module circularArrayRotation_test

using .circularArrayRotation_test
circularArrayRotation_test.test()

module viralAdvertising_test

using JHRank
using JHRank.EasyModule
using Test

function test()
    # HR
    @test viralAdvertising(5) == 24
    @test viralAdvertising(3) == 9
end

end # module viralAdvertising_test

using .viralAdvertising_test
viralAdvertising_test.test()

module libraryFine_test

using JHRank
using JHRank.EasyModule
using Test

function test()
    @test libraryFine(
        9, 6, 2015, 
        6, 6, 2015
    ) == 45
    @test libraryFine(
        1, 1, 2013,
        31, 12, 2012
    ) == 10_000
    @test libraryFine(
        31, 4, 2013,
        31, 3, 2013
    ) == 500
    @test libraryFine(
        1, 4, 2013,
        31, 3, 2013
    ) == 500
    @test libraryFine(
        31, 3, 2013,
        1, 3, 2013
    ) == 450
    @test libraryFine(
        15, 5, 2013,
        16, 5, 2013
    ) == 0
    @test libraryFine(
        31, 4, 2010,
        1, 6, 2010
    ) == 0
    @test libraryFine(
        31, 12, 2010,
        1, 1, 20011
    ) == 0
end

end # module libraryFine_test

using .libraryFine_test
libraryFine_test.test()

module maximizingXor_test

using JHRank
using JHRank.EasyModule
using Test

function test()
    @test maximizingXor(5, 5) == 0
    @test maximizingXor(1, 2) == 3
    @test maximizingXor(10, 15) == 7
    @test maximizingXor(11, 100) == 127
end

end # module maximizingXor_test

using .maximizingXor_test
maximizingXor_test.test()

module appendAndDelete_test

using JHRank
using JHRank.EasyModule
using Test

function test()
    @test appendAndDelete("abc", "def", 6) == true
    @test appendAndDelete("rollercoaster", "rollercoaster", 0) == true
    @test appendAndDelete("rollercoaster", "rollerrcoaster", 0) == false
    @test appendAndDelete("rollercoaster", "rollerrcoaster", 14) == false
    @test appendAndDelete("rollercoaster", "rollerrcoaster", 15) == true
    @test appendAndDelete("hackerhappy", "hackerrank", 9) == true
    @test appendAndDelete("aba", "aba", 7) == true
    @test appendAndDelete("a", "a", 200) == true
    @test appendAndDelete("ashley", "ash", 2) == false
    @test appendAndDelete("qwerasdf", "qwerbsdf", 6) == false
end

end # module appendAndDelete_test

using .appendAndDelete_test
appendAndDelete_test.test()