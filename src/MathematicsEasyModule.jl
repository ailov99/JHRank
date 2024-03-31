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

end # module MathematicsEasyModule