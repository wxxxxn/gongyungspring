![asdfasdf](https://user-images.githubusercontent.com/119999556/227833610-0e89c509-ca77-4bb1-9a42-b3453f4c7fa9.png)

# 🚘 Spring-Gongyung

**기존의 주유소 가격 비교 웹서비스 gongyung을 Spring Framework로 마이그레이션**

- Spring Framework + Javascript 크롤링 _ 주유소 가격 비교 웹서비스

## 💡 프로젝트 소개

높아지는 물가에 따라 발생되는 주유의 문제.부산지역의 나의 주유 (가격) 스타일과 상대적으로 저렴한 주유소에서 주유를 도와주는 웹서비스 (예 : opinet)

## ⌛ 개발 기간

- 23.03. ~ 진행중

### ⚙ 개발 환경

- `Java 8`
- `JDK 1.8.0`
- **IDE** : STS 3.9
- **Framework** : Spring Framework
- **Server** : Apache Tomcat 9.0
- **Database** : MySQL

### 💻 실행 환경

- Apache Tomcat 9.0

## 📌 주요기능

- 로그인/로그아웃/회원가입 기능
- 지도 사용을 위해 api를 이용. 다양한 샘플과 가이드를 제공해주기 때문에 카카오맵 api 사용
- 지도 확대/축소 기능
- (고정된) 현재위치 표시 기능
- 부산 지역의 주유소/ 주차장 위치 표시 기능
- 시/군/구, 읍/면/동 조회를 이용해 그 지역의 주유소 조회 기능
- 주유소 선택 시 주유가격, 순위, 일주일 가격 그래프 표시 기능
- **Servlet 구현 코드를 spring framework로 마이그레이션 중**

## 🌟 담당업무

- 프론트100%

- 콤보박스
    
    ![asfdsfda](https://user-images.githubusercontent.com/119999556/227833631-bc8da753-99ec-439a-839b-40170c102183.png)

    
- 해당 구에 대한 동을 보여줌
- 조회 기능 및 사이드바 구현

![asd (1)](https://user-images.githubusercontent.com/119999556/227833902-f4e04aa5-e08a-4670-8d7b-e1a48fb2af62.png)

- 해당 주유소 클릭시 사이드바 오픈 및 유가정보
- 현재위치

 ![sfdfasdsfdadfas](https://user-images.githubusercontent.com/119999556/227833859-6143637a-4037-44ca-8f9e-39544fe451d2.png)

- 현재 위치의 좌표값을 가져와 마커 출력
- 다양한 이미지 마커 표시
    
 ![화면 캡처 2023-03-24 105919](https://user-images.githubusercontent.com/119999556/227833981-cef59e90-4d73-4928-9e79-e8fa068dde7d.png)

- 크롤링한 주유소의 좌표값을 가져와 마커표시
