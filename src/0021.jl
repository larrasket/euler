include("../ut.jl")
LIMIT = 10000 - 1

function solve()
    ans = 0
    all_sums = Dict{Int, Int}()
    for i = 1 : LIMIT
        all_sums[i] = sum(divisors_memoized(i))
    end
    all_sums[0] = 0
    for (key, value) in pairs(all_sums)
        v = all_sums[key];
        if v < LIMIT && key != value && all_sums[v] == key
            ans += value
        end

    end
    return ans
end
