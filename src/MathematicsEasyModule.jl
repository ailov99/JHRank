"""
    MathematicsEasyModule

Module containing "easy" tier mathematics questions from HackerRank
"""

module MathematicsEasyModule

    __precompile__(true)

    """
        maximumDraws(n)

    A person is getting ready to leave and needs a pair of matching socks. If there are `n`
    colors of socks in the drawer, how many socks need to be removed to be certain of having a matching pair?

    # Arguments
    - `n` = number of colours of socks in the drawer

    # Output
    How many socks need to be pulled out to guarantee a matching pair?
    """
    function maximumDraws(n)
        # Worse case = n draws of different colour
        (n+1)
    end

    """
        lowestTriangle(trianglebase, area)

    Given integers `trianglebase` and `area`, find the smallest integer `h`, such that there exists a triangle of height `h`,
    base `trianglebase`, having an area of at least `area`.

    # Arguments
    - `trianglebase` = Base of the triangle
    - `area` = Minimum area of the triangle

    # Output
    Minimum height of such a triangle (Integer)
    """
    function lowestTriangle(trianglebase, area)
        # area = h*b/2
        # 2*area/b = h
        ceil(Int, 2*area/trianglebase)
    end

    """
        gameWithCells(n, m)

    Luke is daydreaming in Math class. He has a sheet of graph paper with `n` rows and `m` columns, and he imagines that there is 
    an army base in each cell for a total of `n * m` bases. He wants to drop supplies at strategic points on the sheet, marking each 
    drop point with a red dot. If a base contains at least one package inside or on top of its border fence, then it's considered to be supplied.

    Given `n` and `m`, what's the minimum number of packages that Luke must drop to supply all of his bases?

    # Arguments
    - `n` = number of rows in the grid
    - `m` = number of columns in the grid

    # Output
    Minimum number of red dots that need placing on the grid edges to cover all cells
    """
    function gameWithCells(n, m)
        # Optimal way to "cover" the grid is placing a dot in the centre of a 2x2 box in the grid
        # so we ought to count the number of 2x2 boxes in the grid (including 2x1 / 1x2 "half-boxes" so round up)
        row_pairs = ceil(Int, n/2)
        col_pairs = ceil(Int, m/2)
        row_pairs * col_pairs
    end

    """
        handshake(n)

    At the annual meeting of Board of Directors of Acme Inc. If everyone attending shakes hands exactly one time with 
    every other attendee, how many handshakes are there?

    # Arguments
    - `n` = number of people at the meeting

    # Output
    How many handshakes were there if everyone shook everyone's hand?
    """
    function handshake(n)
        # Base cases
        (n < 2) && return 0
        
        # C = n! / r!(n - r)!
        # Note that Julia's factorial() uses a lookup table so wrap
        # argument in big() in case it overflows
        # Also round() to avoid accumulating errors. Result ought to be
        # convertible to a BigInt
        r = 2
        numerator = round(factorial(big(n)))
        denominator = factorial(r)*round(factorial(big(n - r)))
        BigInt(round(numerator/denominator))
    end

end # module MathematicsEasyModule