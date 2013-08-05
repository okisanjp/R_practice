#
# 人口動態総覧,都道府県(20大都市再掲)別 
# http://www.e-stat.go.jp/SG1/estat/GL08020103.do?_csvDownload_&fileId=000005945225&releaseCount=3
#

# データの読み込み
jinko = read.csv("./data/jinko1.csv")

# とりあえずデータをみてみる
jinko

# 県名、出生数、死亡数だけのデータにする
j = jinko[ , c(1, 2, 4)]
j
# 48番目移行は今回使わない（４７都道府県だけで良い）ので消す
j.47 = j[1:47,]
# 出生率に対する死亡率を増減係数として追加してみる
j.47["増減係数"] = c(j.47$出生数/j.47$死亡数) # エラーになって計算できなかった
# str()で見てみる
str(j.47)
# factorを数値にしてから再チャレンジ
j.47["増減係数"] = c(as.numeric(as.character(j.47$出生数))/j.47$死亡数) # でけた
  # as.characterを先に通さないと、実際の値を変換対象にすることができない
head(j.47)
# 増減係数が１以上のものを抜き出してみる
j.47[j.47$増減係数 >= 1,] # 沖縄優秀
# 増減係数あれこれ
jx = j.47$増減係数
mean(jx) # 平均
median(jx) # 中央値
max(jx) # 最大
min(jx) # 最小
# 全部これで見れるけど
summary(jx)

#
# 離婚との関係
#

j = jinko[ , c(1, 2, 4, 15)]
j.47 = j[1:47,]
j.47["増減係数"] = c(as.numeric(as.character(j.47$出生数))/j.47$死亡数)
# 増減係数の大きい順に並べ替えてみる
head(j.47)
sortcond = order(j.47$増減係数, decreasing=T) # まずorderで条件を作り
j.47.sorted = j.47[sortcond,] # その条件でデータにアクセスする
# グラフで見てみる
plot.new()
plot(j.47.sorted$増減係数,type="l",col="red",xlab="",ylab="")
par(new=T)
barplot(as.numeric(as.character(j.47.sorted$離婚件数)),col="lightblue",main="zougen : rikon",xlab="",ylab="",axes=F)
axis(side=4)