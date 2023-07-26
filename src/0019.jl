
function z(d, m, y)
    return (d + (floor((13(m + 1)) / 5)) + y + floor(y / 4) - floor(y / 100) +
            floor(y / 400)) % 7
end

s, e = 1901, 2000
ans = 0
for y in s:1:e
    for i in 1:1:12
        ty = y
        if i < 3
            i += 12
            ty -= 1
        end
        if z(1, i, ty) == 1
            global ans += 1
        end
    end
end

println(ans)
