#!/bin/zsh
# Chrome 프로필 목록 (Chrome 실행 여부와 무관). 필터링은 Alfred 가 한다.
STATE="$HOME/Library/Application Support/Google/Chrome/Local State"

/usr/bin/jq '{items: [.profile.info_cache | to_entries[] | {
  uid: .key,
  title: .value.name,
  subtitle: "\(.value.user_name // "")  (\(.key))",
  arg: .key,
  autocomplete: .value.name
}]}' "$STATE"
