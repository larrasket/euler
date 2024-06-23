
const factor_count_cache = Dict{Int, Int}()

"""
Returns the devisors of a number.
"""
function count_factors_memoized(initial_n)
    if haskey(factor_count_cache, initial_n)
        return factor_count_cache[initial_n]
    end

    n = initial_n
    num_factors = 1

    for i = 2:isqrt(initial_n)
        power = 0
        while n % i == 0
            n = n ÷ i
            power += 1
        end
        num_factors *= (power + 1)
    end

    if n > 1
        num_factors *= 2
    end
    factor_count_cache[initial_n] = num_factors

    return num_factors
end

memo = Dict{Int, Vector{Int}}()
function divisors_memoized(n)

    function _divisors(k)
        if k in keys(memo)
            return memo[k]
        end

        divs = Int[]
        for i in 1:isqrt(k)
            if k % i == 0
                push!(divs, i)
                if i != k ÷ i
                    push!(divs, k ÷ i)
                end
            end
        end
        sort!(divs)
        memo[k] = divs
        return divs
    end

    divisors = _divisors(n)
    filter(x -> x != n, divisors)
end
