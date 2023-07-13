function tao(n)
    count = 0
    sq = sqrt(n)

    i = 1
    while i <= sq
        if n % i == 0
            count += 2
        end
        i += 1
    end

    if sq * sq == n
        count -= 1
    end

    return count
end


function solve()
    i, n, t = 1, tao(1), 1
    while n < 500
        i += t
        t += 1
        n = tao(i - 1)
    end
    return i - 1
end

solve()
