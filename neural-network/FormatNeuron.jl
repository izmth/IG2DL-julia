function formatneuron(X, W, h)
    sum = 0
    for (x, w) in zip(X, W)
        sum += x*w
    end

    if sum > h
        return 1
    else
        return 0
    end
end


NOT = [formatneuron(i, -2, -1) for i in 0:1]

𝕏 = [[i, j] for i in 0:1 for j in 0:1]
OR = [formatneuron(X, [1, 1], 0.5) for X in 𝕏]
AND = [formatneuron(X, [1, 1], 1.5) for X in 𝕏]


println("NOT: $NOT")
println("OR: $OR")
println("AND: $AND")