module formingMagicSquare_test

using JHRank
using JHRank.MediumModule
using Test

function test()
    # HR
    m1 = Array{Array{Int32, 1}, 1}(
        [[5, 3, 4],
         [1, 5, 8],
         [6, 4, 2]]
    )
    @test formingMagicSquare(m1) == 7

    m2 = Array{Array{Int32, 1}, 1}(
        [[4, 9, 2],
         [3, 5, 7],
         [8, 1, 5]]
    )
    @test formingMagicSquare(m2) == 1

    m3 = Array{Array{Int32, 1}, 1}(
        [[4, 8, 2],
         [4, 5, 7],
         [6, 1, 6]]
    )
    @test formingMagicSquare(m3) == 4
end

using .formingMagicSquare_test
formingMagicSquare_test.test()

end # module formingMagicSquare_test