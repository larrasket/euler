include("../ut.jl")

function digital_factorial()
    sum = 0;
    d = 1;
    while true
        nsum = 0;
        ar = number_to_array(d)
        for i in ar
            nsum += factorial(BigInt(ar))
        end
    end
    return sum;
end
