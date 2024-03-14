module JHRank

__precompile__(true)

include("ModuleIncludes.jl")

using .UtilityFunctionsModule:
    getIntDigits, 
    getDigitAt,
    reverseInt,
    readMatrixFromFile,
    readMatrixWithMetadataFromFile,
    writeMatrixToFile,
    writeMatrixAndMetadataToFile,
    isPrime,
    findPrimesUpTo
export getIntDigits, getDigitAt, reverseInt,
    readMatrixFromFile, readMatrixWithMetadataFromFile,
    writeMatrixToFile, writeMatrixAndMetadataToFile,
    isPrime, findPrimesUpTo

using .EasyModule:
    beautifulDays,
    findDigits,
    cutTheSticks,
    circularArrayRotation,
    viralAdvertising,
    libraryFine,
    maximizingXor,
    appendAndDelete,
    equalizeArray,
    repeatedString,
    serviceLane
export beautifulDays, findDigits, cutTheSticks,
    circularArrayRotation, viralAdvertising,
    libraryFine, maximizingXor, appendAndDelete,
    equalizeArray, repeatedString, serviceLane

using .MediumModule:
    formingMagicSquare,
    nonDivisibleSubset,
    countSort
export formingMagicSquare, nonDivisibleSubset,
    countSort

using .HardModule:
    matrixRotation
export matrixRotation

end
