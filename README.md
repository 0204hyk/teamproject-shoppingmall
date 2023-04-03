# :pushpin: 오노레 쇼핑몰 프로젝트
>스프링을 활용한 남성 수제화 쇼핑몰 프로젝트

관리자용 계정 ID : admin
</br>
관리자용 계정 PW : 1q2w3e4r!

</br>

## 1. 제작 기간 & 참여 인원
- 2023년 02월 10일 ~ 2023년 03월 21일
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
<div>

### 6.1. 회원가입, 로그인, 회원정보수정 구현
  - 회원가입 : 아이디 중복확인, 비밀번호 암호화, 정규표현식
  - 로그인 : 비밀번호 복호화, 세션 및 쿠키 저장
  - 아이디/비밀번호 찾기 : 이름, 아이디, 이메일 존재 여부 확인, 임시 비밀번호 생성 후 암호화 및 이메일 전송
  - 회원정보 및 비밀번호 수정 : 이메일/연락처 정규표현식, 신규 비밀번호 암호화
  - 회원탈퇴 : 세션 삭제 및 DB 삭제

### 6.2. 공지사항, About, 로케이션 구현
  - 로케이션 : 카카오 위치 API 구현 
  - 공지사항 : 게시판, 상세페이지 구현
  - About : About 페이지 구현
 
### 6.3. 상품 페이지, 파일 업로드, Qna 게시판 구현
  - 상품 페이지 카테고리 비동기 통신 구현
  - 상품 상세페이지 필요 기능 구현
  - 파일업로드 등록, 수정, 삭제 구현
  - Qna 게시판 등록, 수정, 삭제 구현
  - 에러페이지 처리 400, 404, 500
  - 네이버 클라우드 플랫폼 활용 : CentOS 7, Oracle DB 구축 / 배포
 
### 6.4. 상품 상세페이지, 페이지네이션, 후기 게시판 구현
  - 상품 상세페이지 옵션 선택, 주문하기 , 장바구니 버튼, 해당 상품 후기, 문의 구현
  - 게시판 페이지네이션 구현
  - 후기 게시판 등록, 수정, 삭제 구현
  - 마이페이지 내 후기 팝업창 구현
 
### 6.5. 장바구니, 주문 및 결제 구현
  - 장바구니 : 각 계정별 장바구니 페이지, 수량 변경, 상품 개별 주문, 선택 상품 주문, 전체 상품 주문, 선택 상품 삭제, 장바구니 비우기
  - 주문 : 주문자 및 배송지 정보 입력, 쿠폰 할인 및 포인트 할인, 결제 방식 선택
  - 결제 : 결제 API를 활용한 결제, 결제 완료 후 완료 데이터 전송
  - 주문 완료 : 주문한 상품 정보 출력

### 6.6. 관리자 페이지
  - 메인 페이지 : 주간 매출 그래프와 표, 최근 문의글, 최근 후기글 리스트 보여주기
  - 매출 통계 : 일별, 월별, 연도별 매출 통계 그래프와 매출액이 정리된 표 구현
  - 주문 : 주문 리스트 출력 및 검색, 취소/환불 처리 구현
  - 공지사항 : 공지사항 등록 기능 구현(이미지 자동 업로드), 공지사항 리스트 출력 및 검색, 삭제, 수정 기능 구현
  - 게시글 : 문의글과 후기글 리스트 출력 및 검색, 삭제 / 해당 글로 이동하여 답글 작성 가능
  - 상품 : 상품 등록 기능 구현 (썸네일 이미지, 상품 상세정보 이미지 구분하여 업로드), 상품 리스트 출력 및 카테고리 별 검색, 수정, 삭제 기능 구현
  - 회원 : 등록된 회원 리스트 출력 및 검색, 삭제 기능 구현

 <br>
 
</div>
</details>

</br>

## 7. 프로젝트 진행과정
![226591720-3eb45184-a7df-45c1-8fbd-9cf66ed1dcc5](https://user-images.githubusercontent.com/119827171/229508873-46f5a9e4-335e-4f6d-a271-e03c22435553.png)
![226591738-d8f5e39d-d4a0-45a8-aaa3-5530cbbeb3b9](https://user-images.githubusercontent.com/119827171/229508893-4fa7c1a3-0531-4f00-8c55-39e820382062.png)

<br>

