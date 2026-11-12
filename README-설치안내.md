# 위고 프로젝트관리 — 휴대폰 웹앱 + 클라우드 동기화 설치 안내

이 폴더(`web`)를 인터넷에 올리면 휴대폰·맥·어느 브라우저에서나 같은 주소로 접속해 쓸 수 있고,
데이터는 Supabase(무료)에 저장되어 모든 기기에서 동기화됩니다.

## 1. Supabase 준비 (5분, 한 번만)
1. https://supabase.com 에서 가입 → **New project** (이름 아무거나, 리전 Northeast Asia(Seoul) 권장, DB 비밀번호는 보관).
2. 왼쪽 메뉴 **SQL Editor** → New query → 이 폴더의 `supabase_setup.sql` 내용을 붙여넣고 **Run**.
3. 왼쪽 메뉴 **Authentication → Providers → Email**: `Confirm email` 을 **끄기**(OFF) 하고 Save.
   (끄지 않으면 회원가입 후 메일의 확인 링크를 눌러야 로그인됩니다.)
4. **Project Settings → API** 에서 다음 두 가지를 복사해 둡니다.
   - Project URL (예: https://abcdxyz.supabase.co)
   - anon public 키 (eyJ... 로 시작하는 긴 문자열)

## 2. 웹 호스팅 (GitHub Pages 기준, 무료)
1. https://github.com 가입 → 오른쪽 위 + → **New repository**, 이름 예: `wego-pm`, Public, Create.
2. 저장소 페이지에서 **Add file → Upload files** → 이 `web` 폴더 안의 파일 전부(index.html, sw.js, manifest.webmanifest, icon-*.png) 를 끌어다 놓고 Commit.
3. 저장소 **Settings → Pages** → Source: `Deploy from a branch`, Branch: `main` / `(root)` → Save.
4. 1~2분 뒤 `https://<깃허브아이디>.github.io/wego-pm/` 주소가 열립니다.
   (Netlify, Vercel, 회사 서버 등 다른 호스팅도 같은 파일을 올리면 됩니다.)

## 3. 휴대폰에 앱으로 설치
- **아이폰**: Safari로 위 주소 접속 → 공유(⎙) → **홈 화면에 추가**.
- **안드로이드**: Chrome으로 접속 → ⋮ 메뉴 → **홈 화면에 추가** 또는 **앱 설치**.
- 홈 화면의 아이콘으로 열면 전체 화면 앱처럼 동작하고, 오프라인에서도 열립니다.

## 4. 동기화 연결 (각 기기에서 한 번)
- 앱 왼쪽 메뉴 **클라우드 동기화** → Supabase URL과 anon 키 입력 → 이메일·비밀번호로 **회원가입**(처음 한 번) 또는 **로그인**(다른 기기).
- 맥 앱에서 먼저 로그인하면 맥의 데이터가 클라우드에 올라가고, 휴대폰에서 같은 계정으로 로그인하면 그 데이터를 내려받습니다.
- 이후에는 어디서 입력하든 몇 초 안에 자동으로 올라가고, 다른 기기는 30초마다 또는 앱을 다시 열 때 내려받습니다.

## 5. 갱신
- 화면/기능이 바뀐 새 `index.html` 을 받으면 같은 저장소에 다시 올리면 됩니다. 데이터는 Supabase에 있으므로 영향 없습니다.
