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
    findDigits
export beautifulDays, findDigits

#using MediumModule
#using HardModule

end
