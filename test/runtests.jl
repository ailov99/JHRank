using Test

@testset "UtilityFunctionsModuleTests" begin
    include("test_utilityfunctionsmodule.jl")
end

@testset "AlgorithmsEasyModuleTests" begin
    include("test_algorithms_easymodule.jl")
end

@testset "AlgorithmsMediumModuleTests" begin
    include("test_algorithms_mediummodule.jl")
end

@testset "AlgorithmsHardModuleTests" begin
    include("test_algorithms_hardmodule.jl")
end

@testset "DataStructuresEasyModuleTests" begin
    include("test_datastructures_easymodule.jl")
end

@testset "MathematicsEasyModuleTests" begin
    include("test_mathematics_easymodule.jl")
end

true
