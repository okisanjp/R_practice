#
# ベクトル
#

# 1 から 10 まで 1ずつ増加
1:10
# 10 から -10 まで -1ずつ増加
10:-10
# 1 から 20 までを 6等分したベクトル
seq(1, 20, length=6)

#
# 行列
#

# 縦2、横3の行列に 1 - 6 までのデータを入れる
x <- matrix(1:6, nrow=2, ncol=3)
x
# 縦2、横3の行列に 1 - 7 までのデータを入れる
x <- matrix(1:7, nrow=2, ncol=3)
x
# 縦2、横3の行列に 任意のデータを入れる
x <- matrix(c(1,5,6,10,4,2), nrow=2, ncol=3)
x
# 行列の形をあとから変える
x <- matrix(1:12, nrow=2, ncol=6)
x
dim(x) <- c(4,3)
x

#
# 配列
#

# 1 - 100までの数値を配列に入れる
x <- array(1:100)
print(x)

# 1 - 100 までの数値を 縦5 横20 の形の配列に入れる
y <- array(1:100, c(5,20))
print(y)

# 1 - 100 までの数値を 縦5 横10 奥行き？2 の形の配列に入れる
z <- array(1:150, c(5,10,3))
print(z)

#
# 平均、分散、標準偏差
#

x <- c(5,10,15,5,8,12,48,3,29,50,300)
y <- c(40,30,34,20,34,44,30,29,54,22)

# 平均
mean(x)
mean(y)
# 分散
var(x)3:6
var(y)
# 標準偏差
sd(x)
sd(y)
# 一括で表示
summary(x)
summary(y)

#
# データの丸め
#

# 定価
p1 = c(1000,2000,2480)
# 売価
p2 = c(880,1180,999)
# 割引率
p3 = (1 - (p2 / p1)) * 100
p3
# 少数点なしに丸める
round(p3)
# 小数点以下2桁まで丸める
round(p3,2)