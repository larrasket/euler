using Base: number_from_hex

# see https://stackoverflow.com/a/2844920
const factor_count_cache = Dict{Int, Int}()
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

const memo = Dict{Int, Vector{Int}}()
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

function get_numbers_after_period(x::Float64; precision::Int=256)
    setprecision(precision) do
        big_x = BigFloat(x)
        str = string(big_x)
        parts = split(str, ".")
        return length(parts) > 1 ? parts[2] : ""
    end
end

function find_longest_repeating_substring(s::String)
    n = length(s)
    longest_repeating = ""

    for len in 1:n-1
        for i in 1:n-len
            substring = s[i:i+len-1]
            if occursin(substring, s[i+len:end])
                if length(substring) > length(longest_repeating)
                    longest_repeating = substring
                end
            end
        end
    end

    return longest_repeating
end

function sieve_of_eratosthenes(limit)
    is_prime = trues(limit)
    is_prime[1] = false  # 1 is not a prime number

    for i in 2:sqrt(limit)
        if is_prime[i]
            for j in i^2:i:limit
                is_prime[j] = false
            end
        end
    end

    primes = []
    for i in 2:limit
        if is_prime[i]
            push!(primes, i)
        end
    end

    return primes
end

function number_to_array(num::Integer)
    return [parse(Int, d) for d in string(abs(num))]
end

# NERMEEN = "Siham"
# map(x-> x[1]%2 == 0 ? ( x[2], NERMEEN[trunc(Int, x[1]/2)] ) : x[2] , enumerate(
#     make_name_loveley(NERMEEN, getLovelyNumbers(90000))))

# sum(make_name_loveley(NERMEEN, getLovelyNumbers(90000)))
