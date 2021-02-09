-- member
insert into member(useq, id, pw, name, phone, gender) values(member_seq.nextval, 'selectjuno@gmail.com', '1234', 'juno', '010-2172-7798', 'M');

-- admin
insert into admin(aseq, id, pw) values(admin_seq.nextval, 'admin', 'admin');

-- theme
insert into theme(tseq, title) values(theme_seq.nextval, '시원한');
insert into theme(tseq, title) values(theme_seq.nextval, '감성적인');
insert into theme(tseq, title) values(theme_seq.nextval, '슬픈');
insert into theme(tseq, title) values(theme_seq.nextval, '기쁜');
insert into theme(tseq, title) values(theme_seq.nextval, '술마실때');
insert into theme(tseq, title) values(theme_seq.nextval, '퇴근길');
insert into theme(tseq, title) values(theme_seq.nextval, '비');
insert into theme(tseq, title) values(theme_seq.nextval, '눈');
insert into theme(tseq, title) values(theme_seq.nextval, '운전');
insert into theme(tseq, title) values(theme_seq.nextval, '새벽');
insert into theme(tseq, title) values(theme_seq.nextval, '몽환');
insert into theme(tseq, title) values(theme_seq.nextval, '눙물');
insert into theme(tseq, title) values(theme_seq.nextval, 'ㅠㅠ');
insert into theme(tseq, title) values(theme_seq.nextval, 'ㄱㅇㄷ');

-- chart
insert into chart(cseq, title, img) values(chart_seq.nextval, 'FLO 차트', null);
insert into chart(cseq, title, img) values(chart_seq.nextval, '지금 급상승 중', null);
insert into chart(cseq, title, img) values(chart_seq.nextval, '해외 소셜 차트', null);

-- genre
insert into genre(gseq, title, img) values(genre_seq.nextval, '국내 발라드', null);
insert into genre(gseq, title, img) values(genre_seq.nextval, '해외 팝', null);
insert into genre(gseq, title, img) values(genre_seq.nextval, '국내 댄스/일렉', null);
insert into genre(gseq, title, img) values(genre_seq.nextval, '국내 알앤비', null);
insert into genre(gseq, title, img) values(genre_seq.nextval, '국내 힙합', null);
insert into genre(gseq, title, img) values(genre_seq.nextval, '트로트', null);
insert into genre(gseq, title, img) values(genre_seq.nextval, '해외 알앤비', null);
insert into genre(gseq, title, img) values(genre_seq.nextval, '해외 힙합', null);
insert into genre(gseq, title, img) values(genre_seq.nextval, 'OST/BGM', null);
insert into genre(gseq, title, img) values(genre_seq.nextval, '키즈', null);
insert into genre(gseq, title, img) values(genre_seq.nextval, '국내 인디', null);
insert into genre(gseq, title, img) values(genre_seq.nextval, '클래식', null);
insert into genre(gseq, title, img) values(genre_seq.nextval, '뉴에이지', null);
insert into genre(gseq, title, img) values(genre_seq.nextval, '국내 팝/어쿠스틱', null);
insert into genre(gseq, title, img) values(genre_seq.nextval, '해외 일렉트로닉', null);
insert into genre(gseq, title, img) values(genre_seq.nextval, 'CCM', null);

-- artist
insert into artist(atseq, name, groupyn, gender, gseq, img, description) values(artist_seq.nextval, 'Ed Sheeran', 'N', 'M', 1, null, '아티스트 소개');
-- album
insert into album(abseq, atseq, title, img, content) values(album_seq.nextval, 1, 'First Album', null, '앨범소개');
-- music
insert into music(mseq, abseq, atseq, theme, chart, gseq, title, content, titleyn) values(music_seq.nextval, 1, 1, '2|3', '1|2|3', 2, 'Lego House', '엄청난 첫번째노래 정보', 'Y');
insert into music(mseq, abseq, atseq, theme, chart, gseq, title, content, titleyn) values(music_seq.nextval, 1, 1, '1|4', '1|2|3', 2, 'One', '엄청난 두번째노래 정보', 'N');
<<<<<<< HEAD
=======
insert into music(mseq, abseq, atseq, theme, chart, gseq, title, content, titleyn) values(music_seq.nextval, 1, 1, '1|4', '1|2|3', 2, 'One', '엄청난 두번째노래 정보', 'N');
insert into music(mseq, abseq, atseq, theme, chart, gseq, title, content, titleyn) values(music_seq.nextval, 1, 1, '1|4', '1|2|3', 2, 'One', '엄청난 두번째노래 정보', 'N');
insert into music(mseq, abseq, atseq, theme, chart, gseq, title, content, titleyn) values(music_seq.nextval, 1, 1, '1|4', '1|2|3', 2, 'One', '엄청난 두번째노래 정보', 'N');
insert into music(mseq, abseq, atseq, theme, chart, gseq, title, content, titleyn) values(music_seq.nextval, 1, 1, '1|4', '1|2|3', 2, 'One', '엄청난 두번째노래 정보', 'N');
insert into music(mseq, abseq, atseq, theme, chart, gseq, title, content, titleyn) values(music_seq.nextval, 1, 1, '1|4', '1|2|3', 2, 'One', '엄청난 두번째노래 정보', 'N');
insert into music(mseq, abseq, atseq, theme, chart, gseq, title, content, titleyn) values(music_seq.nextval, 1, 1, '1|4', '1|2|3', 2, 'One', '엄청난 두번째노래 정보', 'N');
insert into music(mseq, abseq, atseq, theme, chart, gseq, title, content, titleyn) values(music_seq.nextval, 1, 1, '1|4', '1|2|3', 2, 'One', '엄청난 두번째노래 정보', 'N');
insert into music(mseq, abseq, atseq, theme, chart, gseq, title, content, titleyn) values(music_seq.nextval, 1, 1, '1|4', '1|2|3', 2, 'One', '엄청난 두번째노래 정보', 'N');
insert into music(mseq, abseq, atseq, theme, chart, gseq, title, content, titleyn) values(music_seq.nextval, 1, 1, '1|4', '1|2|3', 2, 'One', '엄청난 두번째노래 정보', 'N');
insert into music(mseq, abseq, atseq, theme, chart, gseq, title, content, titleyn) values(music_seq.nextval, 1, 1, '1|4', '1|2|3', 2, 'One', '엄청난 두번째노래 정보', 'N');
insert into music(mseq, abseq, atseq, theme, chart, gseq, title, content, titleyn) values(music_seq.nextval, 1, 1, '1|4', '1|2|3', 2, 'One', '엄청난 두번째노래 정보', 'N');
insert into music(mseq, abseq, atseq, theme, chart, gseq, title, content, titleyn) values(music_seq.nextval, 1, 1, '1|4', '1|2|3', 2, 'One', '엄청난 두번째노래 정보', 'N');
insert into music(mseq, abseq, atseq, theme, chart, gseq, title, content, titleyn) values(music_seq.nextval, 1, 1, '1|4', '1|2|3', 2, 'One', '엄청난 두번째노래 정보', 'N');
>>>>>>> c3d37b7c155523a8418335d93061db89524ee26a

