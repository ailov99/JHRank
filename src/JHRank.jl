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

    using .AlgorithmsEasyModule:
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
        fairRations,
        bigSorting
    export beautifulDays, findDigits, cutTheSticks,
        circularArrayRotation, viralAdvertising,
        libraryFine, maximizingXor, appendAndDelete,
        equalizeArray, repeatedString, serviceLane,
        jumpingOnClouds, taumBday, kaprekarNumbers,
        squares, chocolateFeast, beautifulTriplets,
        minimumDistance, howManyGames, fairRations,
        bigSorting

    using .AlgorithmsMediumModule:
        formingMagicSquare,
        nonDivisibleSubset,
        countSort,
        timeInWords,
        hackerlandRadioTransmitters,
        organizingContainers
    export formingMagicSquare, nonDivisibleSubset,
        countSort, timeInWords, hackerlandRadioTransmitters,
        organizingContainers

    using .AlgorithmsHardModule:
        matrixRotation
    export matrixRotation

    using .SinglyLinkedListModule:
        SinglyLinkedListNode, SinglyLinkedList,
        push!, print
        
    using .DataStructuresEasyModule:
        rotateLeft,
        deleteNode
    export rotateLeft, deleteNode

    using .MathematicsEasyModule:
        maximumDraws,
        lowestTriangle
    export maximumDraws, lowestTriangle

end # module JHRank
