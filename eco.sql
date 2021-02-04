-- disconnect key
alter table member drop primary key cascade;
alter table admin drop primary key cascade;
alter table artist drop primary key cascade;
alter table album drop primary key cascade;
alter table bundle_master drop primary key cascade;
alter table music drop primary key cascade;
alter table theme drop primary key cascade;
alter table genre drop primary key cascade;
alter table qna drop primary key cascade;


-- drop table

drop table notice purge;
drop table qReply purge;
drop table qna purge;
drop table music_like purge;
drop table album_like purge;
drop table artist_like purge;
drop table music_reply purge;
drop table music purge;
drop table album purge;
drop table artist purge;
drop table theme purge;
drop table genre purge;
drop table bundle_master purge;
drop table bundle_detail purge;
drop table admin purge;
drop table member purge;

-- drop sequence
drop sequence member_seq;
drop sequence admin_seq;
drop sequence music_seq;
drop sequence genre_seq;
drop sequence theme_seq;
drop sequence music_reply_seq;
drop sequence album_seq;
drop sequence artist_seq;
drop sequence qna_seq;
drop sequence notice_seq;
drop sequence qReply_seq;
drop sequence bundle_master_seq;
drop sequence bundle_detail_seq;

-- create sequence
create sequence member_seq start with 1;
create sequence admin_seq start with 1;
create sequence music_seq start with 1;
create sequence genre_seq start with 1;
create sequence theme_seq start with 1;
create sequence music_reply_seq start with 1;
create sequence album_seq start with 1;
create sequence artist_seq start with 1;
create sequence qna_seq start with 1;
create sequence notice_seq start with 1;
create sequence qReply_seq start with 1;
create sequence bundle_master_seq start with 1;
create sequence bundle_detail_seq start with 1;

-- create table
create table member(
	useq number(5) primary key,
	id varchar2(50) unique not null,
	pw varchar2(20) not null,
	name varchar2(30) not null,
	phone varchar2(13) unique not null,
	gender varchar2(1) not null,
	membership varchar2(1) default 'N' not null, -- Y, N
	indate date default sysdate
);

create table admin(
	aseq number(3) primary key,
	id varchar2(20) not null,
	pw varchar2(20) not null
);

create table genre(
	gseq number(5) primary key,
	genre varchar2(30) unique not null
);

create table theme(
	tseq number(5) primary key,
	theme varchar2(30) unique not null
);

create table artist (
	atseq number(5) primary key,
	name varchar2(30) not null,
	groupyn varchar2(1) not null, -- Y: 그룹, N: 솔로
	gender varchar2(1) not null, -- M: 남성, F: 여성, A: 혼성
	gseq number(5) references genre(gseq),
	img varchar2(50),
	description varchar2(1000)
);

create table album (
	abseq number(5) primary key,
	atseq number(5) references artist(atseq),
	title varchar2(50) not null,
	img varchar2(50),
	content varchar2(1000),
	pdate date default  sysdate
);

-- TODO: 뮤직관련 화면별에서 사용할 VIEW 필요
create table music(
	mseq number(5) primary key,
	abseq number(5) references album(abseq),
	atseq number(5) references artist(atseq),
	gseq number(5) references genre(gseq),
	title varchar2(30) not null,
	content varchar2(1000), -- 가사
	theme varchar2(50),
	titleyn varchar2(1) -- Y: 타이틀, N: 일반
);

-- TODO: 리스트에 들어갈 뷰필요(화면에서 요구하는정도만,, 대신 유저의 리스트일경우, 사이트의 리스트일경우 구분하여 조회)

-- 리스트 역할 마스터 테이블(유저번호 존재시 내 리스트, 유저번호 없을시 사이트내의 리스트)
-- TODO: 재생목록같은경우에는 세션에서만 제공하기로? 팀회의시 의견물어보기
create table bundle_master (
	bmseq number(5) primary key,
	useq number(5) not null, -- 0: 관리자에서 추가한 리스트, 유저시퀀스: 유저의 개인 리스트
	title varchar2(100), -- 그리움 가득한 밤 문득 생각나는 발라드
	useyn varchar2(1) default 'Y', -- 사용여부 (사이트내의 리스트일 경우에만 핸들링)
	cdate date default sysdate
);

create table bundle_detail(
	bdseq number(5) primary key,
	bmseq number(5) references bundle_master(bmseq),
	mseq number(5) references music(mseq)
);

/*
-- 리스트 안에 들어갈 곡정보포함
-- TODO: 순서 적용 필요(관리자에서 수정 추가시 드래그로 순서정리 가능하면)
*/

create table music_like(
	useq number(5) references member(useq),
	mseq number(5) references music(mseq)
);

create table album_like(
	useq number(5) references member(useq),
	abseq number(5) references album(abseq)
);

create table artist_like(
	useq number(5) references member(useq),
	atseq number(5) references artist(atseq)
);

create table music_reply(
	rseq number(5) primary key,
	mseq number(5) references music(mseq),
	useq number(5) references member(useq),
	content varchar2(1000) not null,
	wdate date default  sysdate
);

create table qna (
	qseq number(5) primary key,
	useq number(5) references member(useq),
	title varchar2(50) not null,
	content varchar2(1000),
	qna_date date default  sysdate
);

create table qReply (
	qrseq number(5) primary key,
	qseq number(5) references qna(qseq),
	aseq number(5) references admin(aseq),
	content varchar2(1000),
	qreply_date date default  sysdate
);

create table notice (
	nseq number(5) primary key,
	title varchar2(50) not null,
	content varchar2(1000),
	notice_date date default  sysdate
);

-- music view
create or replace view music_view
as
select 
    m.mseq
    , m.title
    , m.content
    , m.gseq
    , m.titleyn
    , m.theme
    , ab.abseq
    , ab.title as abtitle
    , ab.img as abimg
    , ab.content as abcontent
    , ab.pdate as pdate
    , at.atseq
    , at.name
    , at.groupyn
    , at.gender
    , at.gseq as atgseq
    , at.img as atimg
    , at.description
from music m
    left join album ab
    on m.abseq = ab.abseq
    left join artist at
    on at.atseq = m.atseq and at.atseq = ab.atseq;

-- album view
create or replace view album_view
as
select 
    ab.abseq
    , ab.title as abtitle
    , ab.img as abimg
    , ab.content as abcontent
    , ab.pdate as pdate
    , at.atseq
    , at.name
    , at.groupyn
    , at.gender
    , at.gseq as atgseq
    , at.img as atimg
    , at.description
	, g.genre as atgenre
from album ab
    left join artist at
    	on at.atseq = ab.atseq
	left join genre g
		on g.gseq = at.gseq;