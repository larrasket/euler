include("../ut.jl")

function solve()
    limit = 999
    longest = 0
    longest_length = -1
    for i in 1:limit
        l = length(find_longest_repeating_substring(string(get_numbers_after_period(1/i))))
        if l > longest_length
            longest_length = l
            longest = i
        end
    end
    longest
end

solve()
