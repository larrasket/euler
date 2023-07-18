mp = Dict(2 => 2, 1 => 1)
function collatz_len(c)
    l = 1
    b = c
    if c == 2
        return 2
    end
    while c != 2
        c = c % 2 == 0 ? c / 2 : 3c + 1
        if haskey(mp, c)
            l += mp[c]
            break
        else
            l += 1
        end
    end
    mp[b] = l
    return l
end


function solve()
    ml, ans = -1, 1
    for i in 3:1:1e6
        l = collatz_len(i)
        if l > ml
            ml = l
            ans = i
        end
    end
    return ans
end

solve()
