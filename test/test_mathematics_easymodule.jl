module maximumDraws_test

    using JHRank
    using JHRank.MathematicsEasyModule
    using Test

    function test()
        for i = 1:9999:10^6
            @test maximumDraws(i) == i+1
        end
    end

end # module maximumDraws_test

using .maximumDraws_test
maximumDraws_test.test()