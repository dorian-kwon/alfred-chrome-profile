#!/bin/zsh
# Alfred 에 임포트된 워크플로우 <-> 이 저장소 동기화
# 사용: ./sync.sh pull  (Alfred -> repo)   ./sync.sh push  (repo -> Alfred)   ./sync.sh pack  (.alfredworkflow 생성)
UID_DIR="user.workflow.6B0520A9-E6AD-486F-A58F-FB815C4B2531"
FILES=(filter.zsh open.zsh icon.png info.plist README.md)

# Alfred 설정 폴더: 동기화 폴더를 지정했으면 그쪽, 아니면 기본 위치
SYNC=$(defaults read com.runningwithcrayons.Alfred-Preferences syncfolder 2>/dev/null)
SYNC=${SYNC/#\~/$HOME}
PREFS="${SYNC:-$HOME/Library/Application Support/Alfred}/Alfred.alfredpreferences"
W="$PREFS/workflows/$UID_DIR"

cd "${0:A:h}"
case "$1" in
  pull) for f in $FILES; do cp "$W/$f" . ; done ;;
  push) mkdir -p "$W" && for f in $FILES; do cp "$f" "$W/" ; done ;;
  pack) rm -f "Chrome Profiles.alfredworkflow" && zip -q "Chrome Profiles.alfredworkflow" $FILES && echo "Chrome Profiles.alfredworkflow" ;;
  *) echo "usage: $0 pull|push|pack"; exit 1 ;;
esac
