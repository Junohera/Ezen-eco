create table eco_user(
	useq number(5) primary key,
	email varchar2(50),
	pw varchar2(20),
	name varchar2(30),
	phone varchar2(13),
	membership varchar2(1)
);

create sequence eco_user_seq start with 1;

create table eco_admin(
	aseq number(3) primary key,
	id varchar2(20),
	pw varchar2(20)
);



create sequence eco_admin_seq start with 1;

create table eco_music(
	mseq number(5) primary key,
	abseq number(5),
	atseq number(5),
	gseq number(2),
	title varchar2(30),
	content varchar2(1000),
	theme varchar2(3)
);

create sequence eco_music_seq start with 1;

create table eco_genre(
	gseq number(5) primary key,
	genre varchar2(30)
);

create sequence eco_genre_seq start with 1;

create table eco_theme(
	tseq number(5) primary key,
	theme varchar2(30)
);

create sequence eco_theme_seq start with 1;

create table eco_music_reply(
	rseq number(5) primary key,
	mseq number(5),
	useq number(5),
	content varchar2(1000),
	wdate date default  sysdate
);

create sequence eco_music_reply_seq start with 1;

create table eco_music_like(
	mseq number(5),
	useq number(5)
);

create table eco_album_like(
	useq number(5),
	abseq number(5)
);

create table eco_artist_like(
	useq number(5),
	atseq number(5)
);

create table eco_album (
	abseq number(5) primary key,
	atseq number(5),
	title varchar2(50),
	img varchar2(50),
	pdate date default  sysdate,
	content varchar2(1000)
);

create sequence eco_album_seq start with 1;

create table eco_artist (
	atseq number(5) primary key,
	name varchar2(5),
	groupyn varchar2(50),
	gender varchar2(10),
	img varchar2(50),
	description varchar2(1000)
);

create sequence eco_artist_seq start with 1;

create table eco_qna (
	qseq number(5) primary key,
	useq number(5),
	title varchar2(50),
	content varchar2(1000),
	qna_date date default  sysdate
);

create sequence eco_qna_seq start with 1;

create table eco_notice (
	nseq number(5) primary key,
	title varchar2(50),
	content varchar2(1000),
	notice_date date default  sysdate
);

create sequence eco_notice_seq start with 1;

create table eco_qReply (
	qrseq number(5) primary key,
	qseq number(5),
	useq number(5),
	content varchar2(1000),
	qreply_date date default  sysdate
);

create sequence eco_qReplyseq start with 1;
