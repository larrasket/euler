
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

function GetAbundant(L)
    all_sums = Dict{Int, Int}()
    for i = 1 : L
        s = sum(divisors_memoized(i))
        if s > i
            all_sums[i] = s
        end
    end
    return all_sums
end



function getLovelyNumbers(L)
    all_sums = Dict{Int, Int}()
    lovely = []
    for i = 1 : L
        all_sums[i] = sum(divisors_memoized(i))
    end
    all_sums[0] = 0
    for (key, value) in pairs(all_sums)
        v = all_sums[key];
        if v < L && key != value && all_sums[v] == key
            push!(lovely, (v, key))
        end

    end
    return lovely
end

function make_name_loveley(input_str::String,
                          lovely_stuff)
    result = []
    for char in input_str
        if isletter(char)
            index = Int(lowercase(char)) - 96
            if 1 <= index <= length(lovely_stuff)
                append!(result, lovely_stuff[index])
            end
        end
    end

    return result
end


# NERMEEN = "Siham"
# map(x-> x[1]%2 == 0 ? ( x[2], NERMEEN[trunc(Int, x[1]/2)] ) : x[2] , enumerate(
#     make_name_loveley(NERMEEN, getLovelyNumbers(90000))))

# sum(make_name_loveley(NERMEEN, getLovelyNumbers(90000)))
