# clipboardの内容を読み込む
# 先にクリップボードにコピーしておいてから実行

# for mac
x = scan(pipe("pbpaste"))
x
#for windows
x = scan("clipboard")
x

# ベクトルとして読み込むだけなのかな？