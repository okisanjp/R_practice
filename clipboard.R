# clipboardの内容を読み込む
# 先にクリップボードにコピーしておいてから実行

# 1 2 3 4 5 のようなデータ
# for mac
x = scan(pipe("pbpaste"))
x
#for windows
x = scan("clipboard")
x

# item price
# りんご 100
# みかん 80
# もも 120
#
# のようなテーブル形式のテキスト

# for mac
x = read.table(pipe("pbpaste"),header=T)
x
#for windows
x = read.table("clipboard",header=T)
x