-- disconnect key
alter table eco_notice drop primary key cascade;
alter table eco_qReply drop primary key cascade;
alter table eco_qna drop primary key cascade;
alter table eco_music_reply drop primary key cascade;
alter table eco_music drop primary key cascade;
alter table eco_album drop primary key cascade;
alter table eco_artist drop primary key cascade;
alter table eco_theme drop primary key cascade;
alter table eco_genre drop primary key cascade;
alter table eco_admin drop primary key cascade;
alter table eco_user drop primary key cascade;

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

create table eco_music(
	mseq number(5) primary key,
	abseq number(5) references eco_album(abseq),
	atseq number(5) references eco_artist(atseq),
	gseq number(5) references eco_genre(gseq),
	title varchar2(30) not null,
	content varchar2(1000),
	theme varchar2(50),
	titleyn varchar2(1) -- Y: 타이틀, N: 일반
);

create table eco_music_reply(
	rseq number(5) primary key,
	mseq number(5) references eco_music(mseq),
	useq number(5) references eco_user(useq),
	content varchar2(1000) not null,
	wdate date default  sysdate
);

create table eco_music_like(
	mseq number(5) references eco_music(mseq),
	useq number(5) references eco_user(useq)
);

create table eco_album_like(
	useq number(5) references eco_user(useq),
	abseq number(5) references eco_album(abseq)
);

create table eco_artist_like(
	useq number(5) references eco_user(useq),
	atseq number(5) references eco_artist(atseq)
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