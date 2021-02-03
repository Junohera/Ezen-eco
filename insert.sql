insert into eco_admin(aseq, id, pw) values(eco_admin_seq.nextval, 'admin', 'admin');
insert into eco_user(useq, email, pw, name, phone, gender) values(eco_user_seq.nextval, 'selectjuno@gmail.com', '1234', 'juno', '010-2172-7798', 'M');
insert into eco_theme(tseq, theme) values(eco_theme_seq.nextval, '시원한');
insert into eco_theme(tseq, theme) values(eco_theme_seq.nextval, '감성적인');
insert into eco_theme(tseq, theme) values(eco_theme_seq.nextval, '슬픈');
insert into eco_theme(tseq, theme) values(eco_theme_seq.nextval, '기쁜');
insert into eco_theme(tseq, theme) values(eco_theme_seq.nextval, 'FLO 차트');
insert into eco_theme(tseq, theme) values(eco_theme_seq.nextval, '지금 급상승 중');
insert into eco_theme(tseq, theme) values(eco_theme_seq.nextval, '해외 소셜 차트');
insert into eco_theme(tseq, theme) values(eco_theme_seq.nextval, '국내 발라드');
insert into eco_theme(tseq, theme) values(eco_theme_seq.nextval, '해외 팝');
insert into eco_theme(tseq, theme) values(eco_theme_seq.nextval, '국내 댄스/일렉');
insert into eco_theme(tseq, theme) values(eco_theme_seq.nextval, '국내 알앤비');
insert into eco_theme(tseq, theme) values(eco_theme_seq.nextval, '국내 힙합');
insert into eco_theme(tseq, theme) values(eco_theme_seq.nextval, '트로트');
insert into eco_theme(tseq, theme) values(eco_theme_seq.nextval, '해외 알앤비');
insert into eco_theme(tseq, theme) values(eco_theme_seq.nextval, '해외 힙합');
insert into eco_theme(tseq, theme) values(eco_theme_seq.nextval, 'OST/BGM');
insert into eco_theme(tseq, theme) values(eco_theme_seq.nextval, '키즈');
insert into eco_theme(tseq, theme) values(eco_theme_seq.nextval, '국내 인디');
insert into eco_theme(tseq, theme) values(eco_theme_seq.nextval, '클래식');
insert into eco_theme(tseq, theme) values(eco_theme_seq.nextval, '뉴에이지');
insert into eco_theme(tseq, theme) values(eco_theme_seq.nextval, '국내 팝/어쿠스틱');
insert into eco_theme(tseq, theme) values(eco_theme_seq.nextval, '해외 일렉트로닉');
insert into eco_theme(tseq, theme) values(eco_theme_seq.nextval, 'CCM');
insert into eco_genre(gseq, genre) values(eco_genre_seq.nextval, '댄스');
insert into eco_genre(gseq, genre) values(eco_genre_seq.nextval, '발라드');
insert into eco_artist(atseq, name, groupyn, gender, img, description) values(eco_artist_seq.nextval, 'Ed Sheeran', 'N', 'M', null, '아티스트 소개');
insert into eco_artist_like(useq, atseq) values(1, 1);
insert into eco_album(abseq, atseq, title, img, content) values(eco_album_seq.nextval, 1, 'First Album', null, '앨범소개');
insert into eco_album_like(useq, abseq) values(1, 1);
insert into eco_music(mseq, abseq, atseq, gseq, title, content, theme, titleyn) values(eco_music_seq.nextval, 1, 1, 1, 'Lego House', '엄청난 첫번째노래 정보', '1|4|5|6|7|9', 'Y');
insert into eco_music(mseq, abseq, atseq, gseq, title, content, theme, titleyn) values(eco_music_seq.nextval, 1, 1, 1, 'One', '엄청난 두번째노래 정보', '2|3|5|6|7|9', 'N');
insert into eco_music_like(mseq, useq) values(1, 1);
insert into eco_music_reply(rseq, mseq, useq, content) values(eco_music_reply_seq.nextval, 1, 1, '개조아여');
insert into eco_music_reply(rseq, mseq, useq, content) values(eco_music_reply_seq.nextval, 2, 1, '역시... 뒤집어 놓으다.. 음정, 박자.. 와...');
insert into eco_bundle_master(bmseq, useq, title, useyn) values (eco_bundle_master_seq.nextval, 1, '그리움 가득한 밤 문득 생각나는 발라드', 'Y');
insert into eco_bundle_detail(bdseq, bmseq, mseq) values (eco_bundle_detail_seq.nextval, 1, 1);
insert into eco_bundle_detail(bdseq, bmseq, mseq) values (eco_bundle_detail_seq.nextval, 1, 2);
insert into eco_qna(qseq, useq, title, content) values(eco_qna_seq.nextval, 1, '블루투스 연결은 어떻게 하나요?', '안녕하세요. 해당 웹을 10년간 이용해온 사용자인데요. 혹시 블루투스 연결은 안되나요?');
insert into eco_qReply(qrseq, qseq, aseq, content) values(eco_qReply_seq.nextval, 1, 1, '컴퓨터에 블루투스 장치가 연결되었는지 확인하여주시고, 연결되었음에도 들리지않는다면 해당 장치의 문제이므로 저희사이트와는 무관한 증상입니다.');
insert into eco_notice(nseq, title, content) values(eco_notice_seq.nextval, 'title', 'content');