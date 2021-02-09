-- disconnect key
alter table member drop primary key cascade;
alter table admin drop primary key cascade;
alter table artist drop primary key cascade;
alter table album drop primary key cascade;
alter table bundle_master drop primary key cascade;
alter table music drop primary key cascade;
alter table theme drop primary key cascade;
alter table chart drop primary key cascade;
alter table genre drop primary key cascade;
alter table qna drop primary key cascade;
alter table taste_master drop primary key cascade;
alter table taste_detail drop primary key cascade;



-- drop table
drop table notice purge;
drop table qReply purge;
drop table qna purge;
drop table taste_master purge;
drop table taste_detail purge;
drop table music_ban purge;
drop table music_like purge;
drop table album_like purge;
drop table artist_like purge;
drop table music_reply purge;
drop table music purge;
drop table album purge;
drop table artist purge;
drop table theme purge;
drop table chart purge;
drop table genre purge;
drop table bundle_master purge;
drop table bundle_detail purge;
drop table admin purge;
drop table member purge;

-- drop sequence
drop sequence taste_master_seq;
drop sequence taste_detail_seq;
drop sequence member_seq;
drop sequence admin_seq;
drop sequence music_seq;
drop sequence theme_seq;
drop sequence chart_seq;
drop sequence genre_seq;
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
create sequence theme_seq start with 1;
create sequence chart_seq start with 1;
create sequence genre_seq start with 1;
create sequence music_reply_seq start with 1;
create sequence album_seq start with 1;
create sequence artist_seq start with 1;
create sequence taste_master_seq start with 1;
create sequence taste_detail_seq start with 1;
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

-- 관리자가 곡 추가시 테마/태그를 추가하여 번들제작시 효율적으로 관리하기 위함
create table theme(
	tseq number(5) primary key,
	title varchar2(30) unique not null,
	img varchar2(100)
);

--FLO 차트 지금 급상승 중 해외 소셜 차트 ...
create table chart(
	cseq number(5) primary key,
	title varchar2(30) unique not null,
	img varchar2(100)
);

-- 국내 발라드 해외 팝 국내 댄스/일렉 국내 알앤비 국내 힙합 트로트 해외 알앤비 해외 힙합 OST/BGM 키즈 국내 인디 클래식 뉴에이지 국내 팝/어쿠스틱 해외 일렉트로닉 CCM 시원한 감성적인 슬픈 기쁜 댄스 발라드 ...
create table genre(
	gseq number(5) primary key,
	title varchar2(30) unique not null,
	img varchar2(100)
);

create table artist (
	atseq number(5) primary key,
	name varchar2(30) not null,
	groupyn varchar2(1) not null, -- Y: 그룹, N: 솔로
	gender varchar2(1) not null, -- M: 남성, F: 여성, A: 혼성
	gseq number(5) references genre(gseq),
	img varchar2(300),
	description varchar2(1000)
);

create table album (
	abseq number(5) primary key,
	atseq number(5) references artist(atseq),
	title varchar2(50) not null,
	img varchar2(500),
	content varchar2(3000),
	pdate date not null -- 앨범 발매일 필수
);

create table music(
	mseq number(5) primary key,
	abseq number(5) references album(abseq),
	atseq number(5) references artist(atseq),
	theme varchar2(1000), -- 테마/태그(복수) 구분자: |
	chart varchar2(100), 					-- 차트(복수) 구분자: |
	gseq number(5) references genre(gseq), 	-- 장르(단일)
	title varchar2(30) not null,
	content varchar2(1000), 				-- 가사
	titleyn varchar2(1), 					-- Y: 타이틀, N: 일반
	src varchar2(200) 						-- 음악 재생경로
);

-- 사이트 또는 유저의 리스트
create table bundle_master (
	bmseq number(5) primary key,
	useq number(5) not null, -- 0: 관리자에서 추가한 리스트, 유저시퀀스: 유저의 개인 리스트
	title varchar2(100),
	useyn varchar2(1) default 'Y', -- 사용여부 (사이트내의 리스트일 경우에만 핸들링)
	cdate date default sysdate
);

-- 사이트 또는 유저의 리스트에 들어갈 곡
create table bundle_detail(
	bdseq number(5) primary key,
	bmseq number(5) references bundle_master(bmseq),
	mseq number(5) references music(mseq)
);

