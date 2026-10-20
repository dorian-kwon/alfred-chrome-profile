#!/bin/zsh
# Alfred 에 임포트된 워크플로우 <-> 이 저장소 동기화
# 사용: ./sync.sh pull  (Alfred -> repo)   ./sync.sh push  (repo -> Alfred)   ./sync.sh pack  (.alfredworkflow 생성)
W="$HOME/Library/Application Support/Alfred/Alfred.alfredpreferences/workflows/user.workflow.6B0520A9-E6AD-486F-A58F-FB815C4B2531"
FILES=(filter.zsh icon.png info.plist README.md)
cd "${0:A:h}"
case "$1" in
  pull) for f in $FILES; do cp "$W/$f" . ; done ;;
  push) for f in $FILES; do cp "$f" "$W/" ; done ;;
  pack) zip -q "Chrome Profiles.alfredworkflow" $FILES && echo "Chrome Profiles.alfredworkflow" ;;
  *) echo "usage: $0 pull|push|pack"; exit 1 ;;
esac
