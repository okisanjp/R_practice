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