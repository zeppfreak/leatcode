#!/bin/bash

# ファイルを1行ずつ読み込んで、単語ごとに出現頻度を集計する
declare -a words
declare -a word_count
while read line
do
    # 行を単語に分割する
    words=($line)

    # 単語ごとに出現頻度を集計する
    for word in "${words[@]}"
    do
        # 大文字を小文字に変換する
        word_lower=$(echo $word | tr '[:upper:]' '[:lower:]')

        # 単語の先頭と末尾の記号を削除する
        word_clean=$(echo $word_lower | sed -e 's/^[[:punct:]]\+//' -e 's/[[:punct:]]\+$//')

        # 出現頻度をカウントする
        found=0
        for ((i=0; i<${#word_count[@]}; i+=2))
        do
            if [[ ${word_count[$i]} == $word_clean ]]; then
                ((word_count[$i+1]++))
                found=1
                break
            fi
        done
        if [ $found -eq 0 ]; then
            word_count+=($word_clean 1)
        fi
    done
done < words.txt

# 単語ごとの出現頻度を出力する
for ((i=0; i<${#word_count[@]}; i+=2))
do
    echo "${word_count[$i]}: ${word_count[$i+1]}"
done | sort -rn -k 2

