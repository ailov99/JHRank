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
    appendAndDelete
export beautifulDays, findDigits, cutTheSticks,
    circularArrayRotation, viralAdvertising,
    libraryFine, maximizingXor, appendAndDelete

using .MediumModule:
    formingMagicSquare
export formingMagicSquare

using .HardModule:
    matrixRotation
export matrixRotation

end
