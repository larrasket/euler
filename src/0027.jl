using Primes
include("../ut.jl")

function solve()
    max_primes = 0
    product_of_coefficients = 0

    for a in -999:999
        for b in -1000:1000
            num_primes = count_primes(a, b)
            if num_primes > max_primes
                max_primes = num_primes
                product_of_coefficients = a * b
            end
        end
    end
end

function count_primes(a, b)
    n = 0
    while isprime(n^2 + a * n + b)
        n += 1
    end
    return n
end
