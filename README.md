# 미니
## 목차

### 1. 프로젝트 개요

- 프로젝트 개요
- 프로젝트 목표
- 프로젝트 일정
- 프로젝트 범위

### 2. 개발환경

- 컴퓨터의 환경
- 프로그램의 툴

### 3. 기능 설명

- 홈페이지 UI, UX
- 진료예약
    - 예약, 수정, 취소, 예약 보기
- 회원관리
    - 회원가입, 로그인, 정보수정, 탈퇴
- 활용정보항목
    - 개인정보 활용
    - 이름, 전화번호, 성별, 기저질환, 보호자 이름 , 보호자 전화번호
- 게시판
    - 공지사항 작성(글 제목, 글 작성자, 글 내용, 작성일) -의사
        - 공지사항 작성 / 삭제
    - Q&A 작성 ( 제목, 작성자, 내용, 작성일 )
        - Q&A 작성 - 사용자
        - Q&A 답글작성 - 의사

### 4. 파일 항목설명

- 데이터 베이스 (SQL)
- Java (헨들러)
- Jsp (페이지)

### 5.  권한과 부여 설정

- 사용자 (USER)
- 의사 (DOCTOR)
- 관리자 (NURSE)

### 6. 클래스 다이어그램

### 7. 시퀀스 다이어그램

### 8. ER 다이어그램

## 1. 프로젝트 개요

---

### 1.1 프로젝트 개요

### 1.2 프로젝트 목표 및 목적

- 병원 웹사이트 제작에 대한 팀장 임두혁 의 욕심
    - 예약 기능에 대한 구현 궁금증 ( 팀장 팀원 모두 같은 의견 )
    - 대형 병원과 소형 병원의 사이트 차이.. 등 참고하여 제작
- 로그인 기능 구현 연습
    - java Spring을 이용하여 로그인 기능 구현 경험을 쌓는다
- 게시판( 공지사항, 문의 ) 기능 구현 연습
    - java Spring을 이용하여 게시판 기능 구현 경험을 쌓는다
- 예약 기능 구현 연습
    - 어떤 방법으로 구현할지 팀원들과 모의,모색하고 구현 하기
- 프론트단 구현 연습에 대한 팀원 한강희 의 욕심
    - 다양한 사이트를 참고하여 생제작하기

- sql
```sql
create table justdo_user (
      user_id varchar2(100) primary key,
      user_passwd varchar2(30) not null,
      user_name varchar2(100) not null,
      user_tel varchar2(20),
      user_gender varchar2(100) not null,
      user_dis varchar2(100),
      user_p_name varchar(100),
      user_p_tel varchar(30)
   );

create table justdo_doctor (
      dr_id varchar2(20) primary key,
      dr_passwd varchar2(20) not null,
      dr_name varchar2(20) not null,
      dr_tel varchar2(20) not null,
      dr_major varchar(30) not null
   );

insert into justdo_doctor values('doctor', 'doctor', '김영식', '010-1111-1111', '내과');
insert into justdo_doctor values('doctor1', 'doctor1', '함형일', '010-2222-2222', '이비인후과');

create table justdo_reserv(
      re_num number primary key,
      re_date varchar2(30) not null,
      re_time varchar2(30) not null,
      re_reg_date date not null,
      re_col varchar(1000),
      user_id varchar2(30),
      dr_id varchar2(20)
   );

CREATE SEQUENCE justdo_reserv_seq
           INCREMENT BY 1
           START WITH   1
           MAXVALUE 999999
           NOCYCLE
           NOCACHE;

create table justdo_board(
      b_no number primary key,
      b_title varchar2(1000) not null,
      b_write varchar2(4000) not null,
      b_reg_date date not null,
      readcount number default 0,
      ref number not null,
      re_step number not null,
      re_level number not null,
      fk_user_id1 varchar2(20),
      fk_dr_id1 varchar(20)
);

CREATE SEQUENCE justdo_board_seq
           INCREMENT BY 1
           START WITH   1
           MAXVALUE 999999
           NOCYCLE
           NOCACHE;

create table justdo_notice(
      not_no number primary key,
      not_title varchar2(1000) not null,
      not_write varchar2(4000) not null,
      not_reg_date date not null,
      readcount number default 0,
      ref number not null,
      re_step number not null,
      re_level number not null,
      fk_dr_id2 varchar2(20)
   );

CREATE SEQUENCE justdo_notice_seq
           INCREMENT BY 1
           START WITH   1
           MAXVALUE 999999
           NOCYCLE
           NOCACHE;

commit;
```
