using Base: number_from_hex
include("../ut.jl")

function solve()
    ab = GetAbundant(28123)
    numbers_map = Dict(i => true for i in 1:28123)
    for i in keys(ab)
        for j in keys(ab)
            numbers_map[ j + i ] = false;
        end
    end
    true_keys = [key for (key, value) in numbers_map if value == true]

    return sum(true_keys)
end

solve()
