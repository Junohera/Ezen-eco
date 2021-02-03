-- disconnect key
alter table eco_user drop primary key cascade;
alter table eco_admin drop primary key cascade;
alter table eco_artist drop primary key cascade;
alter table eco_album drop primary key cascade;
alter table eco_bundle_master drop primary key cascade;
alter table eco_music drop primary key cascade;
alter table eco_theme drop primary key cascade;
alter table eco_genre drop primary key cascade;
alter table eco_qna drop primary key cascade;


-- drop table

drop table eco_notice purge;
drop table eco_qReply purge;
drop table eco_qna purge;
drop table eco_music_like purge;
drop table eco_album_like purge;
drop table eco_artist_like purge;
drop table eco_music_reply purge;
drop table eco_music purge;
drop table eco_album purge;
drop table eco_artist purge;
drop table eco_theme purge;
drop table eco_genre purge;
drop table eco_bundle_master purge;
drop table eco_bundle_detail purge;
drop table eco_admin purge;
drop table eco_user purge;

-- drop sequence
drop sequence eco_user_seq;
drop sequence eco_admin_seq;
drop sequence eco_music_seq;
drop sequence eco_genre_seq;
drop sequence eco_theme_seq;
drop sequence eco_music_reply_seq;
drop sequence eco_album_seq;
drop sequence eco_artist_seq;
drop sequence eco_qna_seq;
drop sequence eco_notice_seq;
drop sequence eco_qReply_seq;
drop sequence eco_bundle_master_seq;
drop sequence eco_bundle_detail_seq;

-- create sequence
create sequence eco_user_seq start with 1;
create sequence eco_admin_seq start with 1;
create sequence eco_music_seq start with 1;
create sequence eco_genre_seq start with 1;
create sequence eco_theme_seq start with 1;
create sequence eco_music_reply_seq start with 1;
create sequence eco_album_seq start with 1;
create sequence eco_artist_seq start with 1;
create sequence eco_qna_seq start with 1;
create sequence eco_notice_seq start with 1;
create sequence eco_qReply_seq start with 1;
create sequence eco_bundle_master_seq start with 1;
create sequence eco_bundle_detail_seq start with 1;

-- create table
create table eco_user(
	useq number(5) primary key,
	email varchar2(50) unique not null,
	pw varchar2(20) not null,
	name varchar2(30) not null,
	phone varchar2(13) unique not null,
	gender varchar2(1) not null,
	membership varchar2(1) default 'N' not null, -- Y, N
	indate date default sysdate
);

create table eco_admin(
	aseq number(3) primary key,
	id varchar2(20) not null,
	pw varchar2(20) not null
);

create table eco_genre(
	gseq number(5) primary key,
	genre varchar2(30) unique not null
);

create table eco_theme(
	tseq number(5) primary key,
	theme varchar2(30) unique not null
);

create table eco_artist (
	atseq number(5) primary key,
	name varchar2(30) not null,
	groupyn varchar2(1) not null, -- Y: 그룹, N: 솔로
	gender varchar2(1) not null, -- M: 남성, F: 여성, A: 혼성
	img varchar2(50),
	description varchar2(1000)
);

create table eco_album (
	abseq number(5) primary key,
	atseq number(5) references eco_artist(atseq),
	title varchar2(50) not null,
	img varchar2(50),
	content varchar2(1000),
	pdate date default  sysdate
);

-- TODO: 뮤직관련 화면별에서 사용할 VIEW 필요
create table eco_music(
	mseq number(5) primary key,
	abseq number(5) references eco_album(abseq),
	atseq number(5) references eco_artist(atseq),
	gseq number(5) references eco_genre(gseq),
	title varchar2(30) not null,
	content varchar2(1000), -- 가사
	theme varchar2(50),
	titleyn varchar2(1) -- Y: 타이틀, N: 일반
);

-- TODO: 리스트에 들어갈 뷰필요(화면에서 요구하는정도만,, 대신 유저의 리스트일경우, 사이트의 리스트일경우 구분하여 조회)

-- 리스트 역할 마스터 테이블(유저번호 존재시 내 리스트, 유저번호 없을시 사이트내의 리스트)
-- TODO: 재생목록같은경우에는 세션에서만 제공하기로? 팀회의시 의견물어보기
create table eco_bundle_master (
	bmseq number(5) primary key,
	useq number(5), -- null: 관리자에서 추가한 리스트, 유저시퀀스: 유저의 개인 리스트
	title varchar2(100), -- 그리움 가득한 밤 문득 생각나는 발라드
	useyn varchar2(1) default 'Y', -- 사용여부 (사이트내의 리스트일 경우에만 핸들링)
	cdate date default sysdate
);

create table eco_bundle_detail(
	bdseq number(5) primary key,
	bmseq number(5) references eco_bundle_master(bmseq),
	mseq number(5) references eco_music(mseq)
);

/*
-- 리스트 안에 들어갈 곡정보포함
-- TODO: 순서 적용 필요(관리자에서 수정 추가시 드래그로 순서정리 가능하면)
*/

create table eco_music_like(
	useq number(5) references eco_user(useq),
	mseq number(5) references eco_music(mseq)
);

create table eco_album_like(
	useq number(5) references eco_user(useq),
	abseq number(5) references eco_album(abseq)
);

create table eco_artist_like(
	useq number(5) references eco_user(useq),
	atseq number(5) references eco_artist(atseq)
);

create table eco_music_reply(
	rseq number(5) primary key,
	mseq number(5) references eco_music(mseq),
	useq number(5) references eco_user(useq),
	content varchar2(1000) not null,
	wdate date default  sysdate
);

create table eco_qna (
	qseq number(5) primary key,
	useq number(5) references eco_user(useq),
	title varchar2(50) not null,
	content varchar2(1000),
	qna_date date default  sysdate
);

create table eco_qReply (
	qrseq number(5) primary key,
	qseq number(5) references eco_qna(qseq),
	aseq number(5) references eco_admin(aseq),
	content varchar2(1000),
	qreply_date date default  sysdate
);

create table eco_notice (
	nseq number(5) primary key,
	title varchar2(50) not null,
	content varchar2(1000),
	notice_date date default  sysdate
);