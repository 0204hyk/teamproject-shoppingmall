# :pushpin: 오노레 쇼핑몰 프로젝트
>스프링을 활용한 남성 수제화 쇼핑몰 프로젝트

http://118.67.135.214:8888/OnoreTeamProject/admin/main

관리자용 계정 ID : admin
</br>
관리자용 계정 PW : 1q2w3e4r!

</br>

## 1. 제작 기간 & 참여 인원
- 2023년 02월 10일 ~ 2023년 03월 28일
- 팀 프로젝트(5명) : 강병천, 강하영, 박성민, 박지영, 조윤지
</br>

## 2. 사용 기술
![사용기술](https://user-images.githubusercontent.com/114713801/226496252-a55c3ce5-4c9b-4da1-9c2d-58bbcb974bbc.png)
</br>

## 3. Usecase Diagram
![image](https://user-images.githubusercontent.com/118063903/218922203-fb179f0b-58ae-49ad-a4a4-7a5bae93c799.png)
</br>

## 4. Story Board
  https://ovenapp.io/view/d8vEawKkOu9QQng588LYe7bLkWTRn3t6/ - 메인 페이지
  https://ovenapp.io/view/BM4d6oB3Z3aQJa47vE3Xh4ChlqFkR2HA/ - 관리자 페이지
</br>

## 5. ERD 
![ERD](https://user-images.githubusercontent.com/114713801/226496272-330dd99d-7f66-4dd2-9799-dd183744835b.png)
</br>

## 6. 기능
<details>
<summary><b>기능 설명</b></summary>
<div markdown="1">

### 6.1. 회원가입, 로그인, 회원정보수정 구현
  - 회원가입 : 아이디 중복확인, 비밀번호 암호화, 정규표현식
  - 로그인 : 비밀번호 복호화, 세션 및 쿠키 저장
  - 아이디/비밀번호 찾기 : 이름, 아이디, 이메일 존재 여부 확인, 임시 비밀번호 생성 후 암호화 및 이메일 전송
  - 회원정보 및 비밀번호 수정 : 이메일/연락처 정규표현식, 신규 비밀번호 암호화
  - 회원탈퇴 : 세션 삭제 및 DB 삭제

### 6.2. 공지사항, 로케이션 구현
  - 로케이션 : 카카오 위치 API 구현 
 
### 6.3. 상품 페이지

### 6.4. 장바구니, 주문 및 결제 구현
  - 장바구니 : 각 계정별 장바구니 페이지, 수량 변경, 상품 개별 주문, 선택 상품 주문, 전체 상품 주문, 선택 상품 삭제, 장바구니 비우기
  - 주문 : 주문자 및 배송지 정보 입력, 쿠폰 할인 및 포인트 할인, 결제 방식 선택
  - 결제 : 결제 API를 활용한 결제, 결제 완료 후 완료 데이터 전송
  - 주문 완료 : 주문한 상품 정보 출력

 ### 6.5. 
 <br>
 
</div>
</details>

</br>

## 7. 프로젝트 진행과정

<br>

