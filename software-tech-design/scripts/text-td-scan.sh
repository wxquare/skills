#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "usage: $0 <text-file>" >&2
  exit 1
fi

file="$1"
if [ ! -f "$file" ]; then
  echo "ERROR missing file: $file" >&2
  exit 1
fi

echo "FILE $file"
echo "PARAGRAPH_SIGNALS"
awk '
  BEGIN { RS="" }
  {
    text=$0
    gsub(/\n+/, " ", text)
    lower=tolower(text)
    english_match = (lower ~ /(background|objective|goal|scope|non-goal|problem|decision|tradeoff|risk|rollback|dependency|assumption|open question|timeline|owner)/)
    chinese_match = (text ~ /(背景|目标|范围|非目标|问题|决策|权衡|风险|回滚|依赖|假设|开放问题|时间线|负责人)/)
    if (english_match || chinese_match) {
      print "---"
      print text
    }
  }
' "$file"

echo "KEYWORD_COUNTS"
for keyword in background objective scope "non-goal" problem decision tradeoff risk rollback dependency assumption owner timeline "背景" "目标" "范围" "非目标" "问题" "决策" "权衡" "负责人" "开放问题"; do
  count="$(awk -v kw="$keyword" 'BEGIN{c=0} index(tolower($0), tolower(kw)){c++} END{print c}' "$file")"
  echo "$keyword=$count"
done