-- bundle_master
insert into bundle_master(bmseq, useq, title, useyn) values (bundle_master_seq.nextval, 0, '그리움 가득한 밤 문득 생각나는 발라드', 'Y');
insert into bundle_master(bmseq, useq, title, useyn) values (bundle_master_seq.nextval, 0, '퇴근길에 신나는 노래', 'Y');
insert into bundle_master(bmseq, useq, title, useyn) values (bundle_master_seq.nextval, 1, '나의 리스트 1', 'Y');
insert into bundle_master(bmseq, useq, title, useyn) values (bundle_master_seq.nextval, 1, '나의 리스트 2', 'Y');

-- bundle_detail
insert into bundle_detail(bdseq, bmseq, mseq) values (bundle_detail_seq.nextval, 1, 1);
insert into bundle_detail(bdseq, bmseq, mseq) values (bundle_detail_seq.nextval, 1, 2);
insert into bundle_detail(bdseq, bmseq, mseq) values (bundle_detail_seq.nextval, 2, 1);
insert into bundle_detail(bdseq, bmseq, mseq) values (bundle_detail_seq.nextval, 2, 2);
insert into bundle_detail(bdseq, bmseq, mseq) values (bundle_detail_seq.nextval, 3, 1);
insert into bundle_detail(bdseq, bmseq, mseq) values (bundle_detail_seq.nextval, 3, 2);
insert into bundle_detail(bdseq, bmseq, mseq) values (bundle_detail_seq.nextval, 4, 1);
insert into bundle_detail(bdseq, bmseq, mseq) values (bundle_detail_seq.nextval, 4, 2);

-- taste_master
insert into taste_master(tstmseq, useq, title) values (taste_master_seq.nextval, 1, '첫번째 취향');
insert into taste_master(tstmseq, useq, title) values (taste_master_seq.nextval, 1, '두번째 취향');

-- taste_detail
insert into taste_detail(tstdseq, atseq, cseq, gseq) values (taste_detail_seq.nextval, 1, null, null);
insert into taste_detail(tstdseq, atseq, cseq, gseq) values (taste_detail_seq.nextval, null, 1, null);
insert into taste_detail(tstdseq, atseq, cseq, gseq) values (taste_detail_seq.nextval, null, 2, null);
insert into taste_detail(tstdseq, atseq, cseq, gseq) values (taste_detail_seq.nextval, null, 3, null);
insert into taste_detail(tstdseq, atseq, cseq, gseq) values (taste_detail_seq.nextval, null, null, 7);
insert into taste_detail(tstdseq, atseq, cseq, gseq) values (taste_detail_seq.nextval, null, null, 8);
insert into taste_detail(tstdseq, atseq, cseq, gseq) values (taste_detail_seq.nextval, null, null, 9);

-- music_like
insert into music_like(mseq, useq) values(1, 1);

-- album_like
insert into album_like(useq, abseq) values(1, 1);

-- artist_like
insert into artist_like(useq, atseq) values(1, 1);

-- music_reply
insert into music_reply(rseq, mseq, useq, content) values(music_reply_seq.nextval, 1, 1, '개조아여');
insert into music_reply(rseq, mseq, useq, content) values(music_reply_seq.nextval, 2, 1, '역시... 뒤집어 놓으다.. 음정, 박자.. 와...');

-- music_ban
-- insert into music_ban(useq, mseq) values(1, 1);

-- qna
insert into qna(qseq, useq, title, content) values(qna_seq.nextval, 1, '블루투스 연결은 어떻게 하나요?', '안녕하세요. 해당 웹을 10년간 이용해온 사용자인데요. 혹시 블루투스 연결은 안되나요?');

-- qReply
insert into qReply(qrseq, qseq, aseq, content) values(qReply_seq.nextval, 1, 1, '컴퓨터에 블루투스 장치가 연결되었는지 확인하여주시고, 연결되었음에도 들리지않는다면 해당 장치의 문제이므로 저희사이트와는 무관한 증상입니다.');

-- notice
insert into notice(nseq, title, content) values(notice_seq.nextval, 'title', 'content');