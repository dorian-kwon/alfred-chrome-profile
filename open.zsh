#!/bin/zsh
# 해당 프로필 창이 이미 있으면 앞으로 가져오고, 없으면 새로 연다.
# 창 제목이 "<탭 제목> - Chrome - <프로필 라벨>" 형태라, 라벨이 프로필 이름이거나 "(프로필 이름)" 으로 끝나는 창을 찾는다.
STATE="$HOME/Library/Application Support/Google/Chrome/Local State"
dir="$1"
name=$(/usr/bin/jq -r --arg d "$dir" '.profile.info_cache[$d].name // empty' "$STATE")

if [[ -n $name ]] && pgrep -x "Google Chrome" >/dev/null; then
  found=$(/usr/bin/osascript -l JavaScript - "$name" 2>/dev/null <<'JXA'
function run(argv) {
  const name = argv[0];
  const chrome = Application('System Events').processes.byName('Google Chrome');
  const titles = chrome.windows.name();
  for (let i = 0; i < titles.length; i++) {
    const parts = String(titles[i]).split(/ - (?:Google )?Chrome - /);
    if (parts.length < 2) continue;
    const label = parts[parts.length - 1];
    if (label === name || label.endsWith('(' + name + ')')) {
      const w = chrome.windows[i];
      try { w.attributes.byName('AXMinimized').value = false; } catch (e) {}
      w.actions.byName('AXRaise').perform();
      chrome.frontmost = true;
      return 'found';
    }
  }
  return '';
}
JXA
)
  [[ $found == found ]] && exit 0
fi

open -na 'Google Chrome' --args --profile-directory="$dir"