-- 취향 마스터
create table taste_master(
	tstmseq number(5) primary key,
	useq number(5) references member(useq), -- 유저
	title varchar(50) not null, -- 취향 제목
	cdate date default sysdate
);

-- 취향 디테일
create table taste_detail(
	tstdseq number(5) primary key,
	atseq number(5), -- 아티스트(이 컬럼이 존재하면 나머지는 null이어야함.)
	cseq number(5), -- 차트(이 컬럼이 존재하면 나머지는 null이어야함.)
	gseq number(5) -- 장르(이 컬럼이 존재하면 나머지는 null이어야함.)
);

create table music_like(
	useq number(5) references member(useq),
	mseq number(5) references music(mseq),
	cdate date default sysdate,
	constraint music_like_pk primary key (useq, mseq) -- primary key(member.useq와 music.mseq를 조합한 복합키)
);

create table album_like(
	useq number(5) references member(useq),
	abseq number(5) references album(abseq),
	cdate date default sysdate,
	constraint album_like_pk primary key (useq, abseq) -- primary key(member.useq와 album.abseq를 조합한 복합키)
);

create table artist_like(
	useq number(5) references member(useq),
	atseq number(5) references artist(atseq),
	cdate date default sysdate,
	constraint artist_like_pk primary key (useq, atseq) -- primary key(member.useq와 artist.atseq를 조합한 복합키)
);

create table music_reply(
	rseq number(5) primary key,
	mseq number(5) references music(mseq),
	useq number(5) references member(useq),
	content varchar2(1000) not null,
	wdate date default  sysdate
);

create table music_ban(
	useq number(5) references member(useq),
	mseq number(5) references music(mseq),
	cdate date default sysdate,
	constraint music_ban_pk primary key (useq, mseq) -- primary key(member.useq와 music.mseq를 조합한 복합키)
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

-- 테이블설명 
comment on table member is '사용자';
comment on table admin is '관리자';
comment on table theme is '테마/태그';
comment on table chart is '차트';
comment on table genre is '장르';
comment on table artist is '아티스트';
comment on table album is '앨범';
comment on table music is '곡';
comment on table bundle_master is '리스트 마스터';
comment on table bundle_detail is '리스트 상세';
comment on table taste_master is '취향 마스터';
comment on table taste_detail is '취향 상세';
comment on table music_like is '곡 좋아요';
comment on table album_like is '앨범 좋아요';
comment on table artist_like is '아티스트 좋아요';
comment on table music_reply is '곡 댓글';
comment on table music_ban is '곡 차단';
comment on table qna is '질문';
comment on table qReply is '답변';
comment on table notice is '공지사항';

-- 뷰 정의

create or replace view music_view -- 뮤직
as
select 
    m.mseq
    , m.title
    , m.content
    , m.theme
	, m.chart
	, m.gseq
    , m.titleyn
	, m.src
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
	, g.title as gtitle
from music m
    left join album ab
    on m.abseq = ab.abseq
    left join artist at
    on at.atseq = m.atseq and at.atseq = ab.atseq
	left join genre g
	on g.gseq = at.gseq;

create or replace view album_view -- 앨범
as
select 
    ab.abseq
    , ab.title
    , ab.img
    , ab.content
    , ab.pdate
    , at.atseq
    , at.name
    , at.groupyn
    , at.gender
    , at.gseq as atgseq
    , at.img as atimg
    , at.description
	, g.title as atgenre
from album ab
    left join artist at
    	on at.atseq = ab.atseq
	left join genre g
		on g.gseq = at.gseq;

create or replace view likemusic_view
as
select 
    m.mseq
    , m.title
    , m.gseq
    , ab.img
    , at.atseq
    , at.name
    , ml.useq
	from music_like ml, album ab, artist at, music m
	where ab.atseq = at.atseq and m.mseq = ml.mseq;

select * from likemusic_view;

create or replace view likeartist_view
as
select 
    at.atseq
	, at.name
	, at.groupyn
	, at.gender
	, at.gseq
	, at.img
	, al.useq
	from artist at, artist_like al
	where al.atseq = at.atseq;

select * from likeartist_view;

create or replace view likealbum_view
as
select 
    ab.abseq
    , ab.atseq
    , ab.title
    , ab.img
	, ab.pdate
	, at.name
	, at.gseq
	, abl.useq
	from album ab, album_like abl, artist at
	where abl.abseq = ab.abseq and ab.atseq = at.atseq;