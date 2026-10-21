# Chrome Profiles

Alfred 키워드 `cp` 로 Chrome 프로필을 전환한다.

- 목록: `~/Library/Application Support/Google/Chrome/Local State` 의 `profile.info_cache`
- 열기: `open -na 'Google Chrome' --args --profile-directory=<dir>`
- 필요한 것: macOS 기본 `jq` (`/usr/bin/jq`). 그 외 설치 불필요.
- 이미 열린 프로필 창이 있으면 새로 열지 않고 앞으로 가져온다 (`open.zsh`). 창 목록을 읽으므로 Alfred 에 접근성 권한이 필요하며, 없으면 새 창으로 열린다.
