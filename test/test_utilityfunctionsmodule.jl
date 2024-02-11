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