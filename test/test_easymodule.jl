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