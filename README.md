# Chrome Profiles

Alfred 키워드 `cp` 로 Chrome 프로필을 전환한다.

- 목록: `~/Library/Application Support/Google/Chrome/Local State` 의 `profile.info_cache`
- 열기: `open -na 'Google Chrome' --args --profile-directory=<dir>`
- 필요한 것: macOS 기본 `jq` (`/usr/bin/jq`). 그 외 설치 불필요.
