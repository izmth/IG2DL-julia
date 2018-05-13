function formatneuron(X, W, h)
    sum = 0
    for (x, w) in zip(X, W)
        sum += x*w
    end

    if sum > h
        return 1
    end
    return 0
end


function perceptron(𝕏, R, α, n)
    W = rand(2) #ランダムでパラメータを決定
    h = rand() #ランダムでバイアスを決定
    for i in 1:n
        Y = [formatneuron(X, W, h) for X in 𝕏] #結果の取得
        #println("epoch $i, $(R-Y)")
        for (y, r, X) in zip(Y, R, 𝕏)
            for j in 1:length(X)
                W[j] += α * (r - y) * X[j]
                h -= α * (r - y)
            end
        end

        if i==n
            return [formatneuron(X, W, h) for X in 𝕏]
        #else
            #println("epoch $i, $W, $h")
        end
    end
end


# 入力データ
𝕏 = [[i, j] for i in 0:1 for j in 0:1]

# 教師データの作成
R_or = [formatneuron(X, [1, 1], 0.5) for X in 𝕏]
R_and = [formatneuron(X, [1, 1], 1.5) for X in 𝕏]
println("Train OR: $R_or")
println("Train AND: $R_and")

# 学習
result_or = perceptron(𝕏, R_or, 0.1, 100)
result_and = perceptron(𝕏, R_and, 0.1, 100)
println("Test OR: $result_or")
println("Test AND: $result_and")