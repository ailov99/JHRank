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
    serviceLane,
    jumpingOnClouds
export beautifulDays, findDigits, cutTheSticks,
    circularArrayRotation, viralAdvertising,
    libraryFine, maximizingXor, appendAndDelete,
    equalizeArray, repeatedString, serviceLane,
    jumpingOnClouds

using .MediumModule:
    formingMagicSquare,
    nonDivisibleSubset,
    countSort,
    timeInWords
export formingMagicSquare, nonDivisibleSubset,
    countSort, timeInWords

using .HardModule:
    matrixRotation
export matrixRotation

end
