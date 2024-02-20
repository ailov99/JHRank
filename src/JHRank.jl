module JHRank

__precompile__(true)

include("ModuleIncludes.jl")

using .UtilityFunctionsModule:
    getIntDigits, 
    getDigitAt,
    reverseInt
export getIntDigits, getDigitAt, reverseInt

using .EasyModule:
    beautifulDays,
    findDigits,
    cutTheSticks,
    circularArrayRotation,
    viralAdvertising
export beautifulDays, findDigits, cutTheSticks,
    circularArrayRotation, viralAdvertising

using .MediumModule:
    formingMagicSquare
export formingMagicSquare

using .HardModule:
    matrixRotation
export matrixRotation

end
