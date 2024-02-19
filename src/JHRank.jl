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
    circularArrayRotation
export beautifulDays, findDigits, cutTheSticks,
    circularArrayRotation

using .MediumModule:
    formingMagicSquare
export formingMagicSquare

#using HardModule

end
