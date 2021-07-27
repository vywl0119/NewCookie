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
q_main varchar2(100) not null,
q_sub varchar2(100),
constraint QnA_q_number_pk primary key(q_number),
constraint QnA_q_main_uk unique(q_main)
)

2-2. QnA 시퀀스 생성
create sequence qna_seq
		increment by 1

2-3. 테스트 값 넣기
insert into qna values(qna_seq.nextval,'test','test')

drop table qna cascade constraints;
drop sequence qna_seq;

2-4. 확인
select * from qna

2-5. 값 넣기
insert into qna values(qna_seq.nextval,'자신만의 스트레스 해소법이 있나요?','');
insert into qna values(qna_seq.nextval,'타인과 협업해서 프로젝트를 해본 경험이 있나요?','있었다면 프로젝트 속 자신의 역할은 무엇이였나요?');
insert into qna values(qna_seq.nextval,'삶을 살아가면서 가장 기뻤던 일은 무엇이었나요?','');
insert into qna values(qna_seq.nextval,'어린 시절 꿈은 무엇이었나요?','');
insert into qna values(qna_seq.nextval,'평소 갈등을 해결하는 방안은 무엇인가요?','타인의 갈등에 나선 적이 있나요?');
insert into qna values(qna_seq.nextval,'가장 열정적으로 했던 일은 무엇인가요?','결과에 만족했나요?');




