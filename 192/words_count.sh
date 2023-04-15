#!/bin/bash

# ファイルを1行ずつ読み込んで、単語ごとに出現頻度を集計する
declare -A word_count=()
while read line
do
    # 行を単語に分割する
    words=($line)

    # 単語ごとに出現頻度を集計する
    for word in "${words[@]}"
    do
        # 出現頻度をカウントする
        if [ ${word_count[$word]+_} ]; then
            ((word_count[$word]++))
        else
            word_count[$word]=1
        fi
    done
done < words.txt

# 単語ごとの出現頻度を出力する
for word in "${!word_count[@]}"
do
    echo "$word ${word_count[$word]}"
done | sort -rn -k 2
