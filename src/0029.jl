function solve()
    function distinct_powers(lower::Int, upper::Int)
        powers = Set{BigInt}()
        for a in lower:upper
            for b in lower:upper
                push!(powers, BigInt(a)^BigInt(b))
            end
        end
        return length(powers)
    end
    lower, upper = 2, 100
    distinct_powers(lower, upper)
end
