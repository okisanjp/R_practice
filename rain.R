#
# 気象庁サイトからダウンロードした東京都の天気データ
# を使用して色々試してみる
# http://www.data.jma.go.jp/gmd/risk/obsdl/index.php
#

# 予め用意したデータを読み込む
data <- read.csv('weather_tokyo.csv')
# サマリを見てどの列に何のデータが入っているか把握
summary(data)
# 取り敢えず最高気温の最も最大値（5列目が最高気温なので）
max(data[5])
# 任意の行の任意の列を呼び出す （5行目の1列目と5列目）
data[5, c(1, 5)]
# 行指定のところに条件式を書けばSQLぽいことが出来る
# 下記は最高気温が最も高かった日の日付と最高気温
data[data[5] == max(data[5]),c(1,5)]

#
# ある列の中央値
#

# data[5]（最高気温）の中央値をとってみる
median(data[5]) #うまくいかない
# 型を見てみるとlist？
mode(data)
# とりあえず data[5] を maxtemp として入れなおしてみる
maxtemp <- data[5]
mode(maxtemp) # やっぱりlist
# ベクトルや行列でないとmedianの引数に出来ない？
# lapply を使えばリストに対して関数を適用できる
lapply(data[5], median) # 最高気温の中央値が得られた

#
# 平均気温と降水量の関係
#

# 日付、平均気温、 降水量 を rain として作る
rain <- c(data[1],data[2],data[11])
# listのままだとplot出来ないのでunlistメソッドでnumericにする
rain_day <- unlist(rain[1])
rain_temp <- unlist(rain[2])
rain_rain <- unlist(rain[3])
# x:日付 y:気温と降水量
plot.new()
plot(rain_day, rain_temp, ylim=c(0,100))
lines(rain_temp, col="red")
par(new=T)
plot(rain_day, rain_rain, ylim=c(0,100), main="DAY : TEMP & RAIN", xlab="DAY", ylab="")
lines(rain_rain, col="blue")