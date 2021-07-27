1. 회원 테이블

1-1. 회원 테이블 생성

create table member(
m_id varchar2(20),
m_pw varchar2(20) not null,
name varchar2(10) not null,
nickname varchar2(10) not null,
birth date not null,
gender varchar2(5) not null,
email varchar2(20) not null,
constraint member_m_id_pk primary key(m_id),
constraint member_gender_ck check(gender in ('M', 'W')),
constraint member_nickname_uk unique(nickname),
constraint member_email_uk unique(email)
);


1-2. 테스트 값 넣기
insert into member values('test', 'test', 'test', 'test', '21-07-26', 'W', 'test')

insert into member values(?,?,?,?,?,?,?)

1-3. 확인
select * from member

2. QnA 테이블

2-1. QnA 테이블 생성
create table QnA(
q_number number,
q_main varchar2(50) not null,
q_sub varchar2(50),
constraint QnA_q_number_pk primary key(q_number),
constraint QnA_q_main_uk unique(q_main)
)

2-2. QnA 시퀀스 생성
create sequence qna_seq
				increment by 1

2-3. 테스트 값 넣기
insert into qna values(qna_seq.nextval,'test','test')

2-4. 확인
select * from qna


