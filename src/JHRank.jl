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
    jumpingOnClouds,
    taumBday,
    kaprekarNumbers,
    squares,
    chocolateFeast,
    beautifulTriplets,
    minimumDistance,
    howManyGames,
    fairRations
export beautifulDays, findDigits, cutTheSticks,
    circularArrayRotation, viralAdvertising,
    libraryFine, maximizingXor, appendAndDelete,
    equalizeArray, repeatedString, serviceLane,
    jumpingOnClouds, taumBday, kaprekarNumbers,
    squares, chocolateFeast, beautifulTriplets,
    minimumDistance, howManyGames, fairRations

using .MediumModule:
    formingMagicSquare,
    nonDivisibleSubset,
    countSort,
    timeInWords,
    hackerlandRadioTransmitters,
    organizingContainers
export formingMagicSquare, nonDivisibleSubset,
    countSort, timeInWords, hackerlandRadioTransmitters,
    organizingContainers

using .HardModule:
    matrixRotation
export matrixRotation

end
