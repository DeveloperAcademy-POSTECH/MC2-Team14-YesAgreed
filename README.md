# 🎪🎭 뮤꾸 Mukku 📱⌚️

<div align="center">
<br />
    <img src ="https://github.com/DeveloperAcademy-POSTECH/MC2-Team14-YesAgreed/assets/91946571/db6d75c2-a835-4bc0-8aa9-74838798f3a8" width="300px" />
    <h3></h3>
    <br />
    <h3> 뮤지컬 덕후가 위젯과 다이나믹 아일랜드를 활용해서 아이폰 화면을 꾸밀 수 있는 앱 </h3>
    <p align="center">
<br />

</p>
</div>


## 🎭 팀원 소개

```
🍎 애플 디벨로퍼 아카데미 2기 MC2 YES, 인정
```


| [강다은](https://github.com/dmajorcode)                                                                                    | [김민지](https://github.com/polyapple)                                                                                        | [김혜린](https://github.com/hyelinkim)                                                                                      | [노기현](https://github.com/Yeom-JinHo)                                                                                     | [문서희](https://github.com/seohmoon)                                                                                  | [윤재호](https://github.com/Medi0202)                                                                                             |
|:-----------------------------------------------------------------------------------------------------------------------:|:------------------------------------------------------------------------------------------------------------------------:|:------------------------------------------------------------------------------------------------------------------------:|:------------------------------------------------------------------------------------------------------------------------:|:----------------------------------------------------------------------------------------------------------------------:|:-------------------------------------------------------------------------------------------------------------------------------:|
| <img src="https://avatars.githubusercontent.com/u/91581474?v=4" width="100"/> | <img src="https://avatars.githubusercontent.com/u/127734682?v=4" width ="100"/> | <img src="https://avatars.githubusercontent.com/u/131835522?v=4" width ="100"/> | <img src="https://avatars.githubusercontent.com/u/69492686?v=4" width ="100"/> | <img src="https://avatars.githubusercontent.com/u/91946571?v=4" width="100"> | <img src="https://avatars.githubusercontent.com/u/115053126?v=4" width ="100"/> |
| Tech                                                                                                                      | Design                                                                                                                       | Domain                                                                                                                       | Tech                                                                                                                       | Tech                                                                                                                     | Tech                                                                                                                              |

<br />
<br />

## 🎪 프로젝트 소개

- Mukku 는 위젯과 다이나믹 아일랜드를 활용해서 아이폰 화면을 꾸밀 수 있는 서비스 입니다.
- 사용자가 원하는 뮤지컬 아이콘을 선택시, 위젯과 다이나믹 아일랜드에서 선택한 아이콘을 보여줍니다.
- 다양한 배경 화면을 제공하여 위젯 배경화면을 사용자 선택에 따라 바꿔줍니다.

<br />
<br />

## 1. 🛠️ 기술 스택
<div>
<img src="https://img.shields.io/badge/swift-F05138?style=for-the-badge&logo=swift&logoColor=white">
<img src="https://img.shields.io/badge/swiftUI-F05138?style=for-the-badge&logo=swift&logoColor=white">
<img src="https://img.shields.io/badge/Xcode-147EFB?style=for-the-badge&logo=xcode&logoColor=white">
<img src="https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white">
<div>

## 2. 📂 파일 구조

<br />

```text
  Mukku
    ├── Localizable                          # 다국어 적용
    ├── Mukku                                # 앱
    │     ├── Utils                          # 위젯 배경 이미지 관련
    │     ├── Model                          # 뮤지컬 데이터 관련
    │     │      └── ...
    │     ├── View                           # 앱 화면 관련
    │     │      └── ...
    │     ├── Preview Content                # 미리보기
    │     │      └── ...
    ├── MukkuWidgets                         # 위젯
    │     ├── LiveActivity                   # 다이나믹 아일랜드 관련
    │     ├── HomeWidgets                    # 홈 위젯 관련
    │     ├── LockScreenWidgets              # 다이나믹 아일랜드 관련
    ├── MukkuWatch Watch App                 # 워치 큰 화면
    │     ├── Preview Content                # 미리보기
    │     │      └── ...
    ├── MukkuWatchExtension                  # 워치 작은 화면
    │     ├── WatchView                      # 워치 화면 관련
    │     │      └── ...
    └── Frameworks                           
          └── ...
```


<br />


## 3. ✏️ 규칙

<br />

  ### 코딩 컨벤션

  [Swift API Design Guidelines](https://cozzin.gitbook.io/swift-api-design-guidelines/) 에 따라 작성하였습니다. 

<br />

### commit 메시지 규칙

| type | Emoji | Emoji Name | Description | Example |
| --- | --- | --- | --- | --- |
| feat | ✨ | :sparkles: | 새로운 기능 추가, 구현 | ✨ feat : 로그인 기능 구현 |
| edit | ✏️ | :pencil2: | 단순 오타 수정 | ✏️ edit : 로그인 캐시 처리 방식 수정 |
| style | 💄 | :lipstick: | UI작업, 스타일 관련 파일 추가 및 수정 | 💄 style : 폰트 등록 |
| add | 🍱 | :bento: | asset 파일(이미지, 아이콘 등) 추가 | 🍱 add : 위젯 이미지 추가 |
| chore | 🚚 | :truck: | 파일, 경로를 옮기거나 이름 변경 | 🚚 chore : feet -> feat 이름 변경 |
| merge | 🔀 | :twisted\_rightwards\_arrows: | 브랜치 병합(merge) | 🔀 merge : feat-kihyun → main 브랜치 병합 |
| fix | 🐛 | :bug: | 버그 픽스 | 🐛 fix : Color 버그 수정 |
| docs | 📝 | :memo: | 문서 작업 | 📝 docs : Readme 작성 |
| refactor | ♻️ | :recycle: | 코드 리팩토링 | ♻️ refactor : 변수명 수정 |
| model | 🗃️ | :card\_file\_box: | 데이터베이스(모델) 작업 | 🗃️ model : 데이터 모델 생성 |
| init | 🎉 | :tada: | 프로젝트 생성 | 🎉 init : 프로젝트 생성 |
| 빌드관련 |   |   |   |   |
| build | 🔨 | :hammer: | 재빌드 | 🔨 build: 동일버전 재빌드(x.xx) |
| version | 🏗️ | :building construction: | 버전 업 | 🏗️ version : 버전 업 |


<br />

<br />

## 4. 📂 기능 구현

### 위젯

<br />


- 홈 위젯
  <div>
<img src="https://github.com/DeveloperAcademy-POSTECH/MC2-Team14-YesAgreed/assets/91946571/c301a26b-171e-450b-88bc-6f8e13a7cf63" width="300px" />
<div>

<br />

## 5. 📹 프로젝트 소개 영상

<br />
   
[![Video Label](http://img.youtube.com/vi/CwdsGAYcoGM/0.jpg)](https://youtu.be/CwdsGAYcoGM)

<br />

## 6. ✈️ TestFlight 링크

<br />

<a href="https://testflight.apple.com/join/GSxeRGAH">
  <img src="https://github.com/DeveloperAcademy-POSTECH/MC2-Team14-YesAgreed/assets/69492686/ab557e9f-d26e-49ae-a0d8-953edb6e2235" width = "200px">
</a>

<br />